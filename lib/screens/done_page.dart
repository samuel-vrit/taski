import 'package:flutter/material.dart';
import 'package:taski/constants.dart';
import 'package:taski/widgets/custom_app_bar.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Completed Tasks',
                    style: kHeadingTextStyle1,
                  ),
                  Text(
                    'Delete all',
                    style: kBodyTextStyle.copyWith(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => DeleteTaskElement(),
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteTaskElement extends StatelessWidget {
  const DeleteTaskElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBackGroundGrey,
      ),
      child: Row(
        children: [
          Checkbox(
            value: true,
            side: BorderSide(color: Colors.grey, width: 2),
            onChanged: (val) {},
          ),
          SizedBox(width: 16),
          Text(
            'Design use case page',
            style: kBodyTextStyle.copyWith(color: kTextColor02),
          ),
          Spacer(),
          Icon(
            Icons.delete,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
