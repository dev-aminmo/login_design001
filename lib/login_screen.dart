import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  IconData _iconData = Icons.visibility;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100),
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Form(
        child: Column(
          children: [
            Text('Welcome Back to'),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Boo', style: TextStyle(color: Colors.redAccent)),
                TextSpan(
                    text: 'Stock', style: TextStyle(color: Colors.yellowAccent))
              ]),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.fiber_manual_record,
                    color: Colors.white,
                  ),
                  hintText: 'email@address.com',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.black,
                  filled: true),
            ),
            TextFormField(
              obscureText: _obscureText,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.white,
                  ),
                  suffix: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                          if (_obscureText) {
                            _iconData = Icons.visibility;
                          } else {
                            _iconData = Icons.visibility_off;
                          }
                        });
                      },
                      child: Icon(
                        _iconData,
                        color: Colors.white,
                      )),
                  hintText: '.  .  .  .  .  .  .  .  .',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.black,
                  filled: true),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.redAccent,
                child: Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(color: Colors.redAccent)),
                TextSpan(
                    text: 'Create one',
                    style: TextStyle(color: Colors.yellowAccent)),
                TextSpan(text: '.', style: TextStyle(color: Colors.redAccent))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
