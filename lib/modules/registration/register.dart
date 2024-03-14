import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../shared/components/widgets/my_button_widget/my_button.dart';
import '../../shared/components/widgets/textfield_widget/text_input_widget.dart';
import '../chat/chat.dart';

class RegisterScreen extends StatefulWidget {
  static const screenRoute = 'register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  suffix:
                      isPasswordShow ? Icons.visibility_off : Icons.visibility,
                  hintText: "Enter Your Password",
                  onChanged: (value) {
                    password = value;
                  },
                    suffixPressed: (){
                      setState(() {
                        isPasswordShow=!isPasswordShow;
                      });
                    }
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  color: Colors.blue[800]!,
                  title: "Register",
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      Navigator.pushNamed(context, ChatScreen.screenRoute);
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
