import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Cinemapedia'),
        const SizedBox(height: 15,),
        Center(child: CircularProgressIndicator())
      ],
    ));
  }
}
