import 'package:flutter/material.dart';

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
      // Navigator.pushReplacementNamed(context, 'auth'));
      Navigator.pushReplacementNamed(context, 'auth'));
    }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                backgroundColor: Color.fromRGBO(255, 126, 29, 1.0),
                radius: 30.0,
              ),
              SizedBox(width: 10.0),
              Text('mySpace',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: 'Lato-Regular',
                  color: Color.fromRGBO(58, 57, 56, 1.0),
                ),)
            ],
          ),
        ],
      ),
    );
  }
}
