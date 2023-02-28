import 'package:flutter/material.dart';
import 'package:mental_health_app/Screens/AccountPage.dart';
import 'package:mental_health_app/Screens/explore_mySpace.dart';
import 'package:mental_health_app/Screens/login_or_register.dart';
import 'package:mental_health_app/auth.dart';
import 'CustomTabBar.dart';
import 'Screens/Dashboard.dart';
import 'Screens/Tasks.dart';
import 'Screens/SplashPage.dart';
import 'Questions.dart';
import 'Screens/DoctorPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String uid;

  const MyApp({super.key,this.uid=''});

  get onTap => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashPage(),
      routes: {
        "auth": (context) => const AuthPage(),
        "explore": (context) => const Explore(),
        "tasks": (context) => Tasks(uid: uid),
        "main": (context) => MyHomePage(uid: uid),
        "doctor": (context) => const DoctorPage(),
        "account": (context) => const AccountPage(),
        "ques": (context) => const Questions(),
        "loginregister": (context)=> const LoginOrRegister(),
      },
      title: 'mySpace',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }

  togglePage() {}
}

class MyHomePage extends StatefulWidget {
  final String uid;

  const MyHomePage({super.key, required this.uid});

  // final String title = 'mySpace';

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[900],
          title: const Text('mySpace',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
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
                      text: "MySpace",
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
                    MaterialPageRoute(builder: (context) => const DoctorPage()),
                  );
                },
              ),
              // const SizedBox(height: 40.0),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/Account.jpg'),
                ),
                title: Text(
                  'Your Account',
                  style: TextStyle(
                      color: Colors.pink[800],
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountPage()),
                  );
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
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  // Navigator.of(context).pushReplacementNamed('login');
                },
              ),
              const SizedBox(height: 200.0),
              Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.pink,
                      ),
                      SizedBox(width: 10.0),
                      Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.pink,
                      ),
                      SizedBox(width: 10.0),
                      Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.pink,
                      ),
                      SizedBox(width: 10.0),
                    ],
                  )),
            ],
          ),
        ),
        body: PageView(
          controller: pageController,
          children: pages.values.toList(),
        ));
  }
}
