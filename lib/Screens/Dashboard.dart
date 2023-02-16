import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child:
              // (!show)?
              //   Container()
              // :
              ListView(
                children: [
              // (progress>0)?
              const ListTile(
                // leading: Image.asset('assets/community.jpg'),
                title: Text("Congratulations!",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("You met more people today. Keep it going."),
                // subtitle: Text("You met $progress more people today. Keep it going."),
              ),
              Container(
                height: 300.0,
                width: 500.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/community.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // :
              const ListTile(
                // leading: Image.asset('assets/encourage.jpg'),
                title: Text("Come On Sport!",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("You are yet to make progress."),
              ),

              Container(
                height: 300.0,
                width: 500.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/encourage.jpg'),
                    fit: BoxFit.fill,
                  ),
                  // shape: BoxShape.circle,
                ),
              ),

              ButtonBarTheme(
                data: const ButtonBarThemeData(),
                child: ButtonBar(
                  children: [
                    TextButton(
                      child: Text(
                        'Share',
                        style: TextStyle(
                          color: Colors.pink[800],
                        ),
                      ),
                      onPressed: () {
                        //implement social media here
                      },
                    ),
                    TextButton(
                      child: Text(
                        'Dismiss',
                        style: TextStyle(
                          color: Colors.pink[800],
                        ),
                      ),
                      onPressed: () {},
                      // onPressed: () {
                      // setState(() {
                      // show=false;
                      // });
                      // },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
