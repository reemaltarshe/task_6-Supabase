import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:supabase_app/features/auth/presentation/pages/sign_up_page.dart';

import '../../../../core/widget/nav_bar/nav_bar.dart';
import '../../../books/presentation/widget/custom_text_field.dart';

class SignInPage extends StatelessWidget {
  final _emailcontroller = TextEditingController();
  final _passcontroller= TextEditingController();
   SignInPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFEDECEC),
      appBar: AppBar(title: Text('Sign In ',style: TextStyle(color: Colors.deepPurple, fontSize: 30, fontWeight: FontWeight.w500)),
      elevation: 0,
      ),
      body: BlocConsumer<AuthCubit,AuthState>(
        listener: (context,state){
          if(state is AuthAuthenticated){
            Navigator.pushReplacement(
                context,
            MaterialPageRoute(builder: (_) => const NavBar())
            );
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:  Text('Done')));
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
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 15,bottom: 8),
                child: const Text("Email :" ,style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CustomTextField(
                    controller: _emailcontroller,
                    hint: 'Enter email please'
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: const Text("Password :",style: TextStyle(fontSize: 20),),
              ),
              const SizedBox(height: 6,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: CustomTextField(
                    helperText: 'Must be a strong password',
                    controller: _passcontroller,
                    hint: 'Enter password please'
                ),
              ),
              const SizedBox(height: 24),
            if(state is AuthLoading)
            const CircularProgressIndicator()
            else
              ElevatedButton.icon(
                  onPressed: (){
                    if (_emailcontroller.text.isEmpty ||
                        _passcontroller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill all fields')),
                      );
                      return;
                    }
                    context.read<AuthCubit>().signIn(
                      _emailcontroller.text,
                      _passcontroller.text,
                    );
                  },
                  label: const Text('Sign In'),
              icon: Icon(Icons.login),
              ),
              const SizedBox(height: 10),
              TextButton(
                  onPressed:(){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => SignUpPage()
                        )
                    );
                  },
                  child: Text("Don't have an account? Sign Up"))
            ],
          );

    },
      ),

    );
  }
}
