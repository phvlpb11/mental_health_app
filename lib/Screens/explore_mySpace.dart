import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.orange,
            child: Column(
              children: [
                const SizedBox(
                  height: 450.0,
                ),
                Lottie.asset(
                    "assets/54102-sunrise-breathe-in-breathe-out.json"),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'loginregister');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Explore mySpace',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.orange,
                          fontSize: 20,
                          fontFamily: 'Lato-regular',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.orange,
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Here we go',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontFamily: 'Lato-regular',
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Your journey to a happier, healthier life',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontFamily: 'Lato-regular',
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'starts now',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontFamily: 'Lato-regular',
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
