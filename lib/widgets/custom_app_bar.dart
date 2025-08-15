import 'package:flutter/material.dart';
import 'package:taski/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/app_logo.png',
          height: 40,
          width: 40,
        ),
        SizedBox(width: 5),
        Text(
          'Taski',
          style: kHeadingTextStyle1,
        ),
        Spacer(),
        Text(
          'John',
          style: kHeadingTextStyle2,
        ),
        SizedBox(width: 10),
        CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage('assets/images/profile_image.png'),
        )
      ],
    );
  }
}
