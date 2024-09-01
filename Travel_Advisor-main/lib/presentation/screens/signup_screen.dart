import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel__advisor/presentation/screens/login_screen.dart';
import 'package:travel__advisor/presentation/widget/button_widgit.dart';
import 'package:travel__advisor/presentation/widget/custom_text_feild.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
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
        body: Form(
          key: globelKey,
          child: Container(
              color: const Color.fromRGBO(3, 27, 63, 1),
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 100),
                child: ListView(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 170, 170, 170),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    custom_text_feild(
                      onChanged: (p0) {
                        username = p0;
                      },
                      labelText: 'UserName',
                      prefixIcon: const Icon(Icons.person),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    custom_text_feild(
                      onChanged: (p0) {
                        password = p0;
                      },
                      obSecured: obSecure,
                      labelText: 'Password',
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
                      prefixIcon: const Icon(Icons.password),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ButtonWidget(
                      onTap: () async {
                        if (globelKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: username!,
                              password: password!,
                            );
                            Navigator.pushNamed(context, 'Home Page');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              Fluttertoast.showToast(
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  msg: 'The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              Fluttertoast.showToast(
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                  msg:
                                      'The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e.toString());
                            Fluttertoast.showToast(msg: 'there was an error');
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        } else {}
                      },
                      text: 'SIGNUP',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Or continue with',
                            style: TextStyle(
                              color: Color.fromARGB(255, 147, 135, 135),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            signinAnonymously();
                          },
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: const DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                      'assets/3c67757cef723535a7484a6c7bfbfc43.jpg',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            signinWithGoogle();
                          },
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/Google_Icons-09-512.webp',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/360_F_300245953_Svih1DYJbw4v2t92EhDOTwW4LIqMghmy.jpg',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'if you have an account ',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (Context) {
                                  return const LoginScreen();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Color.fromARGB(255, 147, 135, 135),
                                fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Future<void> signinAnonymously() async {
    setState(() {
      isLoading = true;
    });

    try {
      final userCredential = await auth.signInAnonymously();
      print("Signed in with temporary account: ${userCredential.user?.uid}");
      Navigator.pushNamed(context, 'Home Page');
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          Fluttertoast.showToast(
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              textColor: Colors.white,
              fontSize: 16.0,
              msg: "Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          Fluttertoast.showToast(
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              textColor: Colors.white,
              fontSize: 16.0,
              msg: "Unknown error occurred.");
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: 'There was an error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void signinWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuth =
        await googleSignInAccount!.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuth.accessToken,
        idToken: googleSignInAuth.accessToken);
    var authResult = await auth.signInWithCredential(authCredential);
    var firebaseUser = authResult.user;
  }
}
