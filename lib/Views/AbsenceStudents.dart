import 'package:flutter/material.dart';
import 'package:geocoding/Model/GETDATA.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/AbsenceData.dart';
import '../Model/StudentData.dart';
import '../main.dart';

class AbsenceStudents extends StatefulWidget {
  const AbsenceStudents({key});

  @override
  State<AbsenceStudents> createState() => _AbsenceStudentState();
}

class _AbsenceStudentState extends State<AbsenceStudents> {
  @override
  void initState() {
    print("=========> ${getIt<StudentData>().GetStudentL1().length}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    updateSharedPrefrences(bool state, var id) async {
      print("==============");
      print("ID $id");
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      List<String> data = await GetData.getStudentById(id);
      if (state) {
        int x = int.parse(data.elementAt(8));
        x++;
        data[8] = x.toString();
      } else {
        int x = int.parse(data.elementAt(7));
        x++;
        data[7] = x.toString();
      }
      sharedPreferences.setStringList("Item$id", data);
      GetData.getdata();
    }

    bool checkIfFound(Map<int, bool> abcence, int index) {
      if (abcence.containsKey(index)) {
        return abcence[index]!;
      } else {
        return false;
      }
    }

    // for (int i = 0; i < getIt<StudentData>().GetStudentL1().length; i++) {
    //   context
    //       .watch<AbsenceData>()
    //       .dataAbsenceL1
    //       .addAll({getIt<StudentData>().studentsL1[i]['id']: false});
    // }

    print("Data : ${getIt<StudentData>().GetStudentL1().length}");

    return Directionality(
        textDirection: TextDirection.rtl,
        child: TabBarView(children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(
                height: 400,
                child: Consumer<StudentData>(
                  builder: (context, studentdata, child) {
                    return FutureBuilder(
                        future: GetData.getdata(),
                        builder:
                            (context, AsyncSnapshot<List<List<Map>>> snapshot) {
                          if (snapshot.hasData) {
                            // getIt<StudentData>()
                            //     .SetStudentL1(snapshot.data!.elementAt(0));
                            return getIt<StudentData>().GetStudentL1().length ==
                                    0
                                ? Center(
                                    child: Text("لاتوجد بيانات بعد!!"),
                                  )
                                : ListView.builder(
                                    itemCount: getIt<StudentData>()
                                        .GetStudentL1()
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                                "${getIt<StudentData>().studentsL1[index]['name']}"),
                                            subtitle: Text(
                                                "${getIt<StudentData>().studentsL1[index]['level']}"),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text("متغيّب"),
                                                Consumer<AbsenceData>(builder:
                                                    (context, absence, child) {
                                                  return Checkbox(
                                                      activeColor: Colors.green,
                                                      value: checkIfFound(
                                                          absence.dataAbsenceL1,
                                                          getIt<StudentData>()
                                                                  .studentsL1[
                                                              index]['id']),
                                                      onChanged: (val) {
                                                        absence.SetAbsenceDataL1(
                                                            getIt<StudentData>()
                                                                    .studentsL1[
                                                                index]['id'],
                                                            val!);
                                                      });
                                                })
                                              ],
                                            ),
                                          ),
                                          Divider(thickness: 2)
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
                        });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: 150,
                child: Consumer<AbsenceData>(
                  builder: (context, absence, child) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        print("===================>");
                        print(absence.dataAbsenceL1);
                        absence.dataAbsenceL1.forEach((key, value) {
                          updateSharedPrefrences(value, key);
                          absence.SetAbsenceDataL1(key, false);
                        });
                        Navigator.of(context).pushNamed("absenceList");
                      },
                      child: Text("تأكيد العمليّة"),
                    );
                  },
                ),
              )
            ]),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(
                height: 400,
                child: Consumer<StudentData>(
                  builder: (context, studendata, child) {
                    return FutureBuilder(
                      future: GetData.getdata(),
                      builder:
                          (context, AsyncSnapshot<List<List<Map>>> snapshot) {
                        if (snapshot.hasData) {
                          return getIt<StudentData>().GetStudentL2().length == 0
                              ? Center(
                                  child: Text("لاتوجد بيانات بعد!!"),
                                )
                              : ListView.builder(
                                  itemCount: getIt<StudentData>()
                                      .GetStudentL2()
                                      .length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                              "${getIt<StudentData>().studentsL2[index]['name']}"),
                                          subtitle: Text(
                                              "${getIt<StudentData>().studentsL2[index]['level']}"),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("متغيّب"),
                                              Consumer<AbsenceData>(
                                                builder:
                                                    (context, absence, child) {
                                                  return Checkbox(
                                                      activeColor: Colors.green,
                                                      value: checkIfFound(
                                                          absence.dataAbsenceL2,
                                                          getIt<StudentData>()
                                                                  .studentsL2[
                                                              index]['id']),
                                                      onChanged: (val) {
                                                        absence.SetAbsenceDataL2(
                                                            getIt<StudentData>()
                                                                    .studentsL2[
                                                                index]['id'],
                                                            val!);
                                                      });
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(thickness: 2)
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
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: 150,
                child: Consumer<AbsenceData>(
                  builder: (context, absence, child) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        absence.dataAbsenceL2.forEach((key, value) {
                          updateSharedPrefrences(value, key);
                          absence.SetAbsenceDataL2(key, false);
                        });

                        Navigator.of(context).pushNamed("absenceList");
                      },
                      child: Text("تأكيد العمليّة"),
                    );
                  },
                ),
              )
            ]),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(
                height: 400,
                child: Consumer<StudentData>(
                  builder: (context, studentdata, child) {
                    return FutureBuilder(
                      future: GetData.getdata(),
                      builder:
                          (context, AsyncSnapshot<List<List<Map>>> snapshot) {
                        if (snapshot.hasData) {
                          return getIt<StudentData>().GetStudentL3().length == 0
                              ? Center(
                                  child: Text("لاتوجد بيانات بعد!!"),
                                )
                              : ListView.builder(
                                  itemCount: getIt<StudentData>()
                                      .GetStudentL3()
                                      .length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                              "${getIt<StudentData>().studentsL3[index]['name']}"),
                                          subtitle: Text(
                                              "${getIt<StudentData>().studentsL3[index]['level']}"),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("متغيّب"),
                                              Consumer<AbsenceData>(
                                                builder:
                                                    (context, absence, child) {
                                                  return Checkbox(
                                                      activeColor: Colors.green,
                                                      value: checkIfFound(
                                                          absence.dataAbsenceL3,
                                                          getIt<StudentData>()
                                                                  .studentsL3[
                                                              index]['id']),
                                                      onChanged: (val) {
                                                        getIt<AbsenceData>()
                                                            .SetAbsenceDataL3(
                                                                getIt<StudentData>()
                                                                        .studentsL3[
                                                                    index]['id'],
                                                                val!);
                                                      });
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(thickness: 2)
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
                ),
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  width: 150,
                  child: Consumer<AbsenceData>(
                    builder: (context, absence, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          absence.dataAbsenceL3.forEach((key, value) {
                            updateSharedPrefrences(value, key);
                            absence.SetAbsenceDataL3(key, false);
                          });
                          Navigator.of(context).pushNamed("absenceList");
                        },
                        child: Text("تأكيد العمليّة"),
                      );
                    },
                  ))
            ]),
          ),
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 400,
                child: Consumer<StudentData>(
                  builder: (context, studentdata, child) {
                    return FutureBuilder(
                      future: GetData.getdata(),
                      builder:
                          (context, AsyncSnapshot<List<List<Map>>> snapshot) {
                        if (snapshot.hasData) {
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
                                          title: Text(
                                              "${getIt<StudentData>().studentsL4[index]['name']}"),
                                          subtitle: Text(
                                              "${getIt<StudentData>().studentsL4[index]['level']}"),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("متغيّب"),
                                              Consumer<AbsenceData>(
                                                builder:
                                                    (context, absence, child) {
                                                  return Checkbox(
                                                      activeColor: Colors.green,
                                                      value: checkIfFound(
                                                          absence.dataAbsenceL4,
                                                          getIt<StudentData>()
                                                                  .studentsL4[
                                                              index]['id']),
                                                      onChanged: (val) {
                                                        getIt<AbsenceData>()
                                                            .SetAbsenceDataL4(
                                                                getIt<StudentData>()
                                                                        .studentsL4[
                                                                    index]['id'],
                                                                val!);
                                                      });
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(thickness: 2)
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
                ),
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  width: 150,
                  child: Consumer<AbsenceData>(
                    builder: (context, absence, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          absence.dataAbsenceL4.forEach((key, value) {
                            updateSharedPrefrences(value, key);
                            absence.SetAbsenceDataL4(key, false);
                          });
                          Navigator.of(context).pushNamed("absenceList");
                        },
                        child: Text("تأكيد العمليّة"),
                      );
                    },
                  ))
            ]),
          ),
        ]));
  }
}
