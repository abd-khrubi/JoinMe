import 'MyDrawer.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

    debugShowCheckedModeBanner: false,

      home:Scaffold(
      appBar: AppBar(title: Text('Choose Campus')),
      body: Center(
        child: ListView(
          children: [],
        )
      ),
      drawer:MyDrawer()
    ),
    );
  }
}
