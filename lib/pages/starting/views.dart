import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartingPage extends StatefulWidget {


  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  void pageValidation()async {
      final prefs = await SharedPreferences.getInstance();
     print(prefs.getBool("isStarted"));
    
     bool isStarted=false;
     if(prefs.getBool("isStarted")==null){
       print("will");
      isStarted=false;
     }
     else{
       isStarted=prefs.getBool("isStarted")!;
     }
     if(isStarted) {
       Navigator.pop(context);
       Get.toNamed('/login');
     }
  }

  @override
  void initState() {
    super.initState();
    pageValidation();
  }
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.network(
            'https://image.freepik.com/free-vector/young-family-couple-characters-talking-male-psychologist-about-their-problems-concept-psychoth_119217-2734.jpg'),
        titleWidget: Text(
          "Introduction",
          style: TextStyle(
              color: Color(0xff017e00),
              fontSize: 20.5,
              fontWeight: FontWeight.bold),
        ),
        body:
            "Greetings, I’m FIYA! An AI assistant in Cavite State University – Don Severino de las Alas Campus.",
        footer: Text(''),
        decoration: const PageDecoration(
          pageColor: Colors.white,
        ),
      ),
      PageViewModel(
        image: Image.network(
            'https://image.freepik.com/free-vector/interest-deposit-profitable-investment-fixed-income-regular-payments-recurring-cash-receipts-money-recipient-with-calendar-cartoon-character-vector-isolated-concept-metaphor-illustration_335657-2866.jpg'),
        titleWidget: Text(
          "Introduction",
          style: TextStyle(
              color: Color(0xff017e00),
              fontSize: 20.5,
              fontWeight: FontWeight.bold),
        ),
        body:
            "As a chatbot, I could provide you school-related information that you might need.",
        footer: Text(''),
        decoration: const PageDecoration(
          pageColor: Colors.white,
        ),
      ),
      PageViewModel(
        image: Image.network(
            'https://img.freepik.com/free-vector/family-couple-psychologist-session-flat-cartoon-vector-illustration-isolated_181313-1619.jpg?size=338&ext=jpg'),
        body:
            'I am also equipped with a Map that will allow you to choose specific offices/departments to navigate around the school with ease.',
        footer: Text(''),
        titleWidget: Text(
          "Let's get started !",
          style: TextStyle(
              color: Color(0xff017e00),
              fontSize: 20.5,
              fontWeight: FontWeight.bold),
        ),
        decoration: const PageDecoration(
          pageColor: Colors.white,
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primaryColor: Colors.red),
      home: new Scaffold(
        body: IntroductionScreen(
          done: Text(
            'Done',
            style: TextStyle(color: Colors.black),
          ),
          onDone: () async {
            final prefs = await SharedPreferences.getInstance();
            print(prefs.getBool("isStarted"));
            prefs.setBool("isStarted", true);
            Navigator.pop(context);
            Get.toNamed('/login');
          },
          pages: getPages(),
        ),
      ),
    );
  }
}
