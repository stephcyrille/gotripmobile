import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.09),
                  child: Image.asset("assets/home_pic.png"),
                ),
              ],
            ),
            const SizedBox(height: 120.0),
            OutlinedButton(child: const Text('Se connecter'), onPressed: () {}),
            const SizedBox(height: 12.0),
            // Password Field
            OutlinedButton(
                child: const Text('Créer un compte'), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
