import 'package:flutter/material.dart';

const kContainerColor = Color(0xff1e1d2f);
const kBackgroundColor = Color(0xff171624);
const kIconsize = 30.0;
const kSizedboxheight = 4.0;
const kHeadcontSize = 18.0;
const kTailContSize = 13.0;
const kListContainerHeight = 50.0;
const kVersion = 2.2;

const kPiechartactivecolor = Color(0xff007afe);
const kPiechartrecoveredcolor = Color(0xff08a045);
const kPiechartdeathcolor = Color(0xfff6404f);

const kConfirmedcolor = Color(0xfffbc233);
const kActivecolor = Color(0xff78dbf3);
const kRecoveredcolor = Color(0xff7ec544);
const kDeceasedcolor = Color(0xfff6404f);
const kTestscolor = Color(0xfff375b5);
const kLastupdatedcolor = Color(0xffff7100);
const kSaffronColor = Color(0xffff9933);

RegExp kreg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function kmathFunc = (Match match) => '${match[1]},';

String bullet = "\u2022 ";

const kChanges = '\u2022 Added custom made app icon'
    '\n\u2022 Improved layout'
    '\n\u2022 Improved Refresh Indicator'
    '\n\u2022 Other minor fixes';

const kTitleTextstyle = TextStyle(
  fontSize: 24.0,
);
