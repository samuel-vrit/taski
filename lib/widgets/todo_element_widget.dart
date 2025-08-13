import 'package:flutter/material.dart';
import 'package:taski/constants.dart';

class TodoElementWidget extends StatelessWidget {
  const TodoElementWidget({
    required this.title,
    this.description = '',
    super.key,
  });

  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      collapsedBackgroundColor: kBackGroundGrey,
      backgroundColor: kBackGroundGrey,
      childrenPadding: EdgeInsets.only(left: 60, top: 10, bottom: 10),
      leading: Checkbox(
        value: false,
        side: BorderSide(color: Colors.grey, width: 2),
        onChanged: (val) {},
      ),
      title: Text(
        title,
        style: kBodyTextStyle,
      ),
      showTrailingIcon: false,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                description,
                style: kBodyTextStyle.copyWith(color: kTextColor02),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
