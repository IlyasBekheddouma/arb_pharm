import 'package:arb_pharm/utils/Ext1.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SplachScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2), () {
      go(context);
    });
    return Material(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Center(
            child: Image.asset(ks2+'logo.jpg',width: 240,fit: BoxFit.fitWidth,),
          ),
        ),
      ),
    );
  }

  void go(context) {
    var hv=Hive.box('data');

    if (hv.get('user_id').toString() == 'null') {

      Navigator.of(context).pushNamed('/login');

    } else {

      if(hv.get('user_is_approved').toString() == '0') {

        Navigator.of(context).pushNamed('/pending');

      } else {

        Navigator.of(context).pushNamed('/main');

      }

    }
  }
}