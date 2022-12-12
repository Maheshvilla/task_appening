// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Provider/profile_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProfileNotifier>().employeeGetdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: context.watch<ProfileNotifier>().isLoading == true
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: MediaQuery.of(context).size.height * 1,
                child: ListView.builder(
                    itemCount: context
                        .watch<ProfileNotifier>()
                        .employeeList!
                        .Employeedata!
                        .length,
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 4,
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                    radius: 60,
                                    backgroundImage: NetworkImage(context
                                                .watch<ProfileNotifier>()
                                                .employeeList!
                                                .Employeedata![index]
                                                .avatar ==
                                            null
                                        ? "https://img.freepik.com/free-vector/404-error-lost-space-concept-illustration_114360-7901.jpg?w=2000"
                                        : context
                                            .watch<ProfileNotifier>()
                                            .employeeList!
                                            .Employeedata![index]
                                            .avatar!)),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // RichText(text: TextSpan(
                                      //   children: [
                                      //     TextSpan(text:formatter.format(DateTime.parse(newsData.articles![index].publishedAt!).toLocal()),style: TextStyle(color: Colors.black)),
                                      //     TextSpan(text :' '),
                                      //     TextSpan(text: newsData.articles![index].source!.name,style: TextStyle(color: Colors.black))
                                      //   ]
                                      // )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      RichText(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: context
                                                    .watch<ProfileNotifier>()
                                                    .employeeList!
                                                    .Employeedata![index]
                                                    .first_name,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: context
                                                    .watch<ProfileNotifier>()
                                                    .employeeList!
                                                    .Employeedata![index]
                                                    .last_name,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ])),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      RichText(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: context
                                                    .watch<ProfileNotifier>()
                                                    .employeeList!
                                                    .Employeedata![index]
                                                    .email,
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 12)),
                                          ])),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ));
  }
}
