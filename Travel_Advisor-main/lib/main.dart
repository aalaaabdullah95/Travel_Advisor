import 'package:flutter/material.dart';
import 'package:travel__advisor/presentation/screens/home_screen.dart';
import 'package:travel__advisor/presentation/screens/login_screen.dart';
import 'package:travel__advisor/presentation/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TravelAdvisor());
}

class TravelAdvisor extends StatelessWidget {
  const TravelAdvisor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'Signin page': (context) => const SigninScreen(),
        'Login page': (context) => const LoginScreen(),
        'Home Page': (context) => const HomeScreen(),
      },
      initialRoute: 'Signin page',
    );
  }
}
