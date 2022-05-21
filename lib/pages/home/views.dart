import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff017e00),
        title: Text('Dashboard'),
      ),
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
              title: Text('Chatbot'),
              onTap: () {
                Get.toNamed('/chatbot');
              },
            ),
            ListTile(
              title: Text('Maps'),
              onTap: () {
                Get.toNamed('/mappage');
              },
            ),
            ListTile(
              title: Text('Report'),
              onTap: () {
                Get.toNamed('/report');
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Center(
            child:Image.asset('assets/images/logo.png',height:100)),
          Container(padding:EdgeInsets.all(15),child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text("Mandate",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20.0)),
               Text("Section 2 of Republic Act No. 8468 “An Act Converting the Don Severino Agricultural College in the Municipality of Indang, Province of Cavite into a State University, to be Known as the Cavite State University” states that,"),
               Padding(padding: EdgeInsets.only(top: 10)),
               Text("The University shall primarily provide advance instruction and professional training in agriculture, science and technology, education and other related fields, undertake research and extension services, and provide progressive leadership in these areas."),
               Padding(padding: EdgeInsets.only(top: 20)),
               Text("Vision",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20.0)),
               Text("The premier university in historic Cavite recognized for excellence in the development of globally competitive and morally upright individuals"),
               Padding(padding: EdgeInsets.only(top: 20)),
               Text("Mission",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20.0)),
               Text("Cavite State University shall provide excellent, equitable and relevant educational opportunities in the arts, sciences and technology through quality instruction and responsive research and development activities. It shall produce professional, skilled and morally upright individuals for global competitiveness."),
               Padding(padding: EdgeInsets.only(top: 20)),
               Text("Core Values",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20.0)),
               Text("Truth\nExcellence\nService"),
               Padding(padding: EdgeInsets.only(top: 20)),
               Text("Quality Policy",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20.0)),
               Text("We Commit to the highest standards of education, value our stakeholders, Strive for continual improvement of our products and services, and Uphold the University’s tenets of Truth, Excellence, and Service to produce globally competitive and morally upright individuals."),

            ],
          ),)
        ],
      ),
    );
  }
}