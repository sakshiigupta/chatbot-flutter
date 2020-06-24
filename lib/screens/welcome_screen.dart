import 'package:flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'new_card.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController control;
  Animation curve;
  Animation colors;

  @override
  void initState() {
    super.initState();
    control = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(parent: control, curve: Curves.decelerate);
    colors =
        ColorTween(begin: Colors.black45, end: Colors.white).animate(control);
    control.forward();

    control.addListener(() {
      setState(() {});
      print(curve.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'transition1',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: curve.value * 50,
                  ),
                ),
                FadeAnimatedTextKit(
                  text: ['Flash', 'Flash Chat'],
                  repeatForever: true,
                  isRepeatingAnimation: true,
                  duration: Duration(milliseconds: 2000),
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            NewCard(
              colour: Colors.lightBlueAccent,
              word: 'Log In',
              onpressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            NewCard(
              colour: Colors.blueAccent,
              word: 'Registration',
              onpressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
