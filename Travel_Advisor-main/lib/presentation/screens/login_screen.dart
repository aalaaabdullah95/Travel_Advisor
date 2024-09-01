import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel__advisor/presentation/widget/button_widgit.dart';
import 'package:travel__advisor/presentation/widget/custom_text_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? username;
  String? password;
  bool isLoading = false;
  bool obSecure = true;
  GlobalKey<FormState> globelKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Container(
            color: const Color.fromRGBO(3, 27, 63, 1),
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Form(
                key: globelKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 170, 170, 170),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    custom_text_feild(
                      onChanged: (data) {
                        username = data;
                      },
                      labelText: 'UserName',
                      prefixIcon: const Icon(Icons.person),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    custom_text_feild(
                      onChanged: (data) {
                        password = data;
                      },
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.password),
                      obSecured: obSecure,
                      suffexIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obSecure = !obSecure;
                          });
                        },
                        icon: obSecure
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.remove_red_eye_sharp),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ButtonWidget(
                      onTap: () async {
                        if (globelKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: username!, password: password!);
                            Navigator.pushNamed(context, 'Home Page');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              Fluttertoast.showToast(
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  msg: 'No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              Fluttertoast.showToast(
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  msg:
                                      'Wrong password provided for that user.');
                            } else {
                              print(
                                  'FirebaseAuthException: ${e.code}, ${e.message}');
                              Fluttertoast.showToast(
                                msg: e.message ?? 'An error occurred',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          }

                          setState(() {
                            isLoading = false;
                          });
                        } else {}
                      },
                      text: 'LOGIN',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'if you  have did not account ',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(
                                color: Color.fromARGB(255, 147, 135, 135),
                                fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
