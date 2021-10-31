import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Welcome doctor",
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.assignment_rounded),
        label: Text("Your patients",
            style: TextStyle(fontWeight: FontWeight.bold)),
        onPressed: () {},
      ),
    );
  }
}
