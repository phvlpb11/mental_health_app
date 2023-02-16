import 'package:flutter/material.dart';
// import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  double _currentSliderValue = 20;
  double _currentSliderValue2 = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: Colors.white, // <-- SEE HERE
            // onPressed: (){},
            // onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
        backgroundColor: Colors.pink[900],
        title: const Text('Ready to answer a few questions ?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const Card(
            margin: EdgeInsets.all(20.0),
            child:
            Text(
              'How would you rate your day?',
            ),
          ),
          Slider(
                      value: _currentSliderValue,
                      max: 100,
                      divisions: 5,
                      activeColor: Colors.purple,
                      inactiveColor: Colors.purple.shade100,
                      thumbColor: Colors.pink,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                  ),
          const Card(
            margin: EdgeInsets.all(20.0),
            child:
            Text(
              'How much gratitude and happy you felt today?',
            ),
          ),
          Slider(
            value: _currentSliderValue2,
            max: 100,
            divisions: 5,
            activeColor: Colors.purple,
            inactiveColor: Colors.purple.shade100,
            thumbColor: Colors.pink,
            label: _currentSliderValue2.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue2 = value;
              });
            },
          ),
          const Card(
            margin: EdgeInsets.all(20.0),
            child:
            Text(
              'Do you feel loved today',
            ),
          ),
          ButtonBarTheme(
            data: const ButtonBarThemeData(),
            child: ButtonBar(

              children: [
                TextButton(
                  child: Text('Yes I am so grateful!!!',
                  style: TextStyle(
                    color: Colors.pink[800],
                  ),
                  ),
                  onPressed: (){},
                ),
                TextButton(
                  child: Text('Unfortunately Not :(',
                    style: TextStyle(
                      color: Colors.pink[800],
                    ),
                  ),
                  onPressed: (){},
                ),
              ],
            ),
          )
        ],
      ),
      );
  }
}
