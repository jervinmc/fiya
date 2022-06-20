import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fiya/pages/chatbot/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatPage()));
                Get.toNamed('/chatbot');
                 AwesomeDialog(
                context: context,
                dialogType:DialogType.INFO,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Reminders: English inputs only.',
                desc: '',
                btnOkOnPress: () {
                   setState(() {
     
                 
                   });
                },
                )..show();
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
            ListTile(
              title: Text('Inbox'),
              onTap: () {
                Get.toNamed('/report_list');
              },
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
                },
                btnCancelOnPress: (){

                }
              )..show();
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(padding:EdgeInsets.all(15),color:Color(0xffeafaec) , child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Explore FIYA!',style:TextStyle(fontSize: 30.0,fontWeight:FontWeight.bold)),
                Image.asset('assets/images/logo.png',height:100)
              ],),
              Center(
                child: Container(
                  padding:EdgeInsets.only(top:10,bottom:10),
          
                width:350,
                child: Card(
                  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
                  elevation:10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                           Image.asset('assets/images/news3.jpeg',height:230,fit:BoxFit.cover),
                            Container(
                          padding:EdgeInsets.all(10),
                          child: Column(
                          children: [
                                Text('From L: CHED Executive Director Atty. Cinderella Filipina S. Benitez-Jaro, Dr. Ma. Agnes P. Nuestro, Dr. Adolfo C, Manuel Jr., and CHEDRO Directors Maximo C. Aljibe and Marco Cicero F. Domingo.',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify),
                                
                          ],
                        ),
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child: Column(
                          children: [
                                Text('CHED confers Gawad Parangal sa Kahusayan – COPC Award to CvSU',style:TextStyle(fontSize:25.0,fontWeight:FontWeight.bold,),textAlign: TextAlign.justify),
                                
                          ],
                        ),
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child: Column(
                            children:[
                              Text('In recognition of the University’s unwavering commitment to quality and excellence, the Commission on Higher Education (CHED) conferred upon Cavite State University the EDUKALIDAD: Parangal sa Kahusayan Certificates of Program Compliance (COPC) Award for having more than 65% of its program offerings with COPC. The awarding was held during the recently concluded CHED Gawad Parangal 2022 at Quezon City University on 18 May 2022. CvSU is among the nine State Universities and Colleges (SUC)-recipients and the only institution to receive the award in the region.',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                              ,
                              
                            ]
                          )),
                         Container(
                          padding:EdgeInsets.all(10),
                          child: Column(
                            children:[
                              Text('The trophy of recognition was received by Dr. Ma. Agnes P. Nuestro, Officer In-Charge (OIC) at the Office of the University President and the current Vice President for Academic Affairs and Dr. Adolfo C. Manuel Jr., Director for Institutional Development.',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                            ]
                          )
                        ),
                          Container(
                          padding:EdgeInsets.all(10),
                          child: Column(
                            children:[
                              Text('The Commission conducted the 2022 Gawad Parangal as part of the 2nd National Higher Education Day and CHED’s 28th founding anniversary celebration with the theme “Claiming Victory for Quality Higher Education: Dekalidad Na Edukasyon, Karapatan Ng Mamamayan”.',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                            ]
                          )
                        ),
                         Container(
                          padding:EdgeInsets.all(10),
                          child: Column(
                            children:[
                              Text('The 2022 Gawad Parangal also recognized the finalists and winners of the “CHED Merit Scholarship: My Success Story” and the awardees of  EDUKALIDAD: Parangal sa Kahusayan – Centers of Excellence (COE) and Certificate of Program Compliance (COPC) for State University and Colleges (SUCs) and Local Universities and Colleges (LUCs).',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                            ]
                          )
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child: Column(
                            children:[
                              Text('A total of nine  LUCs and nine SUCs received the COPC Award, respectively while another nine universities were conferred with the COE Award. The latter is granted to universities in the Philippines recognized by CHED as Center of Excellence for various fields while the COPC Award is accorded to SUCs with more than 50 graduate and undergraduate program offerings in which 65% of the total number of program offerings acquired COPC and LUCs with more than 10 graduate and undergraduate program offerings wherein 75% of its total number obtained the said certification (CMGRafols).',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                            ]
                          )
                        )
                      ],
                    )
                ),
              ),
              ),
              Center(
                child: Container(
                  padding:EdgeInsets.only(top:10,bottom:10),
  
                width:350,
                child: Card(
                  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
                  elevation:10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                           Image.asset('assets/images/news4.png',height:230,fit:BoxFit.cover),
                        Container(
                          padding:EdgeInsets.all(10),
                          child: Column(
                          children: [
                                Text('CvSU welcomes 1st VELF',style:TextStyle(fontSize:25.0,fontWeight:FontWeight.bold)),
                                
                          ],
                        ),
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('In honor and recognition of the 2022 civil engineering board topnotcher, new set of architects, electronics, electrical, and civil engineers, and electronics and master technicians, a tribute program sponsored by the College of Engineering and Information Technology (CEIT) was held on 23 May 2022 at the International Convention Center.',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                          ]),
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('Dr. Camilo A. Polinga, Vice President for Administrative Support and Services, and former CEIT dean, applauded the passers as well as the faculty members for unselfishly molding the successful examinees. He also reminded the newly licensed engineers, technicians, and electricians to always uphold the tenets of the University and aim to be globally competitive and morally upright individuals in their respective fields. He also wished that the board passers continue the quest for professional growth and that he looks forward to them becoming leaders in their corresponding professions in the future.',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                          ]),
                        ),
                         Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('Meanwhile, Dr. Ma. Agnes P. Nuestro, Officer In-Charge (OIC) to the Office of the University President and the Vice President for Academic Affairs, commended the outstanding performance of the honorees as well as the efforts and hard work of the parents, faculty, and staff of CEIT as the said achievement is very significant to the globalization of CvSU. Dr. Nuestro also hopes that the new licensed professionals will be ready for the uncertain world outside with the conviction to conquer it triumphantly. She also reminded them to live in truth, aim at excellence in everything, and be of service to fellowmen.',style:TextStyle(fontSize:13),textAlign: TextAlign.justify)
                          ]),
                        ),
                         Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('Engr. Andrei Jan L. Montalban, the fifth placer in the May 2022 Civil Engineering Licensure Exam, shared his experiences, struggles, and techniques on how he surpassed the examination and became a topnotcher. He also encouraged everyone to reinforce desires with faith to be able to withstand the earthquakes and typhoons of life and remain faithful to God.',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                          ]),
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('This collaboration applicable in the current flexible learning arrangement not only gives the students a chance to receive global education but also opens doors of international collaboration and engagement for other teachers. (LAOrsal)',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                          ]),
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('The certificates were awarded by Dr. Nuestro, Dr. Polinga, Dean of CEIT Dr. David L. Cero, and Physical Planning Unit Director Engr. Orlando B. delos Reyes. A total of 10 newly licensed architects, 3 electronics engineers, 1 electronics technician, 14 electrical engineers, 35 civil engineers, and 4 master electricians were recognized during the program which was also attended by CEIT faculty members and other University officials (CMGRafols).',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                          ]),
                        ),
                    
                      ],
                    )
                ),
              ),
              ),
              Center(
                child: Container(
                  padding:EdgeInsets.only(top:10,bottom:10),
 
                width:350,
                child: Card(
                  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
                  elevation:10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                           Image.asset('assets/images/news2.jpeg',height:230,fit:BoxFit.cover),
                           Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('Photo credit: The Kingfisher SLSU',style:TextStyle(fontSize:13.0))
                          ]),
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child: Column(
                          children: [
                                Text('2022 STRASUC Olympics: CvSU Hornets bag 5 gold medals',style:TextStyle(fontSize:25.0,fontWeight:FontWeight.bold)),
                                
                          ],
                        ),
                        ),
                      Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('Cavite State University has once again exhibited its excellence in sports after landing as second runner-up in the recently concluded 2022 Southern Tagalog Region Association of State Universities and Colleges (STRASUC) Olympics Bubble Competition held on 22-28 April at Southern Luzon State University (SLSU) Lucban, Quezon Province.',style:TextStyle(fontSize:13.0,),textAlign: TextAlign.justify)
                          ]),
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('With this year’s theme of “Embracing Sports Excellence in the New Normal,” 34 CvSU athletes from the main and satellite campuses represented the University in the sports event. They were accompanied by 9 coaches and 11 committee members.',style:TextStyle(fontSize:13.0,),textAlign: TextAlign.justify)
                          ]),
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('The CvSU delegation, led by VP for Administrative and Support Services Dr. Camilo A. Polinga and Sports Director Prof. Ana Liza R. Mojica, participated in the men’s and women’s division of basketball, badminton, futsal, chess, and table tennis, taking home a total medal tally of 5 gold, 3 silver, and 6 bronze.',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                          ]),
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('The futsal women, coached by Ms. Clarisse Ann Papa, contributed three gold medals while the badminton players (women’s singles A and B), who were coached by Mr. Rey-an Penus, added one gold medal each.',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                          ]),
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('The three silver medals were from women’s basketball (3×3), coached by Ms. Yzzabel Mojica, while the bronze medals were from futsal (3), badminton (1), chess board 2 (1), all under the men’s division, and one from chess women’s division (Board 2).',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                          ]),
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('Eleven State Universities and Colleges (SUCs) in Regions IV-A and B participated in the olympics. Palawan State University (PSU) was hailed champion while Batangas State University (BatSU) was declared first runner-up.',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                          ]),
                        ),
                     
                      ],
                    )
                ),
              ),
              ),
               Center(
                child: Container(
                  padding:EdgeInsets.only(top:10,bottom:10),
           
                width:350,
                child: Card(
                  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
                  elevation:10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                           Image.asset('assets/images/news1.jpeg',height:230,fit:BoxFit.cover),
                            Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('The heirs of Don Severino Delas Alas with the CvSU Vice Presidents.',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                          ]),
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child: Column(
                          children: [
                                Text('Resiliency amidst the pandemic: CvSU celebrates 116th founding anniversary',style:TextStyle(fontSize:25.0,fontWeight:FontWeight.bold),textAlign: TextAlign.justify),
                                
                          ],
                        ),
                        ),
                       Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('In celebration of 116 years of being truthful and excellent in service, Cavite State University held its founding anniversary by honoring the legacy of Don Severino Delas Alas, recognizing the loyalty of CvSU employees, and marking its new milestone.',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                          ]),
                        ),
                        Container(
                          padding:EdgeInsets.all(10),
                          child:  Column(children:
                          [
                             Text('A wreath-laying ceremony, attended by the members of the Administrative Council and the heirs of Don Severino Delas Alas, was held at the monument of the late Don Severino in honor and commemoration of his great contributions to the community. One of the great-great-grandchildren of Don Severino, Ms. Annalie Delas Alas De Castro, commended CvSU for progressive education even during the pandemic and stated that they are thankful to the institution for utilizing the gift of their great-great-grandfather to the community up until today.',style:TextStyle(fontSize:13.0),textAlign: TextAlign.justify)
                          ]),
                          
                        ),
                        
                      ],
                    )
                ),
              ),
              ),
               Center(
                child: Container(
                  padding:EdgeInsets.only(top:10,bottom:10),
          
                width:350,
                child: Card(
                  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
                  elevation:10,
                    child: Container(
                      padding:EdgeInsets.all(20),
                      child: Column(
                      children:[
                        Text("Mandate",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20.0)),
                            Padding(padding: EdgeInsets.only(top: 20)),
               Text("Section 2 of Republic Act No. 8468 “An Act Converting the Don Severino Agricultural College in the Municipality of Indang, Province of Cavite into a State University, to be Known as the Cavite State University” states that,",textAlign: TextAlign.justify),
               Padding(padding: EdgeInsets.only(top: 10)),
               Text("The University shall primarily provide advance instruction and professional training in agriculture, science and technology, education and other related fields, undertake research and extension services, and provide progressive leadership in these areas.",textAlign: TextAlign.justify),
               Padding(padding: EdgeInsets.only(top: 20)),
               Text("Vision",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20.0)),
                   Padding(padding: EdgeInsets.only(top: 20)),
               Text("The premier university in historic Cavite recognized for excellence in the development of globally competitive and morally upright individuals",textAlign: TextAlign.justify),
               Padding(padding: EdgeInsets.only(top: 20)),
               Text("Mission",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20.0),),
                   Padding(padding: EdgeInsets.only(top: 20)),
               Text("Cavite State University shall provide excellent, equitable and relevant educational opportunities in the arts, sciences and technology through quality instruction and responsive research and development activities. It shall produce professional, skilled and morally upright individuals for global competitiveness.",textAlign: TextAlign.justify),
               Padding(padding: EdgeInsets.only(top: 20)),
               Text("Core Values",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20.0)),
                   Padding(padding: EdgeInsets.only(top: 20)),
               Text("Truth\nExcellence\nService"),
               Padding(padding: EdgeInsets.only(top: 20)),
               Text("Quality Policy",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20.0)),
                Padding(padding: EdgeInsets.only(top: 20)),
               Text("We Commit to the highest standards of education, value our stakeholders, Strive for continual improvement of our products and services, and Uphold the University’s tenets of Truth, Excellence, and Service to produce globally competitive and morally upright individuals.",textAlign: TextAlign.justify),
                      ]
                    ),
                    )
                )))
              

            ],
          ),)
        ],
      ),
    );
    
  }
  
}

