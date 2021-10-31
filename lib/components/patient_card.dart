import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class PatientCard extends StatelessWidget {
  final String patientName;
  final String birthdate;
  final int fType;
  const PatientCard({
    this.patientName,
    this.birthdate,
    this.fType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(24, 4, 24, 4),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(
              child: Text(
                patientName,
                style: TextStyle(
                    color: kPrimaryLightColor,
                    fontSize: getProportionateScreenWidth(24)),
              ),
            ),
            Text(
              "F$fType",
              style: TextStyle(color: kPrimaryLightColor, fontSize: 18),
            ),
          ]),
          SizedBox(height: getProportionateScreenHeight(8)),
          Text(
            birthdate,
            style: TextStyle(color: kPrimaryLightColor),
          ),
        ],
      ),
    );
  }
}
