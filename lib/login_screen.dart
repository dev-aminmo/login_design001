import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool _obscureText = true;
  IconData _iconData = Icons.visibility;
  AnimationController _controller;
  Animation _animation;
  FocusNode _focusEmail = FocusNode();
  FocusNode _focusPassword = FocusNode();
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 350, end: 50).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _focusEmail.addListener(() {
      if (_focusEmail.hasFocus) {
        print('pass has focus');
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    _focusPassword.addListener(() {
      if (_focusPassword.hasFocus) {
        print('email has focus');
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusEmail.dispose();
    _focusPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: _animation.value,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Form(
                child: Column(
                  children: [
                    Text('Welcome Back to'),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Boo',
                            style: TextStyle(color: Colors.redAccent)),
                        TextSpan(
                            text: 'Stock',
                            style: TextStyle(color: Colors.yellowAccent))
                      ]),
                    ),
                    TextFormField(
                      focusNode: _focusEmail,
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
                      focusNode: _focusPassword,
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
                        TextSpan(
                            text: '.',
                            style: TextStyle(color: Colors.redAccent))
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
