// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:instagram_app/screens/switch_account.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();

  @override
  void initState() {
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff323A99),
            Color(0xffF98BFC),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            _getRocketImage(),
            _getLoginText(),
          ],
        ),
      ),
    );
  }

  Widget _getRocketImage() {
    return Positioned(
      top: 76.0,
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage('images/rocket.png'),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget _getLoginText() {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff1C1F2E),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: _getLoginColumn(),
          ),
        ),
      ],
    );
  }

  Widget _getLoginColumn() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50.0),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign in to ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              Image(
                image: AssetImage('images/mood.png'),
              ),
            ],
          ),
          SizedBox(height: 36.0),
          Container(
            width: 340.0,
            height: 46.0,
            child: TextField(
              focusNode: negahban1,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: negahban1.hasFocus ? Color(0xffF35383) : Colors.white,
                  fontFamily: 'GM',
                  fontSize: 14.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  borderSide: BorderSide(
                    color: Color(0xffF35383),
                    width: 3.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  borderSide: BorderSide(
                    color: Color(0xffC5C5C5),
                    width: 3.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 32.0),
          Container(
            width: 340.0,
            height: 46.0,
            child: TextField(
              focusNode: negahban2,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: negahban2.hasFocus ? Color(0xffF35383) : Colors.white,
                  fontFamily: 'GM',
                  fontSize: 14.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  borderSide: BorderSide(
                    color: Color(0xffF35383),
                    width: 3.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  borderSide: BorderSide(
                    color: Color(0xffC5C5C5),
                    width: 3.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SwitchAcountScreen();
                  },
                ),
              );
            },
            child: Text('Sign in'),
          ),
          SizedBox(height: 50.0),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? / ",
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'GB',
                  color: Colors.grey,
                ),
              ),
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'GB',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    negahban1.dispose();
    negahban2.dispose();
    super.dispose();
  }
}
