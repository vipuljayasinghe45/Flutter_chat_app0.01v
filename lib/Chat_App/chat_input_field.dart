import 'package:demo/constant.dart';

import 'package:flutter/material.dart';

class chat_input_field_content extends StatelessWidget {
  final TextEditingController _input_data_controller = TextEditingController();

  final ValueChanged<String> chat_meesage_kid;
  final ValueChanged<String> text_chat;
  final String backend_chat;

  chat_input_field_content(
      {Key? key, required this.chat_meesage_kid,
        required this.text_chat,
        required this.backend_chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
        ),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 32,
              color: const Color(0xFF087949).withOpacity(0.08),
              )
          ]),
      child: SafeArea(
        child: Row(
          children: [
            const Icon(
              Icons.mic,
              color: kPrimaryColor,
              ),
            const SizedBox(
              width: kDefaultPadding,
              ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                  ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                  ),
                child: Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.color
                          ?.withOpacity(0.64),
                      ),
                    const SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                      child: TextField(
                        controller: _input_data_controller,
                        decoration: const InputDecoration(
                            hintText: "Type message", border: InputBorder.none),
                        autocorrect: true,
                        ),
                      ),
                    Icon(
                      Icons.attach_file,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.color
                          ?.withOpacity(0.64),
                      ),
                    const SizedBox(
                      width: 10 / 4,
                      ),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.color
                          ?.withOpacity((0.64)),
                      ),
                    TextButton.icon(
                      onPressed: () => {
                        if (_input_data_controller.text.isNotEmpty)
                          {
                            text_chat(_input_data_controller.text),
                            chat_meesage_kid(_input_data_controller.text)
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Type Message..."))),
                          }
                      },
                      icon: const Icon(
                        Icons.send_rounded,
                        ),
                      label: const Text(""),
                      ),
                  ],
                  ),
                ),
              )
          ],
          ),
        ),
      );
  }
}
