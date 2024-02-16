import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task manager'),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(child: ListView.builder(
                itemCount: ,
                itemBuilder: (context, index) {
                  
                },))
            ],
          ),
        ));
  }
}
