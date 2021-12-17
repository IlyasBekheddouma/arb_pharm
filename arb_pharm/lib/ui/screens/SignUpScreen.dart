import 'dart:convert';
import 'dart:io';

import 'package:arb_pharm/utils/Ext1.dart';
import 'package:arb_pharm/utils/MyAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  var txt = TextEditingController();
  var txt2 = TextEditingController();
  var txt3 = TextEditingController();
  var txt4 = TextEditingController();

  var txt1_2 = TextEditingController();
  var txt2_2 = TextEditingController();
  var txt3_2 = TextEditingController();
  var txt4_2 = TextEditingController();
  var txt5_2 = TextEditingController();
  var txt6_2 = TextEditingController();

  var txt1_3 = TextEditingController();

  var pv = PageController();
  var psk0=PageStorageKey(UniqueKey());
  var sc0 = ScrollController();
  File fifo;
  List<File> mif = [];

  @override
  void dispose() {
    try {
      pv.dispose();
      txt.dispose();
      txt2.dispose();
      txt3.dispose();
      txt4.dispose();

      txt1_2.dispose();
      txt2_2.dispose();
      txt3_2.dispose();
      txt4_2.dispose();
      txt5_2.dispose();
      txt6_2.dispose();
      txt1_3.dispose();

      sc0.dispose();
    } catch (ex) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        ks1 + 'back.png', width: 30, height: 30, color: kc2,)
                  ),
                  SizedBox(width: 8,),
                  Text('Inscription', style: TextStyle(
                      color: kc2,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),)
                ],),
              ),

              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowGlow();
                    }, child: PageView(
                  controller: pv,
                  onPageChanged: (int page) {
                    setState(() {});
                  },
                  children: [

                    getWid(0),
                    getWid(1),
                    getWid(2),
                    getWid(3),

                  ],
                )),
              ),

              Row(children: [

                SizedBox(width: 48,),

                GestureDetector(
                  onTap: () {
                    pv.jumpToPage(0);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: kc1,
                    ),
                    child: Center(
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  height: 6,
                  color: getPage() >= 1 ? kc1 : Colors.grey.withOpacity(0.25),
                )),

                GestureDetector(
                  onTap: () {
                    pv.jumpToPage(1);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: getPage() >= 1 ? kc1 : Colors.grey.withOpacity(
                          0.25),
                    ),
                    child: Center(
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  height: 6,
                  color: getPage() >= 2 ? kc1 : Colors.grey.withOpacity(0.25),
                )),

                GestureDetector(
                  onTap: () {
                    pv.jumpToPage(2);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: getPage() >= 2 ? kc1 : Colors.grey.withOpacity(
                          0.25),
                    ),
                    child: Center(
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  height: 6,
                  color: getPage() >= 3 ? kc1 : Colors.grey.withOpacity(0.25),
                )),

                GestureDetector(
                  onTap: () {
                    pv.jumpToPage(3);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: getPage() >= 3 ? kc1 : Colors.grey.withOpacity(
                          0.25),
                    ),
                    child: Center(
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 48,),

              ],),

              SizedBox(height: 16,),

            ],
          ),
        ),
      ),
    );
  }

  Widget getWid(int pol) {
    if (pol == 0) {
      return Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [

            SizedBox(height: 24,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    chooseFile();
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.withOpacity(0.04),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.25),
                        width: 3,
                      ),
                    ),
                    child: Center(
                      child: fifo == null ? Image.asset(
                        ks1 + 'user.png', height: 60,
                        width: 60,
                        color: Colors.grey.withOpacity(0.25),) : Image.file(
                          fifo, fit: BoxFit.cover, height: 84, width: 84),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24,),

            Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.25),
                    width: 2,
                  )
              ),
              child: Center(
                child: TextFormField(
                  controller: txt,
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Nom commercial',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                ),
              ),
            ),

            SizedBox(height: 16,),

            Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.25),
                    width: 2,
                  )
              ),
              child: Center(
                child: TextFormField(
                  controller: txt2,
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                ),
              ),
            ),

            SizedBox(height: 16,),

            Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.25),
                    width: 2,
                  )
              ),
              child: Center(
                child: TextFormField(
                  controller: txt3,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Numéro de telephone',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                ),
              ),
            ),

            SizedBox(height: 16,),

            Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.25),
                    width: 2,
                  )
              ),
              child: Center(
                child: TextFormField(
                  controller: txt4,
                  cursorColor: Colors.black,
                  obscureText: true,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Mot de passe',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                ),
              ),
            ),

            SizedBox(height: 16,),


          ],
        ),
      );
    } else if (pol == 1) {
      return Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          shrinkWrap: true,
          children: [

            SizedBox(height: 22,),

            Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.25),
                    width: 2,
                  )
              ),
              child: Center(
                child: TextFormField(
                  controller: txt1_2,
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Numéro de RC',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                ),
              ),
            ),

            SizedBox(height: 16,),

            Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.25),
                    width: 2,
                  )
              ),
              child: Center(
                child: TextFormField(
                  controller: txt2_2,
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: 'NIF',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                ),
              ),
            ),

            SizedBox(height: 16,),

            Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.25),
                    width: 2,
                  )
              ),
              child: Center(
                child: TextFormField(
                  controller: txt3_2,
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: 'NIS',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                ),
              ),
            ),

            SizedBox(height: 16,),

            Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.25),
                    width: 2,
                  )
              ),
              child: Center(
                child: TextFormField(
                  controller: txt4_2,
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Numéro AR',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                ),
              ),
            ),

            SizedBox(height: 16,),

            Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.25),
                    width: 2,
                  )
              ),
              child: Center(
                child: TextFormField(
                  controller: txt5_2,
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Adresse',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                ),
              ),
            ),

            SizedBox(height: 16,),

            Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.25),
                    width: 2,
                  )
              ),
              child: Center(
                child: TextFormField(
                  controller: txt6_2,
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: "Num d'agrément",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                ),
              ),
            ),

            SizedBox(height: 16,),

          ],
        ),
      );
    } else if (pol == 2) {
      return Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          shrinkWrap: true,
          children: [

            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage(ks2 + 'pay.jpg'), fit: BoxFit.cover
                  )
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("0023816621    58\n" +
                  "RAZIBAOUENE Asma\n" +
                  "Boumerdes\n" +
                  "et appeler le 0795470066", style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold
              ),),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Envoyer la photo de \n" +
                  "*reçue de payment\n" +
                  "*RC\n" +
                  "*Les codes d'activité\n" +
                  "*carte professionelle", style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold
              ),),
            ),

            SizedBox(height: 16,),

            GestureDetector(
              onTap: () {
                chooseImageFile();
              },
              child: Container(
                height: 116,
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.1),
                      width: 2,
                    )
                ),
                child: Center(
                    child: mif.isEmpty
                        ? Image.asset(
                      ks1 + 'down.png', width: 30, height: 30, color: kc2,)
                        : (mif.length==1?Image.file(mif[0]):Container(
                      height: 116,
                      child: (

                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: mif.length,
                            key: psk0,
                            controller: sc0,
                            itemBuilder: (context, index) => Center(child: Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Image.file(mif[index]),
                            )),
                          )

                    ),
                        )
                    )
                ),
              ),
            ),


            SizedBox(height: 16,),

          ],
        ),
      );
    } else {
      return Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          shrinkWrap: true,
          children: [

            Padding(
              padding: EdgeInsets.symmetric( vertical: 16),
              child: Text("A fin de completer l'inscription\n"+
              "merci de saiser votre "+
                  "code d'activité", style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold
              ),),
            ),

            Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.25),
                    width: 2,
                  )
              ),
              child: Center(
                child: TextFormField(
                  controller: txt1_3,
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: "Code d'activité",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                ),
              ),
            ),

            SizedBox(height: 16,),

            GestureDetector(
              onTap: () {

                if(
                  txt.text.isNotEmpty&&
                  txt2.text.isNotEmpty&&
                  txt3.text.isNotEmpty&&
                  txt4.text.isNotEmpty&&

                  txt1_2.text.isNotEmpty&&
                  txt2_2.text.isNotEmpty&&
                  txt3_2.text.isNotEmpty&&
                  txt4_2.text.isNotEmpty&&
                  txt5_2.text.isNotEmpty&&

                  txt1_3.text.isNotEmpty
                ) {

                  if(fifo!=null) {
                    SignUp(context);
                  } else {
                    MyAlertDialog.show(
                      context: context,
                      title: "La photo de profile est obligatoire",
                      text_b1: "OK",
                      f1: () {
                        Navigator.pop(context);
                      },
                    );
                  }
                } else {
                  MyAlertDialog.show(
                    context: context,
                    title: "Remplissez tous les champs obligatoires",
                    text_b1: "OK",
                    f1: () {
                      Navigator.pop(context);
                    },
                  );
                }
              },
              child: Container(
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: kc1,
                ),
                child: Center(
                  child: Text(
                    "S'inscrire",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16,)

          ],
        ),
      );
    }
  }

  int getPage() {
    try {
      return pv.page.round();
    } catch (ex) {
      return 0;
    }
  }

  void chooseFile() async {
    try {
      var pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 25
      );
      fifo = File(pickedFile.path);

      setState(() {});
    } catch (e) {}
  }

  void chooseImageFile() async {
    try {
      var pickedFileList = await ImagePicker().pickMultiImage(
          imageQuality: 25
      );

      if (pickedFileList.length < 10) {
        mif.clear();

        pickedFileList.forEach((element) {
          mif.add(File(element.path));
        });

        setState(() {

        });
      }
    } catch (e) {}
  }

  void SignUp(context) async {
    showAlertDialog(context);

    try {
      var rep= await http.post(
        Uri.parse(MAIN_LINK+'/sign_up.php'),
        body: <String, String>{
          'akey1': akey1,
          'akey2': akey2,
          'picture': getBASE64(fifo),
          'picture_part2': getLBASE64(),
          'commercial_name': txt.text,
          'email': txt2.text,
          'phone_number': txt3.text,
          'password': txt4.text,
          'nrc': txt1_2.text,
          'nif': txt2_2.text,
          'nis': txt3_2.text,
          'nar': txt4_2.text,
          'address': txt5_2.text,
          'na': txt6_2.text,
          'ca': txt1_3.text,
        },
      ).timeout(Duration(minutes: 1));

      Navigator.pop(context);

      List<dynamic> list = jsonDecode(rep.body);

      Map l=list[0];

      if(l['user_id'].toString()!='0') {
        var h=Hive.box("data");
        h.put('user_id', l['user_id'].toString());
        h.put('user_commercial_name', txt.text);
        h.put('user_picture', l['user_picture'].toString());
        h.put('user_is_approved', '0');

        Navigator.of(context).pushNamed('/pending');

      } else {

        MyAlertDialog.show(
          context: context,
          title: "Échec",
          text_b1: "OK",
          f1: () {
            Navigator.pop(context);
          },
        );

      }
    } catch(e) {
      Navigator.pop(context);

      MyAlertDialog.show(
        context: context,
        title: "Échec",
        text_b1: "OK",
        f1: () {
          Navigator.pop(context);
        },
      );
    }
  }

  String getBASE64(File filo) {
    var st="";
    var bytes = filo.readAsBytesSync();
    st = base64Encode((bytes));
    return st;
  }

  String getLBASE64() {
    var st="";

    if(mif.isNotEmpty) {

      mif.forEach((element) {
        st+=getBASE64(element)+';ibaasplit;';
      });
    }
    return st;
  }
}