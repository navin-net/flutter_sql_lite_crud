
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sql_lite_crud/crud/view/note_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
        final emailController = TextEditingController();
          final passwordController = TextEditingController();

  String? email;
  String? password;
  getUser() async{
    var pref = await SharedPreferences.getInstance();
    setState(() {
      email = pref.getString('email') ?? 'admin';
      password = pref.getString('email') ?? '123';
    });
  }

@override
void initState(){
  super.initState();
  getUser();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
                child: Center(
                  child: Text(
                    'Wellcome To OldSchool',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                  hintText: 'Enter E-mail'),
              ),
              ),
                Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Enter Password'),
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CupertinoButton(
                      color: Colors.blue,
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async{
                          if (emailController.text.isEmpty||
                          passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                              content: Text('Please Enter Something...'),
                              ));
                          } else {
                            if (email == emailController.text &&
                            password == passwordController.text) {
                              // log('message');
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NoteHome(),
                              ),
                                (route) => false);
                            } else {
                              ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                content: Text('Please check emaul or password'),
                                ));
                            }
                          }
                      },
                    ),
                    ),
                ],
              ),
            ],
            ),
        ),
        ),
    );
  }
}