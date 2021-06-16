import 'package:flutter/material.dart';
import 'package:grad_project/Screens/CategoryScreen.dart';
import 'package:grad_project/Screens/HomePage.dart';
import 'package:grad_project/Screens/ProductsScreen.dart';
import 'package:grad_project/Screens/SignUp.dart';
import 'package:dio/dio.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _showPassword = true;

  var _controllerEmail = TextEditingController();
  var _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 150),
            child: Image.asset(
              "assets/images/logo.png",
              scale: 10,
            ),
          ),
          //SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(right: 50, left: 50),
            child: TextFormField(
              controller: _controllerEmail,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(right: 50, left: 50),
            child: TextFormField(
              controller: _controllerPassword,
              obscureText: _showPassword,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(_showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text("Login"),
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 60),
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignUp()));
            },
            child: Text("Go SignUp"),
            style: TextButton.styleFrom(primary: Colors.black),
          )
        ],
      ),
    );
  }

  void signIn() async {
    Response response;
    var dio = Dio();

    response =
        await dio.post('http://amit-retail.amit-learning.com/api/login', data: {
      "email": _controllerEmail.text,
      "password": _controllerPassword.text,
    });
    print(response.data.toString());
  }
}
