import 'package:flutter/material.dart';

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
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Center(
              child: Image(
                width: 155.81,
                height: 77,
                image: AssetImage('images/logo_splash.png'),
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
    );
  }
}
