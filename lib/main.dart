
import 'package:fiya/pages/admin_home/views.dart';
import 'package:fiya/pages/chatbot/views.dart';
import 'package:fiya/pages/home/views.dart';
import 'package:fiya/pages/login/views.dart';
import 'package:fiya/pages/maps/views.dart';
import 'package:fiya/pages/maps2/views.dart';
import 'package:fiya/pages/polylines/views.dart';
import 'package:fiya/pages/report/views.dart';
import 'package:fiya/pages/report_list/views.dart';
import 'package:fiya/pages/respo/views.dart';
import 'package:fiya/pages/respo_details/views.dart';
import 'package:fiya/pages/signup/views.dart';
import 'package:fiya/pages/starting/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async{
 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter',
      theme: ThemeData(
      ),
      getPages: [
        GetPage(name: "/starting", page:()=>Home()),
        GetPage(name: "/introduction", page:()=>StartingPage()),
        GetPage(name: "/chatbot", page:()=>ChatPage()),
        GetPage(name: "/maps", page:()=>MapSample()),
        GetPage(name: "/mappage", page:()=>MapPage()),
        GetPage(name: "/report", page:()=>Report()),
        GetPage(name: "/login", page:()=>Login()),
        GetPage(name: "/register", page:()=>SignUp()),
         GetPage(name: "/report_list", page:()=>ReportLists()),
         GetPage(name: "/admin_home", page:()=>AdminHome()),
          GetPage(name: "/respo", page:()=>Respo()),
          GetPage(name: "/respo_details", page:()=>RespoDetails()),
          
        // GetPage(name: "/mappages", page:()=>TestMapPolyline()),
        // GetPage(name: "/signup", page:()=>SignUp()),
        // GetPage(name: "/profile", page:()=>Profile()),
        // GetPage(name: "/resetPassword", page:()=>ResetPassword()),
        // GetPage(name: "/receiptList", page:()=>receiptList()),
        // GetPage(name: "/receipt", page:()=>receipt()),
        // GetPage(name: "/products", page:()=>Products()),
        // GetPage(name: "/cart", page:()=>Cart()),
        // GetPage(name: "/favorites", page:()=>Favorites()),
        // GetPage(name: "/product_details", page:()=>ProductDetails()),
      ],
      initialRoute: "/introduction",
    );
  }
}
