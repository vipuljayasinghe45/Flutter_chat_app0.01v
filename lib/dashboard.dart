import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => {runApp(Dashboard())};

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DashboardStatefulWidget();
  }
}

class _DashboardStatefulWidget extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DashBoard'),
          ),
        body: DashboardContent(),
        ),
      );
  }
}

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.grey,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('User Manual'),
            ),
          ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.lightBlueAccent,
          child: ElevatedButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: const Text('Level 01'),
            ),
          ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.lightBlueAccent,
          child: ElevatedButton(
            onPressed: () => {},
            child: const Text('Level 02'),
            ),
          ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.lightBlueAccent,
          child: ElevatedButton(
            onPressed: () => {},
            child: const Text('Level 03'),
            ),
          ),
      ],
      );
  }
}

void showAlertDialog(BuildContext context) {
  // Create button
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          alignment: Alignment.center,
          height: 175,
          width: 280,
          child: SizedBox.expand(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      width: 120,
                      margin: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0))),
                        child: InkWell(
                          onTap: () => print("ciao"),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            // add this
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                  ),
                                child:
                                Image.asset('assets/icons/manual_chat.gif',
                                                // width: 300,
                                                height: 75,
                                                fit: BoxFit.fill),
                                ),
                              const ListTile(
                                title: Text(
                                  'Manual',
                                  textAlign: TextAlign.center,
                                  ),
                                //                                subtitle: Text('Location 1'),
                                ),
                            ],
                            ),
                          ),
                        ),
                      ),
                    Container(
                      width: 120,
                      margin: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0))),
                        child: InkWell(
                          onTap: () async {
                            //var url = 'http://127.0.0.1:5000/name';
                            var url = Uri.parse('http://10.0.3.2:5000/name');
                            final response = await http.post(url,
                                                                 body: json.encode({'name': 'AI'}));
                            print(response.request);

                            final responseBack = await http.get(url);
                            final decode = json.decode(responseBack.body)
                            as Map<String, dynamic>;
                            var final_response = decode['name'];
                            print(final_response);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            // add this
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                  ),
                                child: Image.asset('assets/icons/ai_chat.gif',
                                                       // width: 300,
                                                       height: 75,
                                                       fit: BoxFit.fill),
                                ),
                              const ListTile(
                                title: Text(
                                  'AI',
                                  textAlign: TextAlign.center,
                                  ),
                                //                                subtitle: Text('Location 1'),
                                ),
                            ],
                            ),
                          ),
                        ),
                      ),
                  ],
                  ),
              ],
              ),
            ),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          ),
        );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
          ),
        );
    },
    );
}


