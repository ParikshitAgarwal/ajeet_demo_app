import 'package:flutter/material.dart';

import 'package:demoproject_moneylans/models/user_detail_model.dart';

class UserDetailScreen extends StatelessWidget {
  final UserDetail userDetail;
  const UserDetailScreen({
    Key? key,
    required this.userDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Name: ${userDetail.name}",
                textAlign: TextAlign.left,
              ),
              Text(
                "Age: ${userDetail.age}",
                textAlign: TextAlign.left,
              ),
              Text(
                "Gender: ${userDetail.gender}",
                textAlign: TextAlign.left,
              )
            ]),
      ),
    );
  }
}
