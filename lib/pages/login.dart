import 'package:flutter/material.dart';
import 'package:flutter_tutorial/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool isLoggedIn = false;
  final _formKey = GlobalKey<FormState>();

  handleSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoggedIn = true;
      });
      await Future.delayed(Duration(microseconds: 800));
      await Navigator.pushNamed(context, AppRoutes.homeRoute);
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.canvasColor,
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter Username', labelText: 'Username'),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Username can't be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Password can't be empty";
                        } else if (value != null && value.length < 4) {
                          return "Password must be atleast 4 characters";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter Password', labelText: 'Password'),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    // Material for giving effects
                    Material(
                      color: context.theme.buttonColor,
                      borderRadius: BorderRadius.circular(isLoggedIn ? 50 : 8),
                      // Inkwell used for making a container clickable
                      child: InkWell(
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
                        ),
                        onTap: () => handleSubmit(context),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
