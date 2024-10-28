import 'package:flutter/material.dart';
import 'package:pruebaproject/Clases/contactdata.dart';
import 'package:pruebaproject/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(primary: Colors.white),
        useMaterial3: true,
      ),
      home: ContactDetailsPage(ContactData(
          id: 1,
          name: "Pablo Mota",
          email: "pablomotaa2005@gmail.com",
          phone: "71231232",
          birthdate: DateTime.parse("2005-02-23"),
          creation: DateTime.now(),
          modification: DateTime.now())),
    );
  }
}
