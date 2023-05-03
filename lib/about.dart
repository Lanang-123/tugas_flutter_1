import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;
    double paddingTopDevice = MediaQuery.of(context).padding.top;

    final aboutAppBar = AppBar(
      centerTitle: true,
      title: const Text('About App'),
      toolbarHeight: 75,
    );

    double heightBody =
        heightDevice - paddingTopDevice - aboutAppBar.preferredSize.height;

    final String? param = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
        appBar: aboutAppBar,
        body: Column(
          children: [
            Container(
              height: heightBody * 0.3,
              width: widthDevice,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://picsum.photos/seed/picsum/200/300/'),
                      fit: BoxFit.cover)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HeaderCard(
                    widthApp: widthDevice,
                    heightCard: heightBody,
                  ),
                  HeaderCard(
                    widthApp: widthDevice,
                    heightCard: heightBody,
                  ),
                  HeaderCard(
                    widthApp: widthDevice,
                    heightCard: heightBody,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: heightBody * 0.2,
            ),
            Text("$param"),
            const SizedBox(
              height: 8,
            ),
            FilledButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.keyboard_arrow_left_rounded),
                label: const Text('Back'))
          ],
        ));
  }
}

class HeaderCard extends StatelessWidget {
  final double widthApp;
  final double heightCard;
  const HeaderCard(
      {super.key, required this.widthApp, required this.heightCard});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight * 0.5,
          width: widthApp * 0.3,
          child: const Card(
            elevation: 8,
            child: Center(
              child: Icon(
                Icons.dashboard,
                size: 40,
                color: Colors.pink,
              ),
            ),
          ),
        );
      },
    );
  }
}
