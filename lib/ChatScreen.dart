import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatelessWidget {
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
            Pin(start: 15.0, end: 15.0),
            Pin(size: 90.0, end: 19.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff4d194f),
                borderRadius: BorderRadius.circular(45.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 139.0, end: 30.0),
            Pin(size: 56.0, end: 36.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff4d194f),
                borderRadius: BorderRadius.circular(5.0),
              ),
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
            Pin(size: 170.0, start: 47.0),
            Pin(size: 25.0, end: 51.0),
            child: const Text(
              'Type Message Here',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 21,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
                height: 1.4285714285714286,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 272.0, end: 23.0),
            Pin(size: 59.0, middle: 0.1938),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffcd1b5a),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment(0.539, -0.59),
            child: SizedBox(
              width: 152.0,
              height: 24.0,
              child: Text(
                'Hey, Jinne Ma’am!',
                style: TextStyle(
                  fontFamily: 'Apple SD Gothic Neo',
                  fontSize: 20,
                  color: Color(0xffffffff),
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
            Pin(size: 272.0, end: 16.0),
            Pin(size: 59.0, middle: 0.3803),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffcd1b5a),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 30.0, end: 20.0),
                  Pin(size: 24.0, middle: 0.5143),
                  child: const Text(
                    'I’m Good. What about you.',
                    style: TextStyle(
                      fontFamily: 'Apple SD Gothic Neo',
                      fontSize: 20,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      height: 1.5,
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
          Pinned.fromPins(
            Pin(size: 272.0, end: 16.0),
            Pin(size: 59.0, middle: 0.5648),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffcd1b5a),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 232.0, end: 31.0),
            Pin(size: 24.0, middle: 0.563),
            child: const Text(
              'Do we have meeting today?',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 20,
                color: Color(0xffffffff),
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
            Pin(size: 272.0, start: 24.0),
            Pin(size: 59.0, middle: 0.287),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff4d194f),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 182.0, start: 69.0),
            Pin(size: 24.0, middle: 0.295),
            child: const Text(
              'Hi, Cal! How Are You?',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 20,
                color: Color(0xffffffff),
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
            Pin(size: 272.0, start: 24.0),
            Pin(size: 59.0, middle: 0.4694),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 125, 99, 125),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 214.0, start: 53.0),
            Pin(size: 24.0, middle: 0.471),
            child: const Text(
              'I’m Good too Dear or Say.',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 20,
                color: Color(0xffffffff),
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
            Pin(size: 350.0, start: 15.0),
            Pin(size: 65.0, middle: 0.6621),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff4d194f),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 304.0, start: 38.0),
            Pin(size: 24.0, middle: 0.656),
            child: const Text(
              'No, We will have meeting tomorrow.',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 20,
                color: Color(0xffffffff),
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
            Pin(size: 272.0, end: 11.0),
            Pin(size: 59.0, middle: 0.7596),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffcd1b5a),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 178.0, end: 51.0),
            Pin(size: 24.0, middle: 0.748),
            child: const Text(
              'Okay Thanks for info!',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 20,
                color: Color.fromARGB(255, 34, 27, 27),
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
            Pin(size: 178.0, middle: 0.5479),
            Pin(size: 29.0, start: 28.0),
            child: const Text(
              'Math - Section A',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 24,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 104.0, middle: 0.5319),
            Pin(size: 24.0, start: 65.0),
            child: const Text(
              '45 Members',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 20,
                color: Color(0xffffffff),
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
            Pin(size: 64.0, end: 23.0),
            Pin(size: 19.0, middle: 0.2567),
            child: const Text(
              '02:00 am',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xffcd1b5a),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, end: 20.0),
            Pin(size: 19.0, middle: 0.4398),
            child: const Text(
              '02:03 am',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xffcd1b5a),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, end: 17.0),
            Pin(size: 19.0, middle: 0.6129),
            child: const Text(
              '02:05 am',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xffcd1b5a),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 60.0, end: 18.0),
            Pin(size: 19.0, middle: 0.805),
            child: const Text(
              '02:07 am',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xffcd1b5a),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 60.0, end: 18.0),
            Pin(size: 19.0, middle: 0.805),
            child: const Text(
              '02:07 am',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xffcd1b5a),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, start: 25.0),
            Pin(size: 19.0, middle: 0.3463),
            child: const Text(
              '02:02 am',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xff4d194f),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, start: 25.0),
            Pin(size: 19.0, middle: 0.5234),
            child: const Text(
              '02:04 am',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xff4d194f),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, start: 20.0),
            Pin(size: 19.0, middle: 0.7114),
            child: const Text(
              '02:06 am',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xff4d194f),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 70.0, start: 34.0),
            Pin(size: 70.0, start: 22.0),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(''),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 30.0, start: 27.0),
            Pin(size: 19.0, middle: 0.2488),
            child: const Text(
              'Aditi',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xff4d194f),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 48.0, end: 31.0),
            Pin(size: 19.0, start: 158.0),
            child: const Text(
              'Dheeraj',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xffcd1b5a),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 48.0, end: 27.0),
            Pin(size: 19.0, middle: 0.3393),
            child: const Text(
              'Dheeraj',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xffcd1b5a),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 48.0, end: 24.0),
            Pin(size: 19.0, middle: 0.5144),
            child: const Text(
              'Muskan',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xffcd1b5a),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 40.0, end: 27.0),
            Pin(size: 19.0, middle: 0.7025),
            child: const Text(
              'Prerna',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xffcd1b5a),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 30.0, start: 24.0),
            Pin(size: 19.0, middle: 0.4209),
            child: const Text(
              'Aditi',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xff4d194f),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, start: 23.0),
            Pin(size: 19.0, middle: 0.604),
            child: const Text(
              'Khushboo',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 15,
                color: Color(0xff4d194f),
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
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
