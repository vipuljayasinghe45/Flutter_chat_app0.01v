import 'package:demo/Chat_App/body.dart';
import 'package:demo/constant.dart';
import 'package:demo/models/chat_message.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => {runApp(chatApp())};

class chatApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChatAppScreen();
  }
}

class ChatAppScreen extends State<chatApp> {
  var media_types = ChatMessageType.values;
  var status = MessageStatus.values;
  var chat_text = "";

  var _final_response = " ";

  backend_server(text) async {
    var url = Uri.parse('http://10.0.3.2:5000/name');
    final response = await http.post(url, body: json.encode({'name': text}));
    final responseBack = await http.get(url);
    final decode = json.decode(responseBack.body) as Map<String, dynamic>;
    setState(() {
      try {
        _final_response = decode['name'];
      } on Exception catch (e) {
        print('Check Beck-End Server.....');
      }
    });
    popup_message_child(_final_response);
  }

  void send(text) {
    setState(() {
      demoChatMeesage.add(
        ChatMessage(
          text: text,
          messageType: ChatMessageType.text,
          messageStatus: MessageStatus.viewed,
          isSender: true,
          ),
        );
    });
    backend_server(text);
  }

  void popup_message_child(text) async {
    if (_final_response.isNotEmpty && _final_response != " ") {
      setState(() {
        demoChatMeesage.add(
          ChatMessage(
            text: _final_response,
            messageType: ChatMessageType.text,
            messageStatus: MessageStatus.viewed,
            isSender: false,
            ),
          );
        _final_response = " " ;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: buildAppBar(),
          body: body(
            chat_meesage_kid: popup_message_child,
            text_chat: send,
            backend_chat: _final_response,
            ),
          ));
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/user1.png'),
            ),
          const SizedBox(
            width: kDefaultPadding * 0.7,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Patents Name",
                style: TextStyle(fontSize: 16),
                ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12),
                )
            ],
            )
        ],
        ),
      actions: const [
        IconButton(onPressed: null, icon: Icon(Icons.local_phone)),
        IconButton(onPressed: null, icon: Icon(Icons.video_call)),
        SizedBox(
          width: kDefaultPadding / 2,
          )
      ],
      );
  }
}
