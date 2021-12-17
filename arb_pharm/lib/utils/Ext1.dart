import 'dart:convert';
import 'dart:io';

import 'package:arb_pharm/utils/MyAlertDialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

/*

    FocusScope.of(context).unfocus();

    key: PageStorageKey(key),

    flutter clean
    flutter build appbundle

    Fluttertoast.showToast(
        msg: "TODO",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0
    );
*/

const ks1="assets/icons/";
const ks2="assets/images/";
const kc1=Color(0xFF01BBE4);
const kc2=Color(0xFF15224F);
const kc3=Color(0xFFCFD7ED);
const kc4=Color(0xFFF6F6F6);

DateTime backbuttonpressedTime;

void onWillPopExit() {
  DateTime currentTime = DateTime.now();

  bool backButton = backbuttonpressedTime == null || currentTime.difference(backbuttonpressedTime) > Duration(seconds: 2);

  if(backButton) {
    backbuttonpressedTime = currentTime;

    Fluttertoast.showToast(
        msg: "Veuillez cliquer de nouveau sur Retour pour quitter",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0
    );
  } else exit(0);
}

void showAlertDialog(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: Row(children: [
      CircularProgressIndicator(
        valueColor:AlwaysStoppedAnimation<Color>(kc1),
      ),
      SizedBox(width: 16,),
      Text("Merci de patienter ..."),
    ],),
  );
  showDialog(
    context:context,
    barrierDismissible: false,
    builder:(BuildContext context) {
      return alert;
    },
  );
}

void LogOut(context) {
  MyAlertDialog.show(
      context: context,
      title: "Voulez vous vraiment déconnecter?",
      text_b1: "NON",
      f1: () {
        Navigator.pop(context);
      },
      text_b2: "OUI",
      f2: () {
        var hdt=Hive.box('data');
        hdt.delete('user_id');
        FlutterRestart.restartApp();
      }
  );
}

const MAIN_LINK = "https://livrili-service.com/php_data23";
const akey1 = "IBAAKEY1998BI4_V7_arb";
const akey2 = "IBAAKEY1998BI2_V1_arb";

