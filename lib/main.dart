import 'package:flutter/material.dart';
import 'package:myapp/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  bool _isHint = false;
  bool _isCheckbox = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 20),
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Registration',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                ],
              )),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input email address. | Ex. bob@gmail.com';
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input password.';
                        } else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      obscureText: !_isHint,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isHint = !_isHint;
                            });
                          },
                          child: Icon(_isHint
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.only(left: 6),
            child: Row(children: [
              Checkbox(
                  value: _isCheckbox,
                  onChanged: (value) {
                    setState(() {
                      _isCheckbox = value!;
                    });
                  }),
              Text('Remember Me')
            ]),
          ),
          SizedBox(height: 15),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(
                              email: emailController.text,
                              password: passwordController.text)));
                }
              },
              child: Container(
                width: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.login, color: Colors.white),
                    SizedBox(width: 15),
                    Text("Registration", style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              )),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Container(
                width: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.skip_next, color: Colors.black),
                    SizedBox(width: 15),
                    Text("Guest Contribution",
                        style: TextStyle(color: Colors.black))
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
