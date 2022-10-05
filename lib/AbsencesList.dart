import 'package:flutter/material.dart';
import 'package:geocoding/Model/StudentData.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class AbsenceList extends StatelessWidget {
  AbsenceList({key});
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StudentData>(
      create: (context) {
        return StudentData();
      },
      child: DefaultTabController(
          length: 4,
          initialIndex: index,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(tabs: [
                    Text(
                      "مستوى اول",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "مستوى ثاني",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      "مستوى ثالث",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      "مستوى رابع",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ]),
                  title: Row(
                    children: [
                      Text("ورتل القرآن ترتيلاً"),
                      Spacer(),
                      Image(
                        image: AssetImage('images/wrtl.png'),
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
                body: TabBarView(children: [
                  Consumer<StudentData>(
                    builder: (context, studentdata, child) {
                      return getIt<StudentData>().GetStudentL1().length == 0
                          ? Center(
                              child: Text("لاتوجد بيانات بعد!!"),
                            )
                          : ListView.builder(
                              itemCount:
                                  getIt<StudentData>().GetStudentL1().length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                          "${getIt<StudentData>().studentsL1[index]['name']}"),
                                      subtitle: Text(
                                          "${getIt<StudentData>().studentsL1[index]['level']}"),
                                      trailing: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                              "عدد ابام الحضور : ${getIt<StudentData>().studentsL1[index]['attendance']}"),
                                          Text(
                                              "عدد ايام الغياب : ${getIt<StudentData>().studentsL1[index]['absence']}")
                                        ],
                                      ),
                                    ),
                                    Divider(thickness: 2)
                                  ],
                                );
                              });
                    },
                  ),
                  Consumer<StudentData>(
                    builder: (context, studentdata, child) {
                      return getIt<StudentData>().GetStudentL2().length == 0
                          ? Center(
                              child: Text("لاتوجد بيانات بعد!!"),
                            )
                          : ListView.builder(
                              itemCount:
                                  getIt<StudentData>().GetStudentL2().length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                          "${getIt<StudentData>().studentsL2[index]['name']}"),
                                      subtitle: Text(
                                          "${getIt<StudentData>().studentsL2[index]['level']}"),
                                      trailing: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                              "عدد ابام الحضور : ${getIt<StudentData>().studentsL2[index]['attendance']}"),
                                          Text(
                                              "عدد ايام الغياب : ${getIt<StudentData>().studentsL2[index]['absence']}")
                                        ],
                                      ),
                                    ),
                                    Divider(thickness: 2)
                                  ],
                                );
                              });
                    },
                  ),
                  Consumer<StudentData>(
                    builder: (context, studentdata, child) {
                      return getIt<StudentData>().GetStudentL3().length == 0
                          ? Center(
                              child: Text("لاتوجد بيانات بعد!!"),
                            )
                          : ListView.builder(
                              itemCount:
                                  getIt<StudentData>().GetStudentL3().length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                          "${getIt<StudentData>().studentsL3[index]['name']}"),
                                      subtitle: Text(
                                          "${getIt<StudentData>().studentsL3[index]['level']}"),
                                      trailing: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                              "عدد ابام الحضور : ${getIt<StudentData>().studentsL3[index]['attendance']}"),
                                          Text(
                                              "عدد ايام الغياب : ${getIt<StudentData>().studentsL3[index]['absence']}")
                                        ],
                                      ),
                                    ),
                                    Divider(thickness: 2)
                                  ],
                                );
                              });
                    },
                  ),
                  Consumer<StudentData>(
                    builder: (context, studentdata, child) {
                      return getIt<StudentData>().GetStudentL4().length == 0
                          ? Center(
                              child: Text("لاتوجد بيانات بعد!!"),
                            )
                          : ListView.builder(
                              itemCount:
                                  getIt<StudentData>().GetStudentL4().length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                          "${getIt<StudentData>().studentsL4[index]['name']}"),
                                      subtitle: Text(
                                          "${getIt<StudentData>().studentsL4[index]['level']}"),
                                      trailing: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                              "عدد ابام الحضور : ${getIt<StudentData>().studentsL4[index]['attendance']}"),
                                          Text(
                                              "عدد ايام الغياب : ${getIt<StudentData>().studentsL4[index]['absence']}")
                                        ],
                                      ),
                                    ),
                                    Divider(thickness: 2)
                                  ],
                                );
                              });
                    },
                  )
                ])),
          )),
    );
  }
}
