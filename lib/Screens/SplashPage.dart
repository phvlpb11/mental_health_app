import 'package:flutter/material.dart';
// import 'package:mental_health_app/main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) =>
      Navigator.pushReplacementNamed(context, 'main'));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/opening_logo.jpg'),
              ),
              SizedBox(width: 20.0),
              CircularProgressIndicator(),
              SizedBox(width: 20.0),
              Text("Please wait..."),
            ],
          ),
        ],
      ),
    );
  }
}
