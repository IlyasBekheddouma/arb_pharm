import 'dart:async';
import 'dart:convert';

import 'package:arb_pharm/utils/Ext1.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class PendingScreen extends StatefulWidget {

  @override
  _PendingScreen createState() => _PendingScreen();
}

class _PendingScreen extends State<PendingScreen> {
  var chek=true;

  @override
  void initState() {
    super.initState();
    lunchChecker(context);
  }

  @override
  Widget build(BuildContext context) {
    var h=Hive.box("data");
    return WillPopScope(
      onWillPop: () {
        onWillPopExit();
      },
      child: Material(
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

              children: [

                chek?(Center(
                    child: CircularProgressIndicator(
                      valueColor:AlwaysStoppedAnimation<Color>(kc1),
                    )
                )):Column(
                  children: [

                    Text("Vous été pas encore validé", style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold,
                      color: kc2
                    ),),

                    SizedBox(height: 16,),

                    GestureDetector(
                      onTap: () {

                        setState(() {
                          chek=true;
                        });
                        lunchChecker(context);

                      },
                      child: Container(
                        height: 48,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: kc1,
                        ),
                        child: Center(
                          child: Text(
                            "Réessayer",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                )

              ],

            ),
          ),
        ),
      ),
    );
  }

  void lunchChecker(context) async {
    var hv=Hive.box('data');

    try {

      var rep= await http.post(
        Uri.parse(MAIN_LINK+'/checker.php'),
        body: <String, String>{
          'akey1': akey1,
          'akey2': akey2,
          'id': hv.get('user_id'),
        },
      ).timeout(Duration(minutes: 1));

      List<dynamic> list = jsonDecode(rep.body);

      Map l=list[0];

      if(l['is_approved'].toString()=='1') {

        hv.put('user_is_approved', '1');
        Navigator.of(context).pushNamed('/main');

      } else {

        setState(() {
          chek=false;
        });
      }
    } catch(e) {

      setState(() {
        chek=false;
      });
    }
  }
}