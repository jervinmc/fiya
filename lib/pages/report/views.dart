import 'package:fiya/pages/config/global.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  bool loads = false;
  TextEditingController _contact_number = new TextEditingController();
    TextEditingController _message = new TextEditingController();
    TextEditingController _email = new TextEditingController();
      static String BASE_URL = ''+Global.url+'/report/';
    
    String username = 'fiyadev@gmail.com';
  String password = 'fiya12345';

  sendEmail() async{
    final prefs = await SharedPreferences.getInstance();
    var _id = prefs.getInt("_id");
    loads=true;
    setState(() {
      
    });
    final smtpServer = gmail(username, password);

   final message = Message()
    ..from = Address(username, 'Your name')
    ..recipients.add('fiyadev@gmail.com')
    ..ccRecipients.addAll(['fiyadev@gmail.com'])
    ..bccRecipients.add(Address('fiyadev@gmail.com'))
    ..subject = '${_email.text}'
    ..text = '${_message.text}'
    ..html = "Contact Number : ${_contact_number.text} <h1>${_message.text}</h1>\n<p></p>";

  try {
    var params = {
        "user_id":_id,
       "message":_message.text,
       "is_respo":"no",
       "is_viewed":"yes",
       "status":""
      };
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
    final response = await http.post(Uri.parse(BASE_URL),headers: {"Content-Type": "application/json"},body:json.encode(params));
    AwesomeDialog(
                context: context,
                dialogType:DialogType.SUCCES,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Successfully sent!',
                desc: '',
                btnOkOnPress: () {
                   setState(() {
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
        title: Text('Report'),
      ),
      body: Container(
        color: Color(0xffeafaec),
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
            Text("Contact us by sending a message here for your concern"),
            Container(
                          padding: EdgeInsets.only(top: 20,left:10,right:10),
                          child: TextField(
                            controller: _email,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8.0),enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                                       borderRadius: BorderRadius.circular(20.0),
                                  ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                  color: Colors.purple, 
                                    width: 5.0),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "Title",
                                fillColor: Colors.white70),
                          )
                        ),
            Container(
                          padding: EdgeInsets.only(top: 20,left:10,right:10),
                          child: TextField(
                            controller: _contact_number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8.0),enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                                       borderRadius: BorderRadius.circular(20.0),
                                  ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                  color: Colors.purple, 
                                    width: 5.0),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "Contact Number",
                                fillColor: Colors.white70),
                          )
                        ),
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
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff222f3e)),
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
