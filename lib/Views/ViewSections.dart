import 'package:flutter/material.dart';

import '../studentsPage.dart';

class ViewSections extends StatelessWidget {
  const ViewSections({key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: Colors.green[300],
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.blue[100],
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Students(state: 1);
                      }));
                    },
                    child: Text(
                      "المستوى الأول",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.blue[200],
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Students(state: 2);
                      }));
                    },
                    child: Text(
                      "المستوى الثّاني",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Students(state: 3);
                      }));
                    },
                    minWidth: double.infinity,
                    color: Colors.blue[300],
                    child: Text(
                      "المستوى الثّالث",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Students(state: 4);
                      }));
                    },
                    minWidth: double.infinity,
                    color: Colors.blue[400],
                    child: Text(
                      "المستوى الرّابع",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
