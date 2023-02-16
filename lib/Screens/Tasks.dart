import 'package:flutter/material.dart';
import 'package:mental_health_app/Questions.dart';

import 'package:animated_background/animated_background.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key, this.uid = ""});

  final String uid;

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> with TickerProviderStateMixin{
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.pinkAccent,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: AnimatedBackground(
              vsync: this,
              behaviour: RandomParticleBehaviour(options: particles),
              child: Card(
                elevation: 2.0,
                margin: const EdgeInsets.all(12.0),
                child: ListView(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.all(10.0),
                      leading: const Icon(Icons.people),
                      title: const Text("Meet more people"),
                      subtitle: const Text("You will feel Awesome!!!"),
                      trailing: Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ),
                    Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/task_meetpeople.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    // SizedBox(height: 10.0),
                    const ListTile(
                      leading: Icon(Icons.question_answer),
                      title: Text('Ready to answer a few questions?'),
                      subtitle: Text('It will only take a minute'),
                    ),
                    ButtonBarTheme(
                      data: const ButtonBarThemeData(),
                      child: ButtonBar(
                        children: <Widget>[
                          TextButton(
                            child: Text(
                              'Yes!',
                              style: TextStyle(
                                color: Colors.pink[800],
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Questions()),
                              );
                            },
                            // onPressed: () {
                            //   Navigator.of(context).push(
                            //       MaterialPageRoute(builder: (context) => Questions(document)));
                            // },
                          ),
                          TextButton(
                            child: Text(
                              'Not now',
                              style: TextStyle(
                                color: Colors.pink[800],
                              ),
                            ),
                            onPressed: () {},
                            // onPressed: () {
                            //   setState(() {
                            //     document.reference.updateData({
                            //       "answered":true
                            //     });
                            //   });
                            // },
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      leading: const Icon(Icons.library_music),
                      title: const Text("Listen to Music"),
                      subtitle: const Text("Relax Yourself"),
                      trailing: Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked2,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked2 = value!;
                          });
                        },
                      ),
                    ),
                    Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/task_listenmusic.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ListTile(
                      leading: const Icon(Icons.run_circle),
                      title:
                          const Text('Have you been close to the nature today?'),
                      subtitle: const Text('Go for a walk.'),
                      trailing: Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked3,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked3 = value!;
                          });
                        },
                      ),
                    ),
                    Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/task_naturewalk.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
