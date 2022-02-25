import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4d194f),
      body: Stack(
        children: <Widget>[
          Container(
            color: const Color(0xffffffff),
          ),
          Pinned.fromPins(
            Pin(start: -3.0, end: 0.0),
            Pin(size: 544.0, start: 0.0),
            child: Container(
              decoration: const BoxDecoration(
                color: const Color(0xff4d194f),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60.0),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1.0, 0.128),
            child: SizedBox(
              width: 60.0,
              height: 60.0,
              child: SvgPicture.string(
                _svg_olsqcu,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 14.0, end: 14.0),
            Pin(size: 484.0, start: 18.0),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment(0.023, 0.447),
            child: SizedBox(
              width: 254.0,
              height: 84.0,
              child: Text(
                'We currently have over \n740 live roles waiting for you! \n',
                style: TextStyle(
                  fontFamily: 'Apple SD Gothic Neo',
                  fontSize: 20,
                  color: Color(0xffcd1b5a),
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 70.0, end: 69.0),
            Pin(size: 56.0, middle: 0.8244),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffcd1b5a),
                borderRadius: BorderRadius.circular(28.0),
              ),
            ),
          ),
          const Align(
            alignment: Alignment(0.128, 0.631),
            child: SizedBox(
              width: 177.0,
              height: 27.0,
              child: Text(
                'Login with Google',
                style: TextStyle(
                  fontFamily: 'Apple SD Gothic Neo',
                  fontSize: 22,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 342.0, end: 76.0),
            Pin(size: 54.0, end: 66.0),
            child: const Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Apple SD Gothic Neo',
                  fontSize: 20,
                  color: Color(0xff4d194f),
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: 'By creating an account, you are agreeing \nto our',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'Terms of Service',
                    style: TextStyle(
                      color: Color(0xffcd1b5a),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Align(
            alignment: const Alignment(-0.428, 0.629),
            child: SizedBox(
              width: 26.0,
              height: 26.0,
              child: SvgPicture.string(
                _svg_fx4xkc,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          const Align(
            alignment: Alignment(0.008, -0.279),
            child: SizedBox(
              width: 157.0,
              height: 67.0,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Kokonor',
                    fontSize: 42,
                    color: Color(0xffffffff),
                  ),
                  children: [
                    TextSpan(
                      text: 'Ed',
                    ),
                    TextSpan(
                      text: 'Vance',
                      style: TextStyle(
                        color: Color(0xffcd1b5a),
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

const String _svg_olsqcu =
    '<svg viewBox="452.0 544.0 60.0 59.5" ><path transform="translate(444.33, 389.0)" d="M 67.66722869873047 214.5032958984375 C 67.60370635986328 206.5797119140625 66.01797485351562 198.8891906738281 62.95407485961914 191.6453552246094 C 61.45033645629883 188.0901184082031 59.58909606933594 184.6610717773438 57.42205429077148 181.4534454345703 C 55.27567672729492 178.2763671875 52.8106575012207 175.2887268066406 50.09546661376953 172.5735473632812 C 47.38030624389648 169.8583831787109 44.39267730712891 167.3933563232422 41.215576171875 165.2469482421875 C 38.0079345703125 163.0799102783203 34.57887649536133 161.2186889648438 31.02365684509277 159.7149353027344 C 23.62654685974121 156.5862121582031 15.76886558532715 154.9998168945312 7.668895721435547 154.9998168945312 L 67.66921234130859 154.9998168945312 L 67.66922760009766 214.5032958984375 L 67.66722869873047 214.5032958984375 Z" fill="#4d194f" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fx4xkc =
    '<svg viewBox="139.0 813.0 26.0 26.0" ><path transform="translate(139.0, 812.44)" d="M 26 13.86653137207031 C 26 21.28386878967285 20.83729362487793 26.5625 13.21311473846436 26.5625 C 5.903278350830078 26.5625 0 20.75443458557129 0 13.56249904632568 C 0 6.370563983917236 5.903278350830078 0.5625 13.21311473846436 0.5625 C 16.77212905883789 0.5625 19.76639175415039 1.846774101257324 22.0733585357666 3.964515686035156 L 18.47704696655273 7.366531848907471 C 13.77254104614258 2.900403022766113 5.024179935455322 6.255241870880127 5.024179935455322 13.56249904632568 C 5.024179935455322 18.09677314758301 8.705738067626953 21.7713680267334 13.21311473846436 21.7713680267334 C 18.4450798034668 21.7713680267334 20.40573501586914 18.08104705810547 20.71475410461426 16.16773986816406 L 13.21311473846436 16.16773986816406 L 13.21311473846436 11.69636917114258 L 25.79221153259277 11.69636917114258 C 25.91475486755371 12.36209583282471 26 13.00161170959473 26 13.86653137207031 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
