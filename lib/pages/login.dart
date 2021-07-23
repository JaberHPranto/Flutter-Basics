import 'package:flutter/material.dart';
import 'package:flutter_tutorial/utils/routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter Username', labelText: 'Username'),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Enter Password', labelText: 'Password'),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  // Inkwell used for making a container clickable
                  InkWell(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: 45,
                      width: isLoggedIn ? 50 : 110,
                      alignment: Alignment.center,
                      child: isLoggedIn
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius:
                              BorderRadius.circular(isLoggedIn ? 50 : 8)),
                    ),
                    onTap: () async {
                      setState(() {
                        isLoggedIn = true;
                      });
                      await Future.delayed(Duration(microseconds: 800));
                      Navigator.pushNamed(context, AppRoutes.homeRoute);
                    },
                  )
                  // ElevatedButton(
                  //     child: Text('Login'),
                  //     style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, AppRoutes.homeRoute);
                  //     })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
