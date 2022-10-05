import 'package:flutter/material.dart';
import 'package:geocoding/Model/SectionData.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../GroupStatues.dart';
import '../studentsPage.dart';

class RegisterStudents extends StatefulWidget {
  const RegisterStudents({key});

  @override
  State<RegisterStudents> createState() => _RegisterStudentsState();
}

class _RegisterStudentsState extends State<RegisterStudents> {
  late String name, fathername, location, dateBirth, state, phone, mysection;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  save_in_DB() async {
    if (formstate.currentState!.validate()) {
      formstate.currentState!.save();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      //sharedPreferences.clear();
      int? index = sharedPreferences.getInt("Index");
      List<String> data = [
        name,
        fathername,
        location,
        dateBirth,
        phone,
        state,
        mysection,
        0.toString(),
        0.toString()
      ];
      if (index == null) {
        index = 0;
      }
      sharedPreferences.setStringList("Item$index", data);
      index++;
      sharedPreferences.setInt("Index", index);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Students(state: int.parse(mysection));
      }));
    } else {
      print("Not Valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ChangeNotifierProvider<SectionData>(
        create: (context) {
          return SectionData();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Form(
              key: formstate,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (newValue) {
                      name = newValue!;
                    },
                    validator: (value) {
                      if (value!.length > 20) {
                        return "الاسم قد تجاوز ال 20 حرفاً  ";
                      } else if (value.length < 3) {
                        return "الاسم يبدو قصيراً جدّاً";
                      } else if (value.isEmpty) {
                        return "يجب ملأ الحقل";
                      }
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        labelText: "الاسم الكامل",
                        labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
                        prefixIcon: Icon(Icons.note_rounded)),
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      fathername = newValue!;
                    },
                    validator: (value) {
                      if (value!.length > 20) {
                        return "الاسم قد تجاوز ال 20 حرفاً  ";
                      } else if (value.length < 3) {
                        return "الاسم يبدو قصيراً جدّاً";
                      } else if (value.isEmpty) {
                        return "يجب ملأ الحقل";
                      }
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        labelText: "اسم الوالد",
                        labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
                        prefixIcon: Icon(Icons.person_sharp)),
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      dateBirth = newValue!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "يجب ملأ الحقل";
                      }
                    },
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                      labelText: "تاريخ الميلاد",
                      labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
                      prefixIcon: Icon(Icons.date_range_outlined),
                    ),
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      phone = newValue!;
                    },
                    validator: (value) {
                      if (value!.length > 10) {
                        return "الرقم قد تجاوز ال 10 رقماً  ";
                      } else if (value.length < 3) {
                        return "الرقم يبدو قصيراً جدّاً";
                      } else if (value.isEmpty) {
                        return "يجب ملأ الحقل";
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                      labelText: "رقم الهاتف",
                      labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      location = newValue!;
                    },
                    validator: (value) {
                      if (value!.length > 40) {
                        return "الاسم قد تجاوز ال 20 حرفاً  ";
                      } else if (value.length < 5) {
                        return "الاسم يبدو قصيراً جدّاً";
                      } else if (value.isEmpty) {
                        return "يجب ملأ الحقل";
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                      labelText: "مكان السّكن",
                      labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
                      prefixIcon: Icon(Icons.location_on),
                    ),
                  ),
                  Consumer<SectionData>(
                    builder: (context, section, child) {
                      mysection = section.Item;
                      return DropdownButton(
                        items: section.sections.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text("المستوى : $items"),
                          );
                        }).toList(),
                        value: section.Item,
                        onChanged: (String? value) {
                          mysection = value!;
                          section.SetItem(value);
                        },
                      );
                    },
                  ),
                  Container(
                      child: Row(
                    children: [
                      Text("يدرس",
                          style: TextStyle(color: Colors.blue, fontSize: 20)),
                      Consumer<GroupStatues>(
                        builder: (context, group, child) {
                          return Radio(
                              value: "study",
                              groupValue: group.groupStatues,
                              onChanged: (dynamic val) {
                                state = val;
                                group.SetGroupStatues(val);
                              });
                        },
                      ),
                      Spacer(),
                      Text("يعمل",
                          style: TextStyle(color: Colors.blue, fontSize: 20)),
                      Consumer<GroupStatues>(
                        builder: (context, group, child) {
                          return Radio(
                              value: "work",
                              groupValue: group.groupStatues,
                              onChanged: (dynamic val) {
                                state = val;
                                group.SetGroupStatues(val);
                              });
                        },
                      ),
                    ],
                  )),
                  Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        save_in_DB();
                      },
                      child: Text("تأكيد المعلومات",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
