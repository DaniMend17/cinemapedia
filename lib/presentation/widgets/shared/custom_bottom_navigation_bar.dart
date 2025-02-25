import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      elevation: 0,
      selectedItemColor: color.primary,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Opción 1'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Opción 2'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Opción 1'
        ),
      ]
    );
  }
}  