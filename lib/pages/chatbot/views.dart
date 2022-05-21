import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_7.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_dialogflow/flutter_dialogflow.dart';
import 'package:flutter_dialogflow/flutter_dialogflow.dart';
import 'package:flutter_dialogflow/v2/dialogflow_v2.dart';
import 'package:googleapis/dialogflow/v2.dart';
import 'package:googleapis_auth/auth_io.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

final ScrollController _controller = ScrollController();

class _ChatPageState extends State<ChatPage> {
  late DialogflowApi _dialog;
  bool isListening = false;
  // void response()async{
  //   AuthGoogle authGoogle = await AuthGoogle(fileJson: 'assets/fresh-arcade-347405-690f08366e0f.json');
  //     Dialogflow dialogflow = await Dialogflow(authGoogle:authGoogle);
  //       AIResponse response = await dialogflow.detectIntent("Hi!!!");

  // }
  var projectid = "fresh-arcade-347405";
  _requestChatBot(String text) async {
    var dialogSessionId =
        "projects/$projectid/agent/sessions/flutter-dialogflow";
    Map data = {
      "queryInput": {
        "text": {
          "text": text,
          "languageCode": "en",
        }
      }
    };

    var request = GoogleCloudDialogflowV2DetectIntentRequest.fromJson(data);

    var resp = await _dialog.projects.agent.sessions
        .detectIntent(request, dialogSessionId);
    var result = resp.queryResult;
    print(result.fulfillmentText);
    setState(() {
      conversations.add({
        "message": result.fulfillmentText,
        "type": BubbleType.sendBubble,
        "isMe": false
      });
    });
  }

  void _initChatbot() async {
    String configString = await rootBundle
        .loadString('assets/fresh-arcade-347405-690f08366e0f.json');
    String _dialogFlowConfig = configString;

    var credentials = ServiceAccountCredentials.fromJson(_dialogFlowConfig);
    const _SCOPES = const [DialogflowApi.cloudPlatformScope];
    var httpClient = await clientViaServiceAccount(credentials, _SCOPES);
    _dialog = DialogflowApi(httpClient);
  }

  

  // static String BASE_URL = '' + Global.url + '/';
  List conversations = [];
  TextEditingController _message = new TextEditingController();
  void sendMessage(message) {
    _requestChatBot(message);
    setState(() {
      conversations.add(
          {"message": message, "type": BubbleType.sendBubble, "isMe": true});
      // responseMessage(_message.text);
      _message.text = '';
    });
    _scrollDown();
  }

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  void responseMessage(message) async {
    var params = {
      "value": message,
    };
    final response = await http.post(Uri.parse('' + 'chat'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(params));
    String jsonsDataString = response.body.toString();
    final _data = jsonDecode(jsonsDataString);
    print(_data);
    setState(() {
      conversations.add({
        "message": _data['data'],
        "type": BubbleType.sendBubble,
        "isMe": false
      });
    });
    _scrollDown();
  }

  void initState() {
    super.initState();
    conversations.add({
        "message": "Hi! I'm FiYA, your personal chatbot assistant, how may I help you?",
        "type": BubbleType.sendBubble,
        "isMe": false
      });
      setState(() {
        
      });
    _initChatbot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff017e00),
          title: Text('Chatbot'),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                  controller: _controller,
                  itemCount: conversations.length,
                  itemBuilder: (BuildContext context, index) {
                    return conversations[index]['isMe']
                        ? getSenderView(
                            ChatBubbleClipper7(
                                type: conversations[index]['type']),
                            context,
                            conversations[index]['message'])
                        : getReceiverView(
                            ChatBubbleClipper7(
                                type: conversations[index]['type']),
                            context,
                            conversations[index]['message']);
                  }),
            ),
            new Positioned(
                bottom: 0.0,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 50,
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // isListening
                      //     ? IconButton(
                      //         onPressed: () {
                      //           _listen();
                      //         },
                      //         icon: Icon(Icons.close))
                      //     : IconButton(
                      //         onPressed: () {
                      //           _listen();
                      //         },
                      //         icon: Icon(Icons.mic)),
                      Expanded(
                        child: new TextField(
                          controller: _message,
                          decoration: const InputDecoration.collapsed(
                              hintText: "Send a message."),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            sendMessage(_message.text);
                          },
                          icon: Icon(Icons.send)),
                    ],
                  ),
                )),
          ],
        ));
  }

  getSenderView(CustomClipper clipper, BuildContext context, String message) =>
      ChatBubble(
        clipper: clipper,
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 20),
        backGroundColor: Colors.blue,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  getReceiverView(
          CustomClipper clipper, BuildContext context, String message) =>
      ChatBubble(
        clipper: clipper,
        backGroundColor: Color(0xffE7E7ED),
        margin: EdgeInsets.only(top: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            message,
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
}
