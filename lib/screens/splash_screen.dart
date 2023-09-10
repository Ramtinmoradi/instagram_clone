import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagram_app/screens/home_screen.dart';
import 'package:instagram_app/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff1C1F2E),
        image: DecorationImage(
          image: AssetImage('images/pattern1.png'),
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            );
          },
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 155.81,
                      height: 77,
                      image: AssetImage('images/logo_splash.png'),
                    ),
                    SizedBox(height: 20),
                    SpinKitWave(
                      color: Colors.white,
                      size: 10.0,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 32.0,
                child: Column(
                  children: [
                    Text(
                      'From',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'GB',
                      ),
                    ),
                    Text(
                      'Exportflutter',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'GB',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
