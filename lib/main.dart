import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'settings.dart';
import 'json.dart';

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
          switch (currentIndex) {
            case 0: setCurrentIndex(1);
            case 1: setCurrentIndex(0);
            default: null;
          };
        },
        child: (currentIndex == 0) ? Icon(Icons.settings) : Icon(Icons.home),
      ),
      ),
    );
  }
}

Widget getMain() {
  return 
  Padding (
    padding: EdgeInsets.all(20),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      getButton(
        icon: Icons.calendar_month_outlined,
        onPressed: () async {
          final settings = await loadSettings();
          final url = Uri.parse(settings["calendar"]);
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
      ),
      SizedBox(width:20),
      getButton(
        icon: Icons.email,
        onPressed: () async {
          final settings = await loadSettings();
          final url = Uri.parse(settings["email"]);
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
      ),
      SizedBox(width:20),
      getButton(
        icon: Icons.newspaper,
        onPressed: () async {
          final settings = await loadSettings();
          final url = Uri.parse(settings["news"]);
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
      ),
    ],
  )
  );
}

Expanded getButton({required IconData icon, required VoidCallback onPressed}) {
  return Expanded( 
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, 100),
      ),
      onPressed: onPressed,
      child: Icon(icon, size: 40),
    )
  );
}