import 'package:flutter/material.dart';

import 'Ext1.dart';

class MyAlertDialog {
  bool barrierDismissible;
  String title,content,text_b1,text_b2;
  Function f1,f2;

  MyAlertDialog.show({
    @required context,
    barrierDismissible=true,
    this.title="",
    this.content="",
    this.text_b1="",
    this.f1,
    this.text_b2="",
    this.f2,
  }) {

    Widget cancelButton = (TextButton(
      child: Text(text_b1,style: TextStyle(
        color: kc1,
      ),),
      onPressed:  () {

        if(text_b1!="") f1();
        },
    ));

    Widget continueButton = (TextButton(
      child: Text(text_b2,style: TextStyle(
        color: kc1,
      ),),
      onPressed:  () {

        if(text_b2!="") f2();
      },
    ));

    AlertDialog alert;

    if(title=='') {

      alert = AlertDialog(
          content: Text(content),
          actions: (text_b2!="")?[
          cancelButton,
          continueButton,
          ]:[
          cancelButton,
          ]
      );

    } else {

      alert = AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: (text_b2!="")?[
          cancelButton,
          continueButton,
          ]:[
          cancelButton,
          ]
      );

    }

    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => alert);
  }
}