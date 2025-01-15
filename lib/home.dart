import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final email;
  final password;
  const Home({super.key, this.email, this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, left: 30, right: 15),
                  child: email != null
                      ? Text('Hi! ${email}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))
                      : Text('Guest Contribution',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                ),
              ],
            ),
            Row(
              children: [
                email == null
                    ? Container(
                        margin: EdgeInsets.only(left: 30, right: 15),
                        child: Text(
                          'Continue for registration to get more access',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ))
                    : SizedBox.shrink(),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 170,
                  height: 50,
                  margin: EdgeInsets.only(left: 30, right: 15),
                  child: TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    child: Text("Back to Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)), 
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
