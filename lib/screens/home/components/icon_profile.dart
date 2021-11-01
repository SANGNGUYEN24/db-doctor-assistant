import 'package:flutter/material.dart';

import '../../doctor_info.dart';

class IconProfile extends StatelessWidget {
  String doctorId;
  void getDoctorId() async {
    // HomeScreen homeScreen = new HomeScreen();
    // doctorId = homeScreen.doctorId;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.account_circle_rounded,
        size: 28.0,
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DoctorInfo(
                      doctorId: doctorId,
                    )));
      },
    );
  }
}
