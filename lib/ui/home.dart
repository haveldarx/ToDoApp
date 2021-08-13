import 'package:flutter/material.dart';
import 'package:todoapp/ui/notodo_screen.dart';
class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("No To Do App"),
        backgroundColor: Colors.lightBlueAccent
      ),
      body:NotoDOScrenn(),
    );
  }
}