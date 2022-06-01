import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fiya/pages/config/global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';


class ReportLists extends StatefulWidget {
  const ReportLists({Key? key}) : super(key: key);
  @override
  _ReportListsState createState() => _ReportListsState();
}

class _ReportListsState extends State<ReportLists> {
  

 static String BASE_URL = '' + Global.url + '/report_list';
   static String BASE_URL_REPORT = ''+Global.url+'/report/';
  List data = [];
  bool _load = false;
  Future<String> getData() async {
    setState(() {
      _load = true;
    });
    final prefs = await SharedPreferences.getInstance();
    var _id = prefs.getInt("_id");
    final response = await http.get(Uri.parse(BASE_URL+'/'+_id.toString() +'/'),
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
      appBar: AppBar(
        title: Text('Inbox'),
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
                  onTap: ()async{
                      var params1 = {
       "is_viewed":"yes"
      };
    
    final response1 = await http.patch(Uri.parse(BASE_URL_REPORT +''+data[index]['id'].toString() +'/'),headers: {"Content-Type": "application/json"},body:json.encode(params1));
    data[index]['is_viewed']='yes';
    setState(() {
      
    });
                         Get.toNamed('/respo_details',arguments:['${data[index]['id']}']);
                        },
                  title: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Container(
            
                height: 100,
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
                       Text("Ticket - #${data[index]['id']} - ${data[index]['message']}"),
                      data[index]['is_viewed']=='no' ?  Text("New message here!",style: TextStyle(color: Colors.green)) : Text(''),
                     ],
                   )
                 )
                ))
                  ],),
                  trailing: Column(
                    children: [
                      // Text("${data[index]['transaction_date']}"),
                      // Text("Php ${data[index]['price']}"),
                  
                    ],
                  ),
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









