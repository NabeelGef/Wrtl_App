import 'package:flutter/material.dart';
import 'package:geocoding/Model/AbsenceData.dart';
import 'package:geocoding/AbsencesList.dart';
import 'package:geocoding/GroupStatues.dart';
import 'package:geocoding/SelectedIndex.dart';
import 'package:geocoding/Model/StudentData.dart';
import 'package:geocoding/Views/AbsenceStudents.dart';
import 'package:geocoding/Views/ViewRegister.dart';
import 'package:geocoding/Views/ViewSections.dart';
import 'package:geocoding/studentsPage.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

GetIt getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<StudentData>(StudentData(), signalsReady: true);
  runApp(
    MaterialApp(
      routes: {"absenceList": (context) => AbsenceList()},
      theme: ThemeData(primaryColor: Colors.green),
      title: 'ورتّل',
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        builder: (context, child) {
          return HomePage();
        },
        providers: [
          ChangeNotifierProvider<SelectedIndex>(create: (context) {
            return SelectedIndex();
          }),
          ChangeNotifierProvider<GroupStatues>(create: (context) {
            return GroupStatues();
          }),
          ChangeNotifierProvider<StudentData>(
            create: (context) {
              return StudentData();
            },
          ),
          ChangeNotifierProvider<AbsenceData>(
            create: (context) {
              return AbsenceData();
            },
          ),
        ],
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  HomePage({key});

  @override
  Widget build(BuildContext context) {
    List<Widget> MyItems = [
      ViewSections(),
      RegisterStudents(),
      AbsenceStudents()
    ];
    List<Widget?> floating = [
      null,
      null,
      FloatingActionButton(
          backgroundColor: Colors.grey,
          child: IconButton(
              splashColor: Colors.blue,
              icon: Icon(Icons.notes),
              onPressed: () {
                Navigator.of(context).pushNamed("absenceList");
              }),
          onPressed: () {})
    ];
    List<Widget?> bottoms = [
      null,
      null,
      TabBar(tabs: [
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
    ];
    return DefaultTabController(
      length: 4,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Consumer<SelectedIndex>(
          builder: (context, selected, child) {
            return Scaffold(
                floatingActionButton:
                    floating.elementAt(selected.Getselectedindex()),
                appBar: AppBar(
                  bottom: bottoms.elementAt(selected.Getselectedindex())
                      as PreferredSizeWidget?,
                  title: Row(
                    children: [
                      Text("ورتّل القرآن ترتيلاً"),
                      Spacer(),
                      Image(
                        image: AssetImage('images/wrtl.png'),
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                    currentIndex: selected.selected_index,
                    onTap: (i) {
                      selected.Setselectedindex(i);
                    },
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          label: "قائمة الطّلاب", icon: Icon(Icons.menu)),
                      BottomNavigationBarItem(
                          label: "التسجيل", icon: Icon(Icons.app_registration)),
                      BottomNavigationBarItem(
                          label: "التّفقّد", icon: Icon(Icons.edit))
                    ]),
                body: MyItems.elementAt(selected.Getselectedindex()));
          },
        ),
      ),
    );
  }
}
