import 'package:flutter/material.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPage();
}

class _DoctorPage extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.pink[900],
        centerTitle: true,
        title: const Text(
          'Your own Doctor Friend',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/doctor.jpg'),
                radius: 90.0,
              ),
            ),
            Divider(
              height: 40.0,
              color: Colors.pink[600],
            ),
            const Text(
              'NAME',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height:10.0),
            Text(
              'DR JOHN DOE',
              style: TextStyle(
                  color: Colors.pink[900],
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Hospital',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height:10.0),
            Text(
              'AIIMS DELHI',
              style: TextStyle(
                  color: Colors.pink[900],
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                const SizedBox(width: 10.0),
                Text(
                  '8510812460',
                  style: TextStyle(
                      color: Colors.pink[900],
                      letterSpacing: 2.0,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                const Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                const SizedBox(width: 10.0),
                Text(
                  'drjohndoe@gmail.com',
                  style: TextStyle(
                      color: Colors.pink[900],
                      letterSpacing: 2.0,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
