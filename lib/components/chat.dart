import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final List<Map<String, dynamic>> chatData;
  const Chat({super.key, required this.chatData});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          itemCount: widget.chatData.length,
          itemBuilder: (context, index) {
            final data = widget.chatData[index];
            return Dismissible(
              key: Key(index.toString()),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.pink,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 10),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1))),
                child: ListTile(
                  title: Text(data['name']),
                  subtitle: Text("${data['age']}"),
                ),
              ),
            );
          }),
    );
  }
}
