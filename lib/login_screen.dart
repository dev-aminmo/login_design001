import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    _animation = Tween<double>(begin: 350, end: 80).animate(_controller)
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
        width: double.infinity,
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
                    Text(
                      'Welcome Back to',
                      style: _ptSans(Colors.black, 15)
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Boo', style: _robotoStyle(Colors.redAccent)),
                        TextSpan(
                            text: 'Stock', style: _robotoStyle(Colors.yellow))
                      ]),
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.04,
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        focusNode: _focusEmail,
                        keyboardType: TextInputType.emailAddress,
                        style: _ptSans(Colors.white, 16),
                        decoration: _inputDecoration(
                            Icon(
                              Icons.fiber_manual_record,
                              color: Colors.white,
                            ),
                            'email@address.com'),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.02,
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        focusNode: _focusPassword,
                        obscureText: _obscureText,
                        style: _ptSans(Colors.white, 16),
                        decoration: _inputDecoration(
                          Transform.rotate(
                            angle: 2.1,
                            child: Icon(
                              Icons.vpn_key,
                              color: Colors.white,
                            ),
                          ),
                          '.  .  .  .  .  .  .  .  .',
                          suffix: Transform.translate(
                            offset: Offset(0, 3),
                            child: GestureDetector(
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
                                  size: 16,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        color: Colors.redAccent,
                        child: Text('SIGN IN',
                            style: _ptSans(Colors.white, 18)
                                .copyWith(letterSpacing: 1.1)),
                        onPressed: () {},
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: GoogleFonts.ptSans(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        TextSpan(
                            text: 'Create one',
                            style: GoogleFonts.ptSans(
                                fontWeight: FontWeight.w400,
                                color: Colors.blueAccent)),
                        TextSpan(
                            text: '.',
                            style: GoogleFonts.ptSans(
                                fontWeight: FontWeight.w400,
                                color: Colors.white))
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

  _inputDecoration(Widget icon, String hint, {Widget suffix = null}) {
    return InputDecoration(
        suffix: suffix,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(30.0),
          ),
        ),
        prefixIcon: icon,
        hintText: hint,
        hintStyle: _ptSans(Colors.white, 14),
        fillColor: Colors.black,
        filled: true);
  }

  TextStyle _robotoStyle(Color color) => GoogleFonts.roboto(
      fontWeight: FontWeight.w900, color: color, fontSize: 36);
  TextStyle _ptSans(Color color, double fontSize) => GoogleFonts.ptSans(
      fontWeight: FontWeight.w400, color: color, fontSize: fontSize);
}
