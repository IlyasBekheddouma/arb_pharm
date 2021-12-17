import 'dart:convert';

import 'package:arb_pharm/utils/Ext1.dart';
import 'package:arb_pharm/utils/MyAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class IM4Screen extends StatefulWidget {

  @override
  _IM4Screen createState() => _IM4Screen();
}

class _IM4Screen extends State<IM4Screen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Profile screen',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),)
      ],
    ));
  }
}
