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
import 'package:intl/intl.dart';
class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  String category_select = '';
  final items = [
    'College of Agriculture, Food, Environment and Natural Resources',
    'College of Arts and Sciences',
    'College of Criminal Justice',
    'College of Economics, Management and Development Studies',
    'College of Education',
    'College of Engineering and Information Technology',
    'College of Nursing',
    'College of Sports, Physical Education and Recreation',
    'College of Veterinary Medicine and Biomedical Sciences',
    'Office of the Student Affairs and Services',
    'University Infirmary',
    'University Library',
    'University Marketing Center',
    'University Registrar',
  ];
  bool loads = false;
  TextEditingController _contact_number = new TextEditingController();
    TextEditingController _message = new TextEditingController();
    TextEditingController _email = new TextEditingController();
      static String BASE_URL = ''+Global.url+'/report/';
    
    String username = 'fiyadev@gmail.com';
  String password = 'fiya12345';

  sendEmail() async{
    if(category_select==''){
       AwesomeDialog(
                context: context,
                dialogType:DialogType.SUCCES,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Please select office/department.',
                desc: '',
                btnOkOnPress: () {
                   setState(() {
                     Navigator.pop(context);
                     Get.toNamed('/starting');
                      loads=false;
                   });
                },
                )..show();
                return;
    }
    DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final prefs = await SharedPreferences.getInstance();
    var _id = prefs.getInt("_id");
     var _email1 = prefs.getString("_email");
    loads=true;
    setState(() {
      
    });
    final smtpServer = gmail(username, password);

  //  final message = Message()
  //   ..from = Address(username, 'Your name')
  //   ..recipients.add('fiyadev@gmail.com')
  //   ..ccRecipients.addAll(['fiyadev@gmail.com'])
  //   ..bccRecipients.add(Address('fiyadev@gmail.com'))
  //   ..subject = '${_email.text}'
  //   ..text = '${_message.text}'
  //   ..html = "<h1>${_message.text}</h1>\n<p></p>";
  print(formattedDate);
  try {
    var params = {
        "user_id":_id,
       "message":_message.text,
       "is_respo":"no",
       "is_viewed":"yes",
       "status":"",
       "email":_email1,
       "title":_email.text,
       "category":category_select,
       "account_type":"You",
       "date":formattedDate
      };
    // final sendReport = await send(message, smtpServer);
    // print('Message sent: ' + sendReport.toString());
    final response = await http.post(Uri.parse(BASE_URL),headers: {"Content-Type": "application/json"},body:json.encode(params));
    AwesomeDialog(
                context: context,
                dialogType:DialogType.SUCCES,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Successfully sent!',
                desc: '',
                btnOkOnPress: () {
                   setState(() {
                     Navigator.pop(context);
                     Get.toNamed('/starting');
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
        title: Text('Contact Us'),
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
            Padding(padding: EdgeInsets.only(bottom: 10)),
             Container(
              
                width: 370,
                decoration:BoxDecoration(borderRadius:BorderRadius.circular(5),border:Border.all(color: Colors.black,width:1)),
              padding: EdgeInsets.only(top: 10),
              child:DropdownButton<String>(items: items.map(buildMenuItem).toList(),
               hint: category_select=='' ? Text("Select Office/Department") : Text('${category_select}'),
              itemHeight: 60,
                isExpanded:true,
              onChanged:(category_select)=>setState(() {
                  this.category_select = category_select!;
              }))
            ),
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
   DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value:item,
    child: Container(padding:EdgeInsets.all(10),child:Text(item,style:TextStyle(fontSize: 15)))
  );
}
