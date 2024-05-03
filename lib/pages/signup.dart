import 'package:flutter/material.dart';
import 'package:qwe/Components/button.dart';
import 'package:qwe/Components/colors.dart';
import 'package:qwe/Components/textfield.dart';
import 'package:qwe/Json/users.dart';
import 'package:qwe/pages/login.dart';
import 'package:qwe/SQLite/database.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final fullName = TextEditingController();
  final email = TextEditingController();
  final usrName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final db = DatabaseHelper();

  signUp() async {
    var res = await db.createUser(Users(
      fullName: fullName.text,
      email: email.text,
      usrName: usrName.text,
      password: password.text,
    ));
    if (res > 0) {
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFED7B0),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Register New Account",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InputField(
                    hint: "Full name",
                    icon: Icons.person,
                    controller: fullName,
                  ),
                  InputField(
                    hint: "Email",
                    icon: Icons.email,
                    controller: email,
                  ),
                  InputField(
                    hint: "Username",
                    icon: Icons.account_circle,
                    controller: usrName,
                  ),
                  InputField(
                    hint: "Password",
                    icon: Icons.lock,
                    controller: password,
                    passwordInvisible: true,
                  ),
                  InputField(
                    hint: "Re-enter password",
                    icon: Icons.lock,
                    controller: confirmPassword,
                    passwordInvisible: true,
                  ),
                  SizedBox(height: 20),
                  Button(
                    label: "SIGN UP",
                    press: () {
                      signUp();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text("Log in",
                            style: TextStyle(color: primaryColor)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
