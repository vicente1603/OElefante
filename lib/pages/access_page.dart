import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:o_elefante/pages/home_page.dart';
import 'package:o_elefante/pages/profile_page.dart';
import 'package:o_elefante/pages/services_page.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({Key? key}) : super(key: key);

  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
  int _indiceAtual = 1; // Variável para controlar o índice das telas

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _telas = [
      ProfilePage(user: user),
      HomePage(),
      ServicesPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("O Elefante"),
      ),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _indiceAtual,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Minha conta"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Serviços"),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
