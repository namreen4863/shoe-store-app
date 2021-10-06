// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';

import 'package:villa/flutterfire.dart';
import 'package:villa/forgot_password.dart';
import 'package:villa/homepage.dart';
import 'package:villa/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final _size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: _size.height,
      width: _size.width,
      child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  height: 200,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Shoe Palace',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: emailController,
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ForgotPassword.routeName);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                          height: 50,
                          width: 400,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: SizedBox(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                primary: Colors.white,
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              child: Text('Login'),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  User? user =
                                      await FireAuth.signInUsingEmailPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context,
                                  );
                                  if (user != null) {
                                    Navigator.pushNamed(
                                        context, Homepage.routeName);
                                  }
                                }
                              },
                            ),
                          )),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Text('Don\'t have an account?'),
                          TextButton(
                            child: Text(
                              'SignUp',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegisterScreen.routeName);
                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                    ],
                  )),
            ],
          )),
    ));
  }
}
