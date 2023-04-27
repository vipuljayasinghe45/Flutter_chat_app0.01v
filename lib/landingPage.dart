import 'package:demo/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(landingPage());
}

class landingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: landingPageContent(),
      );
  }
}

class landingPageContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset('assets/images/background_image_01.jpg'),
            const Spacer(flex: 3),
            Text(
              "Children mental health monitoring system for parents",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
              ),
            const Spacer(),
            Text(
              'Making the healthy and creative children mean making the better world.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.color
                    ?.withOpacity(0.64),
                ),
              ),
            const Spacer(flex: 3),
            TextButton(
              onPressed: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()))
              },
              child: Row(
                children: [
                  Text(
                    'Skip',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.color
                          ?.withOpacity(0.8),
                      ),
                    ),
                  const SizedBox(width: kDefaultPadding / 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.color
                        ?.withOpacity(0.8),
                    ),
                ],
                ),
              ),
            const Spacer(flex: 1),
          ],
          ),
        ),
      );
  }

}
