import 'package:flutter/material.dart';
import 'package:geocoding/Model/GETDATA.dart';
import 'package:geocoding/Model/StudentData.dart';
import 'package:geocoding/Views/AbsenceStudents.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class Students extends StatefulWidget {
  final state;

  Students({required this.state, Key? key});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  @override
  void initState() {
    // getIt.isReady<StudentData>().then((_) {
    //   getIt<StudentData>().addListener((update));
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state == 1) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: ChangeNotifierProvider<StudentData>(
          create: (context) {
            return StudentData();
          },
          child: Scaffold(
              appBar: AppBar(),
              body: Consumer<StudentData>(
                builder: (context, studentdata, child) {
                  return FutureBuilder(
                    future: GetData.getdata(),
                    builder:
                        (context, AsyncSnapshot<List<List<Map>>> snapshot) {
                      if (snapshot.hasData) {
                        // getIt<StudentData>()
                        //     .SetStudentL1(snapshot.data!.elementAt(0));
                        return getIt<StudentData>().GetStudentL1().length == 0
                            ? Center(
                                child: Text("لاتوجد بيانات بعد!!"),
                              )
                            : ListView.builder(
                                itemCount: getIt<StudentData>()
                                    .GetStudentL1()
                                    .length, //studentdata.GetStudentL1().length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          print(widget.state);
                                        },
                                        leading: Icon(Icons.person),
                                        title: Text(
                                          "${getIt<StudentData>().studentsL1[index]['name']}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        subtitle: Text(
                                            "${getIt<StudentData>().studentsL1[index]['phoneNumber']}"),
                                        trailing: Text(
                                            "المستوى : ${getIt<StudentData>().studentsL1[index]['level']}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                      ),
                                      Divider(
                                        thickness: 3,
                                        color: Colors.green,
                                      )
                                    ],
                                  );
                                });
                      } else if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                },
              )),
        ),
      );
    } else if (widget.state == 2) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: ChangeNotifierProvider<StudentData>(
          create: (context) {
            return StudentData();
          },
          child: Scaffold(
              appBar: AppBar(),
              body: Consumer<StudentData>(
                builder: (context, studentdata, child) {
                  return FutureBuilder(
                    future: GetData.getdata(),
                    builder:
                        (context, AsyncSnapshot<List<List<Map>>> snapshot) {
                      if (snapshot.hasData) {
                        // getIt<StudentData>()
                        //     .SetStudentL2(snapshot.data!.elementAt(1));
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
                                        onTap: () {
                                          print(widget.state);
                                        },
                                        leading: Icon(Icons.person),
                                        title: Text(
                                          "${getIt<StudentData>().studentsL2[index]['name']}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        subtitle: Text(
                                            "${getIt<StudentData>().studentsL2[index]['phoneNumber']}"),
                                        trailing: Text(
                                            "المستوى : ${getIt<StudentData>().studentsL2[index]['level']}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                      ),
                                      Divider(
                                        thickness: 3,
                                        color: Colors.green,
                                      )
                                    ],
                                  );
                                });
                      } else if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                },
              )),
        ),
      );
    } else if (widget.state == 3) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: ChangeNotifierProvider<StudentData>(
          create: (context) {
            return StudentData();
          },
          child: Scaffold(
              appBar: AppBar(),
              body: Consumer<StudentData>(
                builder: (context, studentdata, child) {
                  return FutureBuilder(
                    future: GetData.getdata(),
                    builder:
                        (context, AsyncSnapshot<List<List<Map>>> snapshot) {
                      if (snapshot.hasData) {
                        // getIt<StudentData>()
                        //     .SetStudentL3(snapshot.data!.elementAt(2));

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
                                        onTap: () {
                                          print(widget.state);
                                        },
                                        leading: Icon(Icons.person),
                                        title: Text(
                                          "${getIt<StudentData>().studentsL3[index]['name']}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        subtitle: Text(
                                            "${getIt<StudentData>().studentsL3[index]['phoneNumber']}"),
                                        trailing: Text(
                                            "المستوى : ${getIt<StudentData>().studentsL3[index]['level']}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                      ),
                                      Divider(
                                        thickness: 3,
                                        color: Colors.green,
                                      )
                                    ],
                                  );
                                });
                      } else if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                },
              )),
        ),
      );
    } else {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: ChangeNotifierProvider<StudentData>(
          create: (context) {
            return StudentData();
          },
          child: Scaffold(
              appBar: AppBar(),
              body: Consumer<StudentData>(
                builder: (context, studentdata, child) {
                  return FutureBuilder(
                      future: GetData.getdata(),
                      builder:
                          (context, AsyncSnapshot<List<List<Map>>> snapshot) {
                        if (snapshot.hasData) {
                          // getIt<StudentData>()
                          //     .SetStudentL4(snapshot.data!.elementAt(3));
                          return getIt<StudentData>().GetStudentL4().length == 0
                              ? Center(
                                  child: Text("لاتوجد بيانات بعد!!"),
                                )
                              : ListView.builder(
                                  itemCount: getIt<StudentData>()
                                      .GetStudentL4()
                                      .length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            print(widget.state);
                                          },
                                          leading: Icon(Icons.person),
                                          title: Text(
                                            "${getIt<StudentData>().studentsL4[index]['name']}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          subtitle: Text(
                                              "${getIt<StudentData>().studentsL4[index]['phoneNumber']}"),
                                          trailing: Text(
                                              "المستوى : ${getIt<StudentData>().studentsL4[index]['level']}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        Divider(
                                          thickness: 3,
                                          color: Colors.green,
                                        )
                                      ],
                                    );
                                  });
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text("${snapshot.error}"),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      });
                },
              )),
        ),
      );
    }
  }
}
