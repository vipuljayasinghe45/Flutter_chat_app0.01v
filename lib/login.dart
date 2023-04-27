import 'package:flutter/material.dart';
import 'constant.dart';
import 'dashboard.dart';

void main() => runApp(Login());


class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginStatefulWidget();
  }
}

class _LoginStatefulWidget extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _LoginContent(),
        ),
      );
  }
}

class _LoginContent extends StatelessWidget {
  TextEditingController parent_name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Image(
              image: AssetImage('assets/icons/login_icon.jpg'),
              ),
            ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: parent_name,
              textAlign: TextAlign.center,
              maxLines: 1,
              decoration: const InputDecoration(
                hintText: 'Type Parent Name',
                ),
              autocorrect: true,
              ),
            ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: kDefaultPadding * 2,
                  width: kDefaultPadding * 100,
                  child: TextButton(
                    onPressed: () => {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Dashboard()))
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 20,
                        ),
                      ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: kSecondaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
              ),
            ),
        ],
        ),
      );
  }
}
