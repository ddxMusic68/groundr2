import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';
import 'json.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController calendarURL = TextEditingController();
  final TextEditingController newsURL = TextEditingController();
  final TextEditingController emailURL = TextEditingController();

  @override
  void dispose() {
    calendarURL.dispose();
    newsURL.dispose();
    emailURL.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
    return Column (
        children: [
          TextField(
            controller: calendarURL,
            decoration: InputDecoration(
              labelText: 'Calendar URL',
            ),
          ),
          TextField(
            controller: newsURL,
            decoration: InputDecoration(
              labelText: 'News URL',
            ),
          ),
          TextField(
            controller: emailURL,
            decoration: InputDecoration(
              labelText: 'Email URL',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              saveSettings({
                "calendar": calendarURL.text,
                "news": newsURL.text,
                "email": emailURL.text,
              });
            },
            child: Text('Save Settings'),
          )
        ]
      );
  }
}