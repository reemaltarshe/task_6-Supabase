import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_app/features/books/presentation/widget/author_drop_down.dart';
import 'package:supabase_app/features/books/presentation/widget/custom_text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../authors/presentation/cubit/author_cubit.dart';
import '../cubit/book_cubit.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _titleController = TextEditingController();
  final _yearController = TextEditingController();
  final _isbnController = TextEditingController();


  String? selectedAuthorId;
  List<Map<String, String>> authors = [];

  @override
  void initState() {
    super.initState();
    _loadAuthors();
  }

  Future<void> _loadAuthors() async {
    final data = await Supabase.instance.client
        .from('authors')
        .select('id, name');

    setState(() {
      authors = (data as List)
          .map(
            (e) => {
          'id': e['id'] as String,
          'name': e['name'] as String,
        },
      )
          .toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFEDECEC),
      appBar: AppBar(
        title: Text('Add New Book',style: TextStyle(color: Colors.deepPurple, fontSize: 30, fontWeight: FontWeight.w500),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
          padding:const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Book Title *' ,style: TextStyle(fontSize: 20),),
            ),
            const SizedBox(height: 6,),
            CustomTextField(
                controller: _titleController,
                hint: 'e.g.The Great',
                suffixIcon: Icon(Icons.menu_book),

            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Published Year *' ,style: TextStyle(fontSize: 20),),
            ),
            const SizedBox(height: 6,),
            CustomTextField(
              keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly,],
              helperText: 'Must be a 4-digit year',
              controller: _yearController,
                hint: 'YYYY',
              suffixIcon: Icon(Icons.calendar_month_outlined),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Author *' ,style: TextStyle(fontSize: 20),),
            ),
            const SizedBox(height: 6,),
            AuthorDropDown(
                authors: authors,
                value: selectedAuthorId,
                onChanged: (value){
                  setState(() {
                    selectedAuthorId = value;
                  });
                }
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('ISBN(Optional)' ,style: TextStyle(fontSize: 20),),
            ),
            const SizedBox(height: 6,),
            CustomTextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly,],
              controller: _isbnController,
              hint: '000-0-00-0000',
              suffixIcon: Icon(Icons.line_style),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: _onSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                icon: Icon(Icons.save,size: 25,),
                label: const Text('Save', style: TextStyle(fontSize: 25),),
              ),
            ),



          ],
        ),
      ),

    );
  }

  Future<void> _onSave() async{
    final title = _titleController.text.trim();
    final year = int.tryParse(_yearController.text.trim());

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title is required', style: TextStyle(fontSize: 18),)),
      );
      return;
    }

    if (year == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Published year must be a number',style: TextStyle(fontSize: 18))),
      );
      return;
    }

    if (selectedAuthorId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an author',style: TextStyle(fontSize: 18))),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
   try{
   await context.read<BookCubit>().addNewBook(
        title:title,
        publishedYear:year,
        authorId:selectedAuthorId!,
    );
   await context.read<AuthorCubit>().fetchauthor();


   if (mounted) Navigator.of(context).pop();

   ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Done', style: TextStyle(fontSize: 18))),
    );

   if (mounted) Navigator.of(context).pop();
  }catch (e) {
     if (mounted) Navigator.of(context).pop(); // close loading
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text(' Error: $e', style: const TextStyle(fontSize: 18))),
     );
   }

  }

}
