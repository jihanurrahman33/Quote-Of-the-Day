import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project_1/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Quote App",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                var url = Uri.parse(
                    'https://api.quotable.io/random?tags=technology%2Cfamous-quotes');
                var response = await http.get(url);
                print('Response Status: ${response.statusCode}');
                print('Response Body: ${response.body}');
                var data = jsonDecode(response.body);
                String quote = data['content'];
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SecondScreen(quote: quote)));
              },
              child: const Text("Click Me"),
            ),
          ),
          const Text(
            "\n\nMade By @Nishak69",
            style: TextStyle(color: Colors.white, fontSize: 40),
          )
        ],
      )),
    );
  }
}
