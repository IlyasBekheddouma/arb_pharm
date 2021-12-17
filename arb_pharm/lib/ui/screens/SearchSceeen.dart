import 'dart:convert';

import 'package:arb_pharm/utils/Ext1.dart';
import 'package:arb_pharm/utils/MyAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class SearchSceeen extends StatefulWidget {

  @override
  _SearchSceeen createState() => _SearchSceeen();
}

class _SearchSceeen extends State<SearchSceeen> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: SafeArea(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Search screen',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),)
          ],
        )),
      ),
    );
  }
}
