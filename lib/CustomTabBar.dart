import 'package:flutter/material.dart';

class CustomTabBar extends AnimatedWidget implements PreferredSizeWidget{
  const CustomTabBar({super.key, required this.pageController, required this.pageNames})
      :super(listenable :pageController);

  final PageController pageController;
  final List<String> pageNames;

  @override
  final Size preferredSize=const Size(0.0,70.0);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 40.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: List.generate(pageNames.length, (int index){
          return InkWell
            (child: Text(
              pageNames[index],
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.white.withOpacity(
                    index==pageController.page ? 1.0:0.6),
                fontWeight:FontWeight.bold,
              )
          ),
              onTap: (){
                pageController.animateToPage(
                    index,
                    curve:Curves.easeOut,
                    duration: const Duration(milliseconds: 300)
                );});
        }
        ) .toList(),
      ),
    );
  }
}