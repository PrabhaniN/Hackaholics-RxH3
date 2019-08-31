import 'package:abigo_mobile/screens/login/login_bloc.dart';
import 'package:abigo_mobile/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  final String method;

  IntroScreen({@required this.method});

  @override
  State<StatefulWidget> createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  bool voiceInput = false;
  bool textInput = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'What you can do?',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          backgroundColor: Color.fromRGBO(35, 153, 209, 1),
          // bottom: ,
        ),
        body: GridView.count(
          padding: EdgeInsets.all(10.0),
          crossAxisCount: 1,
          childAspectRatio: 5.0 / 2.0,
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/voice-to-text.png',
                      // width: 200.0,
                    ),
                    title: Text('Communication'),
                    onTap: _gotoLoginScreen,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  void _gotoLoginScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Provider<LoginBloc>(
          builder: (context) => LoginBloc(),
          dispose: (context, bloc) => bloc.dispose(),
          child: LoginScreen(method: widget.method),
        ),
      ),
    );
  }
}