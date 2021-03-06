import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fiya/pages/config/global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';


class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  

 static String BASE_URL = '' + Global.url + '/report';
  List data = [];
  bool _load = false;
  Future<String> getData() async {
    setState(() {
      _load = true;
    });
    final prefs = await SharedPreferences.getInstance();
    var _id = prefs.getInt("_id");
    final response = await http.get(Uri.parse(BASE_URL+'/'),
        headers: {"Content-Type": "application/json"});

    this.setState(() {
      try {
        _load = false;
        data = json.decode(response.body);
      } finally {
        _load = false;
        
      }
    });
    return "";
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('',style:TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                color:  Color(0xff017e00),
              ),
            ),    
            ListTile(
              title: Text('Logout'),
              onTap: () {
                
                 AwesomeDialog(
                context: context,
                dialogType: DialogType.QUESTION,
                animType: AnimType.BOTTOMSLIDE,
                title: "Are you sure you want to logout?",
                desc: "",
                btnOkOnPress: () async{
                   final prefs = await SharedPreferences.getInstance();
                   prefs.setBool('isLoggedIn', false);
                     Navigator.of(context)
                .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                  Get.toNamed('/login');
                },
                btnCancelOnPress: (){

                }
              )..show();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Admin Home'),
        backgroundColor: Color(0xff017e00),
      ),
      body:  _load
                ? Container(
                    color: Colors.white10,
                    width: 70.0,
                    height: 70.0,
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Center(
                            child: const CircularProgressIndicator()))
                      ],
                    ),
                  )
                : Container(
        child: new ListView.separated(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: new ListTile(
                  onTap: (){
                          Get.toNamed('/respo',arguments:['${data[index]['id']}']);
                        },
                  title: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                    Container(
            
                height: 120,
                width:450,
                child: Card(
                  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
                  elevation:10,
                 child: Container(
                   padding:EdgeInsets.all(20),
                   child: Column(
                     children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                        Container(
                          width: 250,
                          child:Column(
                            children:[
                                Text("Ticket - #${data[index]['id']} - ${data[index]['message']}")
                            ]
                          )
                        ),
                         IconButton(onPressed: (){
                             AwesomeDialog(
                                context: context,
                                dialogType:DialogType.QUESTION,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'Are you sure you want to delete this item?',
                                desc: '',
                                btnOkOnPress: ()async {
                                   final response1 = await http.delete(Uri.parse(BASE_URL +'/'+data[index]['id'].toString() +'/'),headers: {"Content-Type": "application/json"});
                                  setState(() {
                                     getData();
                                  });
                                },
                                )..show();
                         }, icon: Icon(Icons.delete,color:Colors.red),)
                     ],),
                     data[index]['is_replied']!='yes' ? Text("Not yet replied.") : Text('')
                     ],
                   )
                 )
                ))
                  ],),
                 
                ),
                );
              },separatorBuilder: (context, index) {
                  return Text('');
                },
            ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.toNamed('/addmenu');
      //     // Add your onPressed code here!
      //   },
      //   backgroundColor: Color(0xffc6782b),
      //   child: const Icon(Icons.add),
      // ),
    );
  } 

}









