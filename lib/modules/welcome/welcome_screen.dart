import 'package:flutter/material.dart';
import 'package:messages_app/modules/registration/register.dart';
import 'package:messages_app/modules/sign_in/sign_in.dart';

import '../../shared/components/widgets/my_button_widget/my_button.dart';

class WelcomScreen extends StatefulWidget {
  static const screenRoute = "welcome_screen";
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  const Text(
                    "Message ME",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff2e386b),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                color: Colors.yellow[900]!,
                title: "Sign In",
                onPressed: () {
                  Navigator.pushNamed(context, SignInScreen.screenRoute);
                },
              ),
              MyButton(
                color: Colors.blue[800]!,
                title: "Register",
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.screenRoute);
                },
              ),
            ]),
      ),
    );
  }
}
