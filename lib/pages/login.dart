import 'package:flutter/material.dart';
import 'package:qwe/Components/button.dart';
import 'package:qwe/Components/colors.dart';
import 'package:qwe/Components/textfield.dart';
import 'package:qwe/Json/users.dart';
import 'package:qwe/pages/profile.dart';
import 'package:qwe/pages/signup.dart';
import 'package:qwe/SQLite/database.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usrName = TextEditingController();
  final password = TextEditingController();

  bool isChecked = false;
  bool isLoginTrue = false;

  final db = DatabaseHelper();

  login() async {
    Users? usrDetails = await db.getUser(usrName.text);
    var res = await db
        .authenticate(Users(usrName: usrName.text, password: password.text));
    if (res == true) {
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Profile(profile: usrDetails),
        ),
      );
    } else {
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFFFED7B0), // Slightly orange background color
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Log in",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Adjusted size of the image
                  Container(
                    width: 450,
                    height: 355,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          30), // Increased border radius for smoother edges
                      border: Border.all(color: primaryColor, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          30), // Ensure clipRRect has the same border radius
                      child: Image.asset("assets/pic1.png"),
                    ),
                  ),
                  SizedBox(height: 20),
                  InputField(
                    hint: "Username",
                    icon: Icons.account_circle,
                    controller: usrName,
                  ),
                  SizedBox(height: 10),
                  InputField(
                    hint: "Password",
                    icon: Icons.lock,
                    controller: password,
                    passwordInvisible: true,
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    horizontalTitleGap: 2,
                    title: Text(
                      "Remember me",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    leading: Checkbox(
                      activeColor: primaryColor,
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Button(
                    label: "LOG IN",
                    press: () {
                      login();
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  isLoginTrue
                      ? Text(
                          "Username or password is incorrect",
                          style: TextStyle(
                            color: Colors.red.shade900,
                            fontSize: 14,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
