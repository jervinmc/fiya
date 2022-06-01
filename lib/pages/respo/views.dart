import 'package:fiya/pages/config/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Respo extends StatefulWidget {
  dynamic args = Get.arguments;


  @override
  State<Respo> createState() => _RespoState(this.args);
}

class _RespoState extends State<Respo> {
  bool loads = false;
  TextEditingController _contact_number = new TextEditingController();
    TextEditingController _message = new TextEditingController();
    TextEditingController _email = new TextEditingController();
      static String BASE_URL = ''+Global.url+'/report/';
    
    String username = 'fiyadev@gmail.com';
  String password = 'fiya12345';

  final args;
  _RespoState(this.args);
  sendEmail() async{
    final prefs = await SharedPreferences.getInstance();
    var _id = prefs.getInt("_id");
    loads=true;
    setState(() {
      
    });
  try {
    var params = {
        "report_id":args[0],
       "message":_message.text,
       "is_respo":"yes",
       "status":""
      };
      var params1 = {
       "is_viewed":"no",
       "is_replied":"yes"
      };
    final response = await http.post(Uri.parse(BASE_URL),headers: {"Content-Type": "application/json"},body:json.encode(params));
    final response1 = await http.patch(Uri.parse(BASE_URL +''+args[0].toString() +'/'),headers: {"Content-Type": "application/json"},body:json.encode(params1));
    AwesomeDialog(
                context: context,
                dialogType:DialogType.SUCCES,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Successfully sent!',
                desc: '',
                btnOkOnPress: () {
                   setState(() {
                     Get.toNamed('/admin_home');
                      loads=false;
                   });
                },
                )..show();
                
  } on MailerException catch (e) {
    print(e);
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
  }
  
  @override
  Widget build(BuildContext context) {
    bool load= false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff017e00),
        title: Text('Replies'),
      ),
      body: Container(
        child: Column(
          children: [
            // Container(
            //   width: 400,
            //   padding: EdgeInsets.only(right: 10, left: 10,top: 20),
            //   child: TextField(
            //     controller: _email,
            //     decoration: InputDecoration(
            //         contentPadding: EdgeInsets.all(8.0),
            //         enabledBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.grey, width: 1.5),
            //           borderRadius: BorderRadius.circular(20.0),
            //         ),
            //         border: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.purple, width: 5.0),
            //           borderRadius: BorderRadius.circular(20.0),
            //         ),
            //         filled: true,
            //         hintStyle: TextStyle(color: Colors.grey[800]),
            //         hintText: "Email",
            //         fillColor: Colors.white70),
            //   ),
            // ),
            Padding(padding: EdgeInsets.only(top:10)),
            // Text("Contact us by sending a message here for your concern"),
            // Container(
            //               padding: EdgeInsets.only(top: 20,left:10,right:10),
            //               child: TextField(
            //                 controller: _email,
            //                 decoration: InputDecoration(
            //                     contentPadding: EdgeInsets.all(8.0),enabledBorder: OutlineInputBorder(
            //                           borderSide: BorderSide(color: Colors.grey, width: 1.5),
            //                            borderRadius: BorderRadius.circular(20.0),
            //                       ),
            //                     border: OutlineInputBorder(
            //                       borderSide: BorderSide(
            //                       color: Colors.purple, 
            //                         width: 5.0),
            //                       borderRadius: BorderRadius.circular(20.0),
            //                     ),
            //                     filled: true,
            //                     hintStyle: TextStyle(color: Colors.grey[800]),
            //                     hintText: "Email",
            //                     fillColor: Colors.white70),
            //               )
            //             ),
            // Container(
            //               padding: EdgeInsets.only(top: 20,left:10,right:10),
            //               child: TextField(
            //                 controller: _contact_number,
            //                 decoration: InputDecoration(
            //                     contentPadding: EdgeInsets.all(8.0),enabledBorder: OutlineInputBorder(
            //                           borderSide: BorderSide(color: Colors.grey, width: 1.5),
            //                            borderRadius: BorderRadius.circular(20.0),
            //                       ),
            //                     border: OutlineInputBorder(
            //                       borderSide: BorderSide(
            //                       color: Colors.purple, 
            //                         width: 5.0),
            //                       borderRadius: BorderRadius.circular(20.0),
            //                     ),
            //                     filled: true,
            //                     hintStyle: TextStyle(color: Colors.grey[800]),
            //                     hintText: "Contact Number",
            //                     fillColor: Colors.white70),
            //               )
            //             ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              width: 400,
              padding: EdgeInsets.only(right: 10, left: 10,top: 20),
              child: TextField(
                controller: _message,
                maxLines:8,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 5.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Messages",
                    fillColor: Colors.white70),
              ),
            ),
            Container(
                          padding: EdgeInsets.only(top: 15),
                          width: 250,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff1e7a39)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        ))),
                            child: Text('Send'),
                            onPressed: () {

                            sendEmail();
                            },
                          ),
                        ),
                          loads ? Container(
                            color: Colors.white10,
                            width: 70.0,
                            height: 70.0,
                            child: new Padding(padding: const EdgeInsets.all(5.0),child: new Center(child: new CircularProgressIndicator())),
                          ) : Text('')
                      
          ],
        ),
      ),
    );
  }
}
