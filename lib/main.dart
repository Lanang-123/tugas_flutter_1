import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutor1/about.dart';
import 'package:tutor1/practice.dart';
import 'package:tutor1/profile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,

          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          cardTheme: CardTheme(color: Colors.white)),
      home: const PracticePage(),
      initialRoute: '/practice',
      routes: {
        '/practice': (context) => const PracticePage(),
        '/about': (context) => const AboutPage(),
        '/profile': (context) => const ProfilePage()
      },
    );
  }
}








// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Debi Sayang'),
//         centerTitle: true,
//         bottom: TabBar(controller: _tabController, tabs: const [
//           Tab(
//             icon: Icon(Icons.favorite),
//             text: 'Debi',
//           ),
//           Tab(
//             icon: Icon(Icons.favorite),
//             text: 'Debi',
//           ),
//           Tab(
//             icon: Icon(Icons.favorite),
//             text: 'Debi',
//           )
//         ]),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           Center(
//             child: Text(
//               'Aku sayang kamu',
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.pink),
//             ),
//           ),
//           Center(
//             child: Text(
//               'Aku Cinta kamu',
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.pink),
//             ),
//           ),
//           Center(
//               child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'I LOVE YOU',
//                 style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.pink),
//               ),
//               const SizedBox(
//                 width: 8,
//               ),
//               Icon(
//                 Icons.favorite_border,
//                 color: Colors.pink,
//                 size: 50,
//               )
//             ],
//           ))
//         ],
//       ),
//     );
//   }
// }
