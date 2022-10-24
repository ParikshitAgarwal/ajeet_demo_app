import 'dart:convert';

import 'package:demoproject_moneylans/models/user_datamodels.dart';
import 'package:demoproject_moneylans/models/user_detail_model.dart';
import 'package:demoproject_moneylans/user_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TextEditingController ageTextController = TextEditingController();
  TextEditingController genderTextController = TextEditingController();

  List<UserDetail> userList = [];
  List<String> gender = [];
  void initState() {
    super.initState;
    loadData();
  }

  loadData() async {
    final personjson = await rootBundle.loadString("jsonfile/user_mock.json");

    final decodeData = jsonDecode(personjson);
    final userData = decodeData[0]["users"];
    // print(userData);
    userData.forEach((element) {
      UserDetail user = UserDetail(
          id: element["id"], name: element["name"], atype: element["atype"]);
      userList.add(user);
    });
    // List.from(userData).map<Users>((item) => User.formMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Project '),
      ),
      body: Container(
        child: userList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: userList.length,
                itemBuilder: ((context, index) {
                  gender.add("");

                  return Container(
                    width: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                UserDetailScreen(userDetail: userList[index])));
                      },
                      child: Card(
                        color: Colors.amberAccent,
                        child: ListTile(
                          title: Text(
                            userList[index].name!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.purple,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                textStyle: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                            child: userList[index].isLoggedIn
                                ? Text("Sign Out")
                                : Text("Sign in"),
                            onPressed: () {
                              openDialog(index);
                              print(index);
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                })),
      ),
    );
  }

  Future openDialog(int index) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Enter Details"),
            content: Column(
              children: [
                TextField(
                  controller: ageTextController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Enter Your Age"),
                ),
                TextField(
                  controller: genderTextController,
                  decoration: InputDecoration(hintText: "Enter Your Gender"),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                      Navigator.pop(context);
                      userList[index].age = ageTextController.text;
                      userList[index].gender = genderTextController.text;
                      genderTextController.clear();
                      ageTextController.clear();
                      userList[index].isLoggedIn = true;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              UserDetailScreen(userDetail: userList[index])));
                    },
                    child: Text("Log in"))
              ],
            ),
          ));
}
