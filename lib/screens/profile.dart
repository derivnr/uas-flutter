import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage("assets/tick.png"),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Deri Ramdani",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "NIM. 22552012042",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Ini adalah aplikasi kemahasiswaan yang dibuat oleh Deri Ramdani, dengan tujuan untuk memenuhi tugas UTS dari mata kuliah Pemrograman Mobile.",
        ),
        Text(
          "Copyright by Deri Ramdani",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    )));
  }
}
