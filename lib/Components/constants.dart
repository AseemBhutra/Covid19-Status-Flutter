import 'package:flutter/material.dart';

const kContainerColor = Color(0xff1e1d2f);
const kBackgroundColor = Color(0xff171624);
const kIconsize = 30.0;
const kSizedboxheight = 4.0;
const kHeadcontSize = 18.0;
const kTailContSize = 13.0;

const kPiechartactivecolor = Color(0xff007aff);
const kPiechartrecoveredcolor = Color(0xff07a045);
const kPiechartdeathcolor = Color(0xfff6404f);


const kConfirmedcolor = Color(0xffe1b345);
const kActivecolor = Color(0xff7dd8f0);
const kRecoveredcolor = Color(0xff7fc04b);
const kDeceasedcolor = Color(0xffcf4251);
const kTestscolor = Color(0xffd36ea5);
const kLastupdatedcolor = Color(0xffec6f10);

RegExp kreg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function kmathFunc = (Match match) =>'${match[1]},';



String bullet = "\u2022 ";



const kTitleTextstyle = TextStyle(
  fontSize: 24.0,
);

