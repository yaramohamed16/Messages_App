import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messages_app/modules/chat/chat.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../shared/components/widgets/my_button_widget/my_button.dart';
import '../../shared/components/widgets/textfield_widget/text_input_widget.dart';

class SignInScreen extends StatefulWidget {
  static const screenRoute = 'sign_in';

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  bool showSpinner = false;
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 180,
                  child: Image.asset("assets/images/logo.png"),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextInput(
                  type: TextInputType.emailAddress,
                  hintText: "Enter Your Email",
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextInput(
                    type: TextInputType.text,
                    isPassword: isPasswordShow,
                    suffix: isPasswordShow
                        ? Icons.visibility_off
                        : Icons.visibility,
                    hintText: "Enter Your Password",
                    onChanged: (value) {
                      password = value;
                    },
                    suffixPressed: () {
                      setState(() {
                        isPasswordShow = !isPasswordShow;
                      });
                    }),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  color: Colors.yellow[900]!,
                  title: "Sign In",
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushReplacementNamed(
                            context, ChatScreen.screenRoute);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                )
              ]),
        ),
      ),
    );
  }
}
