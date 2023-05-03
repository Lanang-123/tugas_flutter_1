import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class News extends StatefulWidget {
  final List<Map<String, dynamic>> newsData;
  const News({super.key, required this.newsData});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    double paddingBottom = MediaQuery.of(context).padding.bottom + 200;

    return Container(
      padding: EdgeInsets.only(bottom: paddingBottom),
      height: 500,
      child: GridView.builder(
          itemCount: widget.newsData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 3 / 4),
          itemBuilder: (context, index) {
            final data = widget.newsData[index];

            return SizedBox(
              child: Stack(children: [
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://picsum.photos/id/${237 + index}/200/300',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(data['name']),
                        Text('${data['age']}'),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilledButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.pink)),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: const Text('Informasi:'),
                                  content:
                                      Text("Nama saya adalah ${data['name']}"),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    )
                                  ],
                                );
                              });
                        },
                        child: const Text('Dialog')),
                  ),
                )
              ]),
            );
          }),
    );
  }
}
