import 'package:flutter/material.dart';
import 'package:taski/constants.dart';

class AddTaskSheet extends StatelessWidget {
  const AddTaskSheet({
    this.onTitleChanged,
    this.onDescriptionChanged,
    this.onCreate,
    super.key,
  });

  final void Function(String)? onTitleChanged;
  final void Function(String)? onDescriptionChanged;
  final void Function()? onCreate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //Title
          TextField(
            onChanged: onTitleChanged,
            decoration: InputDecoration(
              hintText: 'Add a title',
              hintStyle: TextStyle(color: kTextColor02),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          //Description
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.edit,
                size: 22,
                color: Colors.grey,
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  onChanged: onDescriptionChanged,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Add a description',
                    hintStyle: TextStyle(color: kTextColor02),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kThemeColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          //Create button
          ElevatedButton(
            style: TextButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onCreate,
            child: Text(
              'Create',
              style: kBodyTextStyle.copyWith(color: kThemeColor),
            ),
          )
        ],
      ),
    );
  }
}
