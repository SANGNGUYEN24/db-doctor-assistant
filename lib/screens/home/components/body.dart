import 'package:app/screens/home/components/patient_list.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            Container(
              padding: EdgeInsets.only(left: 24),
              alignment: Alignment.topLeft,
              child: Text(
                "All patients",
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            PatientList(),
          ],
        ),
      ),
    );
  }
}
