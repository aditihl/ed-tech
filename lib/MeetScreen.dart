import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MeetScreen extends StatelessWidget {
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
            Pin(size: 111.0, start: 0.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff4d194f),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60.0),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 60.0, end: 0.0),
            Pin(size: 59.5, start: 111.0),
            child: SvgPicture.string(
              _svg_w4eup,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 57.0, middle: 0.8088),
            Pin(size: 31.0, end: 47.0),
            child: const Text(
              'Send',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 26,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 25.5, end: 47.3),
            Pin(size: 23.0, end: 53.5),
            child: SvgPicture.string(
              _svg_lqanby,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 232.0, end: 31.0),
            Pin(size: 24.0, middle: 0.563),
            child: Text(
              'Do we have meeting today?',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 130.0, start: 64.0),
            Pin(size: 36.0, start: 38.0),
            child: Text(
              'Your Role',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 30,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
                height: 1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Align(
            alignment: Alignment(0.005, -0.455),
            child: SizedBox(
              width: 319.0,
              height: 114.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment(-0.008, 1.0),
                    child: SizedBox(
                      width: 196.0,
                      height: 28.0,
                      child: Text(
                        'Annie56@gmail.com',
                        style: TextStyle(
                          fontFamily: 'Apple SD Gothic Neo',
                          fontSize: 23,
                          color: const Color(0xff4d194f),
                          fontWeight: FontWeight.w500,
                          height: 1.3043478260869565,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 55.0, start: 0.0),
                    child: Text(
                      'Welcome Annie',
                      style: TextStyle(
                        fontFamily: 'Apple SD Gothic Neo',
                        fontSize: 46,
                        color: const Color(0xff4d194f),
                        fontWeight: FontWeight.w700,
                        height: 0.7391304347826086,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 45.0, end: 30.0),
            Pin(size: 185.0, middle: 0.5757),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 74.0, start: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff4d194f),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(45.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(45.0),
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 92.0, middle: 0.4986),
                  Pin(size: 33.0, start: 21.0),
                  child: Text(
                    'Teacher',
                    style: TextStyle(
                      fontFamily: 'Apple SD Gothic Neo',
                      fontSize: 28,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      height: 1.0714285714285714,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 74.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff4d194f),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(45.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(45.0),
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 92.0, middle: 0.4986),
                  Pin(size: 33.0, end: 20.0),
                  child: Text(
                    'Student',
                    style: TextStyle(
                      fontFamily: 'Apple SD Gothic Neo',
                      fontSize: 28,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      height: 1.0714285714285714,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_w4eup =
    '<svg viewBox="452.0 111.0 60.0 59.5" ><path transform="translate(444.33, -44.0)" d="M 67.66722869873047 214.5032958984375 C 67.60370635986328 206.5797119140625 66.01797485351562 198.8891906738281 62.95407485961914 191.6453552246094 C 61.45033645629883 188.0901184082031 59.58909606933594 184.6610717773438 57.42205429077148 181.4534454345703 C 55.27567672729492 178.2763671875 52.8106575012207 175.2887268066406 50.09546661376953 172.5735473632812 C 47.38030624389648 169.8583831787109 44.39267730712891 167.3933563232422 41.215576171875 165.2469482421875 C 38.0079345703125 163.0799102783203 34.57887649536133 161.2186889648438 31.02365684509277 159.7149353027344 C 23.62654685974121 156.5862121582031 15.76886558532715 154.9998168945312 7.668895721435547 154.9998168945312 L 67.66921234130859 154.9998168945312 L 67.66922760009766 214.5032958984375 L 67.66722869873047 214.5032958984375 Z" fill="#4d194f" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lqanby =
    '<svg viewBox="439.2 947.5 25.5 23.0" ><path transform="translate(436.25, 943.0)" d="M 3.012142658233643 27.5 L 28.5 16.00000190734863 L 3.012142658233643 4.500000476837158 L 3 13.44444370269775 L 21.21428298950195 16.00000190734863 L 3 18.55555534362793 L 3.012142658233643 27.5 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
