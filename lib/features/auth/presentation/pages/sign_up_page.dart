import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_app/core/widget/nav_bar/nav_bar.dart';
import 'package:supabase_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:supabase_app/features/books/presentation/widget/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController= TextEditingController();
  final _passController=TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFEDECEC),
      appBar: AppBar(title:const Text('Sign Up',style: TextStyle(color: Colors.deepPurple, fontSize: 30, fontWeight: FontWeight.w500)),
        elevation: 0,
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: BlocConsumer<AuthCubit,AuthState>(
          listener: (context,state){
            if(state is AuthSuccess){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const NavBar()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Account created ')),
              );
            }
            if(state is AuthError){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context,state){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email :"),
                const SizedBox(height: 6,),
                CustomTextField(
                    controller: _emailController,
                    hint: 'Enter email please'
                ),
                const SizedBox(height: 20,),
               const Text("Password :"),
                const SizedBox(height: 6,),
                CustomTextField(
                  helperText: 'Must be a strong password',
                    controller: _passController,
                    hint: 'Enter password please'
                ),
                const SizedBox(height: 24),
                if(state is AuthLoading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton.icon(
                       onPressed: (){
                         if (_emailController.text.isEmpty ||
                             _passController.text.isEmpty) {
                           ScaffoldMessenger.of(context).showSnackBar(
                             const SnackBar(content: Text('Please fill all fields')),
                           );
                           return;
                         }

                         context.read<AuthCubit>().signUp(
                         _emailController.text,
                         _passController.text,
                      );
            },
                       label:const Text('Sign Up'),
                    icon:  Icon(Icons.person_add),
                  )
              ],
            );
          }
      ),
      ),
    );
  }
}
