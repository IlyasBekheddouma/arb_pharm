import 'dart:convert';

import 'package:arb_pharm/utils/Ext1.dart';
import 'package:arb_pharm/utils/MyAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  var txt=TextEditingController();
  var txt2=TextEditingController();

  @override
  void dispose() {

    try {
      txt.dispose();
      txt2.dispose();
    } catch (ex) { }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onWillPopExit();
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [

                  Spacer(),

                  Image.asset(ks2+'logo2.jpg',width: 240,fit: BoxFit.fitWidth,),

                  SizedBox(height: 32,),

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
                            hintText: 'Email ou Numéro de téléphone',
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

                  GestureDetector(
                    onTap: () {

                      if(txt.text.isNotEmpty&&txt2.text.isNotEmpty) {
                        Login(context);
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
                          'Se connecter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Spacer(),

                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: Column(
                      children: [
                        Text("Vous n'avez pas de compte ?",style: TextStyle(
                          color: Colors.black.withOpacity(0.75),
                          fontSize: 16,
                        ),),

                        Text('Inscrivez-vous',style: TextStyle(
                            color: kc1,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        )),
                      ],
                    ),
                  ),

                  SizedBox(height: 24,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void Login(context) async {
    showAlertDialog(context);

    try {
      var rep= await http.post(
        Uri.parse(MAIN_LINK+'/login.php'),
        body: <String, String>{
          'akey1': akey1,
          'akey2': akey2,
          'iden': txt.text,
          'password': txt2.text,
        },
      ).timeout(Duration(minutes: 1));

      Navigator.pop(context);

      List<dynamic> list = jsonDecode(rep.body);

      Map l=list[0];

      if(l['user_id'].toString()!='0') {
        var h=Hive.box("data");
        h.put('user_id', l['user_id'].toString());
        h.put('user_commercial_name', l['user_commercial_name'].toString());
        h.put('user_picture', l['user_picture'].toString());
        h.put('user_is_approved', l['is_approved'].toString());

        if(l['is_approved'].toString()=='0') {

          Navigator.of(context).pushNamed('/pending');

        } else {

          Navigator.of(context).pushNamed('/main');

        }
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
}
