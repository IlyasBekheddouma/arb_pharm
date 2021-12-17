import 'dart:convert';

import 'package:arb_pharm/models/mg.dart';
import 'package:arb_pharm/utils/Ext1.dart';
import 'package:arb_pharm/utils/MyAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class IM3Screen extends StatefulWidget {

  @override
  _IM3Screen createState() => _IM3Screen();
}

class _IM3Screen extends State<IM3Screen> {
  var LIS=[
    mg('mg1.png','Microscope pho...','Publier par kaizmed','4.8'),
    mg('mg2.png','Outils medicales','Publier par medicQ','4.8'),
  ];

  @override
  Widget build(BuildContext context) {
    var hv=Hive.box('data');
    return Container(
      color: Colors.white,
      child: SafeArea(child: Container(
        color: kc1,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kc4,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(24)
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12,),
                  Stack(
                    children: [
                      Positioned(
                        child: Row(
                          children: [
                            SizedBox(width: 16,),

                            Container(
                              height: 42,
                              width: 42,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Image.network(hv.get('user_picture')),
                            ),

                            Spacer(),

                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/search');
                              },
                              child: Container(
                                height: 32,
                                width: 32,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                child: Center(
                                    child: Image.asset(ks1+'search.png',width: 20,height: 20,)
                                ),
                              ),
                            ),
                            SizedBox(width: 16,),

                          ],
                        ),
                      ),
                      Positioned.fill(child: Center(
                        child: Image.asset(ks2+'logo3.png',width: 60,fit: BoxFit.cover,),
                      ))
                    ],
                  ),
                  SizedBox(height: 12,),

                  GestureDetector(
                    onTap: () {
                      //TODO
                      Fluttertoast.showToast(
                          msg: "TODO",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16.0
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                            margin: EdgeInsets.symmetric(horizontal: 16,),
                            child: Text('Publier / Demander un ou plusieur produit',style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16
                            ),overflow: TextOverflow.ellipsis,),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: 32,
                          width: 32,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                          ),
                          child: Center(
                              child: Image.asset(ks1+'next.png',width: 20,height: 20,)
                          ),
                        ),
                        SizedBox(width: 16,),

                      ],
                    ),
                  ),

                  SizedBox(height: 12,),

                ],
              ),
            ),
            SizedBox(height: 8,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Produits favoris',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                    ),

                    Expanded(child: Container(
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.70,
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: LIS.length,
                        itemBuilder: (context, index) => getWID(LIS[index]),
                      ),
                    )),

                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget getWID(mg m) {
    return GestureDetector(
      onTap: () {
        //TODO
        Fluttertoast.showToast(
            msg: "TODO",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0
        );
      },
      child: Container(
        height: 100,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              blurRadius: 4,
            )
          ]
        ),
        child: Column(
          children: [

            Container(
              width: double.infinity,
              child: Image.asset(ks2+m.s1,),
            ),

            Spacer(),


            Row(
              children: [
                SizedBox(width: 8,),
                Expanded(child: Text(m.s2,style: TextStyle(

                ),overflow: TextOverflow.ellipsis,)),

                SizedBox(width: 4,),
                Container(
                  height: 32,
                  width: 32,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: Center(
                      child: Image.asset(ks1+'next.png',width: 14,height: 14,)
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 8,),
                Expanded(child: Text(m.s2,style: TextStyle(
                  color: Colors.grey,
                ),overflow: TextOverflow.ellipsis,)),
              ],
            ),

            SizedBox(height: 8,),

            Row(children: [
              SizedBox(width: 4,),
              Image.asset(ks1+'star.png',width: 14,height: 14,),
              SizedBox(width: 2,),
              Image.asset(ks1+'star.png',width: 14,height: 14,),
              SizedBox(width: 2,),
              Image.asset(ks1+'star.png',width: 14,height: 14,),
              SizedBox(width: 2,),
              Image.asset(ks1+'star.png',width: 14,height: 14,),
              SizedBox(width: 2,),
              Image.asset(ks1+'star.png',width: 14,height: 14,),
              SizedBox(width: 4,),
              Expanded(
                child: Text(m.s4,style: TextStyle(
                  color: Colors.grey,
                ),overflow: TextOverflow.ellipsis,),
              )
            ],),
            SizedBox(height: 8,),

            Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
