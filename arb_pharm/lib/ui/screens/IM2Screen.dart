import 'dart:convert';

import 'package:arb_pharm/models/mg.dart';
import 'package:arb_pharm/utils/Ext1.dart';
import 'package:arb_pharm/utils/MyAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class IM2Screen extends StatefulWidget {

  @override
  _IM2Screen createState() => _IM2Screen();
}

class _IM2Screen extends State<IM2Screen> {
  var bl=true;
  var LIS=[
    mg('mg1.png','Microscope pho...','Publier par kaizmed','4.8'),
    mg('mg2.png','test','Publier par ibaa','5'),
    mg('mg2.png','Outils medicales','Publier par medicQ','4.8'),
  ];
  var LIS2=[
    mg('dd1.png','SARL BIOPHARM','Besoin de : boite petries','Quantité : 1000 PCS'),
    mg('dd2.png','SARL BIOPHARM',"Besoin de : boite petries",'Quantité : 1000 PCS'),
    mg('mg1.png','IBAA TEST','Besoin de : boite petries','Quantité : 1000 PCS'),
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24)
                  ),
                ),
                child: Column(children: [

                  Container(
                    height: 50,
                    child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        backgroundColor: Colors.white,
                        appBar: TabBar(
                          labelColor: kc1,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: kc1,
                          indicatorWeight: 3,
                          indicatorPadding: EdgeInsets.symmetric(horizontal: 24),
                          tabs: [
                            Tab(child: Text("Produits publiés",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),),
                            Tab(child: Text("Demande de devis",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),)
                          ],
                          onTap: (e) {

                            setState(() {
                              bl=(e==0);
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  if(bl)                     Expanded(child: Container(
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
    )) else Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: LIS2.length,
                        itemBuilder: (context, index) {

                          return getWID2(LIS2[index]);

                      },),
                    ),
                  )

                ],),
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

  Widget getWID2(mg d) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
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
              child: Image.asset(ks2+d.s1,height: 140,width: 140,fit: BoxFit.cover,)),

          SizedBox(width: 8,),

          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12,),
              Text(d.s2,style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 4,),

              Text(d.s3,style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 4,),

              Text(d.s4,style: TextStyle(
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
                    child: Image.asset(ks1+'b1.png')),
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
                    child: Image.asset(ks1+'b2.png')),
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
