import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tutor1/components/chat.dart';
import 'package:tutor1/components/news.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  List<Map<String, dynamic>> myList = [
    {'name': 'John', 'age': 20},
    {'name': 'Jane', 'age': 22},
    {'name': 'Lanang', 'age': 22},
    {'name': 'Debi', 'age': 22},
    {'name': 'Sasra', 'age': 22},
  ];

  List<Map<String, dynamic>> myNav = [
    {
      'title': 'About',
      'name': 'About Page App',
      'icon': 'about_icon',
      'path': 'about'
    },
    {
      'title': 'Profile',
      'name': 'Profile Page App',
      'icon': 'user_icon',
      'path': 'profile'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    double marginRight = MediaQuery.of(context).padding.right + 200;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text(
            'Practice Apps',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          toolbarHeight: 75,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(15),
                  height: 200,
                  width: double.infinity,
                  color: Colors.pink,
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                      text: const TextSpan(
                          text: 'Practice App\n',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                          children: [
                        TextSpan(
                          text: '@Lanang Darma',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      ])))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: paddingTop, horizontal: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: myNav.map((e) {
                    final path = e['path'];
                    return Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: FilledButton.icon(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.pink)),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                path == 'about' ? '/about' : '/profile',
                                arguments: e['name']);
                          },
                          icon: e['icon'] == "about_icon"
                              ? const Icon(Icons.info)
                              : const Icon(Icons.person),
                          label: Text(e['title'])),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 8),
                Chat(
                  chatData: myList,
                ),
                const SizedBox(
                  height: 12,
                ),
                News(
                  newsData: myList,
                ),
              ],
            ),
          ),
        ));
  }
}
