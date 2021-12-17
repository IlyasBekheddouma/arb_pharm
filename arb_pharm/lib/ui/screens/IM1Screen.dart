import 'dart:convert';

import 'package:arb_pharm/models/mg.dart';
import 'package:arb_pharm/utils/Ext1.dart';
import 'package:arb_pharm/utils/MyAlertDialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class IM1Screen extends StatefulWidget {

  @override
  _IM1Screen createState() => _IM1Screen();
}

class _IM1Screen extends State<IM1Screen> {
  var LIS = [
    mg('mg3.png', 'Outils medicales', 'Publier par IBAA', '5'),
    mg('mg1.png', 'Microscope pho...', 'Publier par kaizmed', '4.8'),
    mg('mg2.png', 'test', 'Publier par ibaa', '5'),
  ];
  var LIS2 = [
    mg('dd1.png', 'SARL BIOPHARM', 'Besoin de : boite petries',
        'Quantité : 1000 PCS'),
    mg('dd2.png', 'SARL BIOPHARM', "Besoin de : boite petries",
        'Quantité : 1000 PCS'),
  ];

  @override
  Widget build(BuildContext context) {
    var hv = Hive.box('data');
    return Container(
      color: kc1,
      child: SafeArea(child: Column(
        children: [

          Stack(
            children: [
              Positioned(
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            ks2 + 'gb.png',
                          )
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Spacer(),
                        Text('Bonjour', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22, color: Colors.white,
                        ),),
                        SizedBox(height: 4,),
                        Row(
                          children: [
                            Text(hv.get('user_commercial_name').toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22, color: Colors.white,
                              ),),
                            SizedBox(width: 8,),
                            Container(
                              height: 26,
                              width: 26,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                              ),
                              child: Center(
                                child: Text('A', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22, color: Colors.red,
                                ),),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                      ], crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: GestureDetector(
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
                        child: Image.asset(
                          ks1 + 'search.png', width: 20, height: 20,)
                    ),
                  ),
                ),
              )
            ],
          ),

          Expanded(child: Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  child: Text('Produits publiés', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Container(
                  height: 220,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8),
                    itemCount: LIS.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return getWID(LIS[index]);
                    },),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  child: Text('Demande de devis', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8),
                      itemCount: LIS2.length,
                      itemBuilder: (context, index) {
                        return getWID2(LIS2[index]);
                      },),
                  ),
                ),
              ],
            ),
          ))

        ],
      )),
    );
  }

  Widget getWID(mg m) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
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
          width: 140,
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
                child: Image.asset(ks2 + m.s1,),
              ),

              Spacer(),


              Row(
                children: [
                  SizedBox(width: 8,),
                  Expanded(child: Text(m.s2, style: TextStyle(

                  ), overflow: TextOverflow.ellipsis,)),

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
                        child: Image.asset(
                          ks1 + 'next.png', width: 14, height: 14,)
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 8,),
                  Expanded(child: Text(m.s2, style: TextStyle(
                    color: Colors.grey,
                  ), overflow: TextOverflow.ellipsis,)),
                ],
              ),

              SizedBox(height: 8,),

              Row(children: [
                SizedBox(width: 4,),
                Image.asset(ks1 + 'star.png', width: 14, height: 14,),
                SizedBox(width: 2,),
                Image.asset(ks1 + 'star.png', width: 14, height: 14,),
                SizedBox(width: 2,),
                Image.asset(ks1 + 'star.png', width: 14, height: 14,),
                SizedBox(width: 2,),
                Image.asset(ks1 + 'star.png', width: 14, height: 14,),
                SizedBox(width: 2,),
                Image.asset(ks1 + 'star.png', width: 14, height: 14,),
                SizedBox(width: 4,),
                Expanded(
                  child: Text(m.s4, style: TextStyle(
                    color: Colors.grey,
                  ), overflow: TextOverflow.ellipsis,),
                )
              ],),
              SizedBox(height: 8,),

              Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }

  Widget getWID2(mg d) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: () {
          //TODO
          Fluttertoast.showToast(
              msg: "TODO",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              fontSize: 16.0
          );
        }, child: Container(
        height: 140,
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
        child: Row(children: [

          Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 4,
                    )
                  ]
              ),
              child: Image.asset(
                ks2 + d.s1, height: 140, width: 140, fit: BoxFit.cover,)),

          SizedBox(width: 8,),

          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12,),
              Text(d.s2, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 4,),

              Text(d.s3, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 4,),

              Text(d.s4, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
              Spacer(),

              Row(children: [
                Spacer(),
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
                    child: Image.asset(ks1 + 'b1.png')),
                SizedBox(width: 4,),
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
                    child: Image.asset(ks1 + 'b2.png')),
                SizedBox(width: 12,),
              ],),
              SizedBox(height: 12,)
            ],
          ))

        ],),
      ),
      ),
    );
  }
}