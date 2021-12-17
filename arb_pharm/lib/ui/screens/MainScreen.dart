import 'package:arb_pharm/ui/screens/IM3Screen.dart';
import 'package:arb_pharm/utils/Ext1.dart';
import 'package:flutter/material.dart';

import 'IM1Screen.dart';
import 'IM2Screen.dart';
import 'IM4Screen.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  var pos=0;
  var LIS=[
    IM1Screen(),
    IM2Screen(),
    IM3Screen(),
    IM4Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onWillPopExit();
      },
      child: Material(
        child: Container(
            color: Colors.white,
          child: Column(
            children: [

              Expanded(

                child: LIS[pos],

              ),

              Container(
                height: 56,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kc3.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 4,
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          pos=0;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(ks1+'home.png',height: 26,width: 26, color: pos==0?kc1:kc3,),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          pos=1;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(ks1+'group.png',height: 26,width: 26, color: pos==1?kc1:kc3,),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          pos=2;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(ks1+'saved.png',height: 26,width: 26, color: pos==2?kc1:kc3,),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          pos=3;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(ks1+'profil.png',height: 26,width: 26, color: pos==3?kc1:kc3,),
                      ),
                    ),

                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}