import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
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
            "Welcome",
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
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Enter Password', labelText: 'Password'),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    child: Text('Login'),
                    style: TextButton.styleFrom(),
                    onPressed: () {
                      print('Button Pressed');
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
