import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _showPassword = true;
  var _controllerEmail = TextEditingController();
  var _controllerPassword = TextEditingController();
  var _controllerName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 120),
          child: Image.asset(
            "assets/images/logo.png",
            scale: 10,
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 50, left: 50),
          child: TextFormField(
            controller: _controllerName,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: "Name",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.only(right: 50, left: 50),
          child: TextFormField(
            controller: _controllerEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Email",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
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
                  icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                ),
                hintText: "Password",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
          ),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            register();
          },
          child: Text("SignUp"),
          style: ElevatedButton.styleFrom(
              primary: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 60),
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Have an account? Go Login.",
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          style: TextButton.styleFrom(primary: Colors.black),
        )
      ],
    ));
  }

  void register() async {
    Response response;
    var dio = Dio();

    response =
        await dio.post('https://retail.amit-learning.com/api/register', data: {
      "email": _controllerEmail.text,
      "password": _controllerPassword.text,
      "name": _controllerName.text,
    });
    print(response.data.toString());
  }
}
