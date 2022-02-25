import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4d194f),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: -3.0),
            Pin(size: 515.0, middle: 0.3183),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 173.0, middle: 0.5044),
            Pin(size: 34.0, end: 21.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Kokonor',
                  fontSize: 20,
                  color: const Color(0xffffffff),
                ),
                children: [
                  TextSpan(
                    text: 'Our aim Grow ',
                  ),
                  TextSpan(
                    text: 'India',
                    style: TextStyle(
                      color: const Color(0xffcd1b5a),
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          Align(
            alignment: Alignment(0.003, 0.02),
            child: SizedBox(
              width: 157.0,
              height: 67.0,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Kokonor',
                    fontSize: 42,
                    color: const Color(0xffffffff),
                  ),
                  children: [
                    TextSpan(
                      text: 'Ed',
                    ),
                    TextSpan(
                      text: 'Vance',
                      style: TextStyle(
                        color: const Color(0xffcd1b5a),
                      ),
                    ),
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
