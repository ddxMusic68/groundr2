import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          TextField(
            controller: emailURL,
            decoration: InputDecoration(
              labelText: 'Email URL',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          ElevatedButton(
            onPressed: () {
              saveSettings({
                "calendar": int.tryParse(calendarURL.text) ?? 20,
                "news": int.tryParse(newsURL.text) ?? 10,
                "email": int.tryParse(emailURL.text) ?? 5,
              });
            },
            child: Text('Save Settings'),
          )
        ]
      );
  }
}