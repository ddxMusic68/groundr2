import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'settings.dart';

// final Uri url = Uri.parse('https://google.com');

// Future<void> openUrl() async {
//   if (!await launchUrl(url)) {
//     throw Exception('Could not launch $url');
//   }
// }

void main() {
  runApp(MainApp());
}



class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentIndex = 0;

  void setCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: [
            getMain(),
            SettingsPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          setCurrentIndex(1);
        },
        child: Icon(Icons.settings),
      ),
      ),
    );
  }
}


Widget getMain() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ElevatedButton(
        onPressed: () async {},
        child: Icon(Icons.calendar_month_outlined, size: 40),
      ),
      ElevatedButton(
        onPressed: () async {},
        child: Icon(Icons.email, size: 40),
      ),
      ElevatedButton(
        onPressed: () {},
        child: Icon(Icons.format_quote, size: 40),
      ),
    ],
  );
}