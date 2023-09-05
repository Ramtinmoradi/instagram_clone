// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';

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
                top: 287.0,
                left: 44.0,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10.0,
                      sigmaY: 10.0,
                    ),
                    child: Container(
                      width: 340.0,
                      height: 352.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(255, 255, 255, 0.5),
                            Color.fromRGBO(255, 255, 255, 0.3),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 32.0),
                          Image(
                            image: AssetImage('images/profile.png'),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'Amirahmadadibii',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            style: Theme.of(context).elevatedButtonTheme.style,
                            onPressed: () {},
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
                  fontSize: 20.0,
                  fontFamily: 'GB',
                ),
              ),
              Text(
                'Sign up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
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
