import 'package:demo/constant.dart';
import 'package:demo/models/chat_message.dart';
import 'package:flutter/material.dart';

import 'chat_input_field.dart';

class body extends StatelessWidget {
  ValueChanged<String> chat_meesage_kid;
  ValueChanged<String> text_chat;
  String backend_cht = "";

  body(
      {required this.chat_meesage_kid,
        required this.text_chat,
        required String backend_chat}) {
    backend_cht = backend_cht;
    text_chat = text_chat;
    chat_meesage_kid = chat_meesage_kid;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demoChatMeesage.length,
              itemBuilder: (context, index) =>
                  Message(message: demoChatMeesage[index]),
              ),
            ),
          ),
        chat_input_field_content(
          chat_meesage_kid: chat_meesage_kid,
          text_chat: text_chat,
          backend_chat: backend_cht,
          )
      ],
      );
  }
}

class Message extends StatelessWidget {
  final ChatMessage message;

  const Message({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: kDefaultPadding),
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 0.75,
            vertical: kDefaultPadding / 2,
            ),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(30),
            ),
          child: Text(message.text, style: TextStyle(color: Colors.white)),
          ),
      ],
      );
  }
}
