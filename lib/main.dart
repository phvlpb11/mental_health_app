import 'package:flutter/material.dart';
import 'CustomTabBar.dart';
import 'Screens/Dashboard.dart';
import 'Screens/Tasks.dart';
import 'Screens/SplashPage.dart';
import 'Questions.dart';
import 'Screens/DoctorPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String uid;

  const MyApp({super.key, this.uid = ""});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashPage(),
      initialRoute: '/',
      routes: {
        // "tasks":(context)=>Tasks(uid: uid),
        "main": (context) => MyHomePage(uid: uid),
        "doctor": (context) => const DoctorPage(),
        // "account": (context)=>AccountPage(),
        "ques": (context) => const Questions(),
      },
      title: 'Companion',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String uid;

  const MyHomePage({super.key, required this.uid});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = 'Healthify ++';

  // get uid => null;

  @override
  State<MyHomePage> createState() => _MyHomePageState(uid: uid);
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController(initialPage: 0);

  _MyHomePageState({required this.uid});

  String uid;

  Map<String, Widget> pages = {};

  @override
  void initState() {
    pages = <String, Widget>{
      "Tasks": Tasks(uid: uid),
      "Dashboard": const Dashboard(),
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          backgroundColor: Colors.pink[900],
          title: Text(widget.title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontStyle: FontStyle.normal, fontWeight: FontWeight.bold)),

          bottom: CustomTabBar(
            pageController: pageController,
            pageNames: pages.keys.toList(),
          ),
        ),
        drawer: Drawer(
            backgroundColor: Colors.pink[200],
            elevation: 16.0,
            child: ListView(
              // padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/drawer.jpg'),
                    ),
                    shape: BoxShape.circle,
                  ),
                  margin: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text.rich(
                      TextSpan(
                        text: "Healthify ++",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/doctor.jpg'),
                  ),
                  // leading: Image.asset('assets/doctor.jpg'),
                  title: Text(
                    'Get Professional Help',
                    style: TextStyle(
                        color: Colors.pink[800],
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DoctorPage()),
                    );
                  },
                ),
                // const SizedBox(height: 40.0),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/Account.jpg'),
                  ),
                  // leading: Image.asset('assets/Account.jpg'),
                  title: Text(
                    'Your Account',
                    style: TextStyle(
                        color: Colors.pink[800],
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "account");
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 40.0),
                ListTile(
                  title: Text(
                    'Logout',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.pink[800],
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                  trailing: const Icon(Icons.exit_to_app),
                  onTap: () {},
                  // onTap: () async {
                  //   await signOutWithGoogle();
                  //   Navigator.of(context).pushReplacementNamed('/');
                  // },
                ),
                const SizedBox(height: 200.0),
                Align(
                    alignment: FractionalOffset.bottomCenter,
                    // alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(FontAwesomeIcons.facebook,
                        color: Colors.pink,
                        ),
                        SizedBox(width: 10.0),

                        Icon(FontAwesomeIcons.instagram,
                            color: Colors.pink,
                        ),
                        SizedBox(width: 10.0),

                        Icon(FontAwesomeIcons.twitter,
                            color: Colors.pink,
                        ),
                        SizedBox(width: 10.0),
                      ],
                    )
                ),
              ],
            ),
        ),
        body: PageView(
          controller: pageController,
          children: pages.values.toList(),
        ));
  }
}
