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
class RespoDetails extends StatefulWidget {
  dynamic args = Get.arguments;


  @override
  State<RespoDetails> createState() => _RespoDetailsState(this.args);
}


class _RespoDetailsState extends State<RespoDetails> {
  String data = '';
  bool loads = false;
  
  TextEditingController _contact_number = new TextEditingController();
    TextEditingController _message = new TextEditingController();
    TextEditingController _email = new TextEditingController();
      static String BASE_URL = ''+Global.url+'/respo_list';
    
    String username = 'fiyadev@gmail.com';
  String password = 'fiya12345';

  final args;
  _RespoDetailsState(this.args);

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
 Future<String> getData() async {
    setState(() {
      loads = true;
    });
    final prefs = await SharedPreferences.getInstance();
    var _id = prefs.getInt("_id");
    final response = await http.get(Uri.parse(BASE_URL+'/'+args[0]),
        headers: {"Content-Type": "application/json"});

    this.setState(() {
      try {
        loads = false;
      var  data1 = json.decode(response.body);
        print(data1);
        data = data1[0]['message'];
      } finally {
        loads = false;
        
      }
    });
    return "";
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
           Container(
             padding: EdgeInsets.all(10),
             child: Text('${data}'),
           ),
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
            // Container(
            //   width: 400,
            //   padding: EdgeInsets.only(right: 10, left: 10,top: 20),
            //   child: TextField(
            //     controller: _message,
            //     maxLines:8,
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
            //         hintText: "Messages",
            //         fillColor: Colors.white70),
            //   ),
            // ),
            // Container(
            //               padding: EdgeInsets.only(top: 15),
            //               width: 250,
            //               child: ElevatedButton(
            //                 style: ButtonStyle(
            //                     backgroundColor: MaterialStateProperty.all<Color>(Color(0xff1e7a39)),
            //                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //                         RoundedRectangleBorder(
            //                             borderRadius: BorderRadius.circular(18.0),
            //                             ))),
            //                 child: Text('Send'),
            //                 onPressed: () {

            //                 sendEmail();
            //                 },
            //               ),
            //             ),
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
