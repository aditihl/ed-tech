import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateCourse extends StatelessWidget {
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
              decoration: BoxDecoration(
                color: const Color(0xff4d194f),
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
            child: Text(
              'Send',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 26,
                color: const Color(0xffffffff),
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
            Pin(size: 188.0, middle: 0.3611),
            Pin(size: 36.0, start: 38.0),
            child: Text(
              'Create Course',
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
          Pinned.fromPins(
            Pin(size: 31.5, start: 45.0),
            Pin(size: 36.0, start: 37.5),
            child: SvgPicture.string(
              _svg_r8o4s,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 31.0, end: 27.0),
            Pin(size: 33.0, start: 171.0),
            child: Text(
              'Please fill below form for create course',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 28,
                color: const Color(0xff4d194f),
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
            Pin(start: 20.0, end: 20.0),
            Pin(size: 61.0, middle: 0.2503),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(45.0),
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(45.0),
                ),
                border: Border.all(width: 2.0, color: const Color(0xff4d194f)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 162.0, start: 49.0),
            Pin(size: 27.0, middle: 0.2578),
            child: Text(
              'Enter Class Name',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 22,
                color: const Color(0xff4d194f),
                height: 1.3636363636363635,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(size: 61.0, middle: 0.3427),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(45.0),
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(45.0),
                ),
                border: Border.all(width: 2.0, color: const Color(0xff4d194f)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 30.0, end: 29.0),
            Pin(size: 86.0, end: 151.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff4d194f),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.061, 0.649),
            child: SizedBox(
              width: 84.0,
              height: 33.0,
              child: Text(
                'Submit',
                style: TextStyle(
                  fontFamily: 'Apple SD Gothic Neo',
                  fontSize: 28,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w600,
                  height: 1.0714285714285714,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 180.0, start: 45.0),
            Pin(size: 27.0, middle: 0.347),
            child: Text(
              'Enter Course Name',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 22,
                color: const Color(0xff4d194f),
                height: 1.3636363636363635,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(size: 61.0, middle: 0.433),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(45.0),
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(45.0),
                ),
                border: Border.all(width: 2.0, color: const Color(0xff4d194f)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 100.0, start: 44.0),
            Pin(size: 27.0, middle: 0.4363),
            child: Text(
              'Enter Date',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 22,
                color: const Color(0xff4d194f),
                height: 1.3636363636363635,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(size: 61.0, middle: 0.5275),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(45.0),
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(45.0),
                ),
                border: Border.all(width: 2.0, color: const Color(0xff4d194f)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 102.0, start: 45.0),
            Pin(size: 27.0, middle: 0.5276),
            child: Text(
              'Enter Time',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 22,
                color: const Color(0xff4d194f),
                height: 1.3636363636363635,
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
const String _svg_r8o4s =
    '<svg viewBox="45.0 37.5 31.5 36.0" ><path transform="translate(45.0, 37.5)" d="M 31.5 25.3125 L 31.5 1.6875 C 31.5 0.7523437738418579 30.74765586853027 0 29.8125 0 L 6.75 0 C 3.0234375 0 0 3.0234375 0 6.75 L 0 29.25 C 0 32.9765625 3.0234375 36 6.75 36 L 29.8125 36 C 30.74765586853027 36 31.5 35.24765777587891 31.5 34.3125 L 31.5 33.1875 C 31.5 32.66015625 31.25390625 32.18202972412109 30.87421798706055 31.87265586853027 C 30.57890510559082 30.78984260559082 30.57890510559082 27.703125 30.87421798706055 26.62031173706055 C 31.25390625 26.31796836853027 31.5 25.83984375 31.5 25.3125 Z M 9 9.421875 C 9 9.189844131469727 9.189844131469727 9 9.421875 9 L 24.328125 9 C 24.56015586853027 9 24.75 9.189844131469727 24.75 9.421875 L 24.75 10.828125 C 24.75 11.06015586853027 24.56015586853027 11.25 24.328125 11.25 L 9.421875 11.25 C 9.189844131469727 11.25 9 11.06015586853027 9 10.828125 L 9 9.421875 Z M 9 13.921875 C 9 13.68984413146973 9.189844131469727 13.5 9.421875 13.5 L 24.328125 13.5 C 24.56015586853027 13.5 24.75 13.68984413146973 24.75 13.921875 L 24.75 15.328125 C 24.75 15.56015586853027 24.56015586853027 15.75 24.328125 15.75 L 9.421875 15.75 C 9.189844131469727 15.75 9 15.56015586853027 9 15.328125 L 9 13.921875 Z M 26.81718826293945 31.5 L 6.75 31.5 C 5.505468845367432 31.5 4.5 30.49453163146973 4.5 29.25 C 4.5 28.01250076293945 5.512499809265137 27 6.75 27 L 26.81718826293945 27 C 26.68359375 28.20234298706055 26.68359375 30.29765701293945 26.81718826293945 31.5 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
