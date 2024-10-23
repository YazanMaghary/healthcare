import 'package:flutter/material.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text("data"),
      ),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
