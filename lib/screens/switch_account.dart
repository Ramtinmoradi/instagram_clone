// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_app/screens/home_screen.dart';
import 'package:instagram_app/screens/main_screen.dart';

class SwitchAcountScreen extends StatelessWidget {
  const SwitchAcountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1C1F2E),
        image: DecorationImage(
          image: AssetImage('images/pattern1.png'),
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _getBody(context),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/switch_account_background.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 260.0,
                // left: 44.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10.0,
                      sigmaY: 10.0,
                    ),
                    child: Container(
                      width: 340.0,
                      height: 360.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(255, 255, 255, 0.5),
                            Color.fromRGBO(255, 255, 255, 0.3),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 32.0),
                          Image(
                            width: 100,
                            height: 100,
                            filterQuality: FilterQuality.high,
                            image: AssetImage('images/me.png'),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'Ramtinmoradiii',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            style: Theme.of(context).elevatedButtonTheme.style,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MainScreen();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'Confirm',
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'switch account',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 145.0,
            bottom: 63.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "don't have an account? / ",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontFamily: 'GB',
                ),
              ),
              Text(
                'Sign up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontFamily: 'GB',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
