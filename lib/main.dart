import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// final Uri url = Uri.parse('https://google.com');

// Future<void> openUrl() async {
//   if (!await launchUrl(url)) {
//     throw Exception('Could not launch $url');
//   }
// }

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row (
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
          ]
        )
      ),
    );
  }
}
