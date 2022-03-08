import 'package:flutter/material.dart';
import 'package:github_info/ui/results_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            // height: 300,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(80),
              child: Image.asset(
                'assets/images/github.png',
                height: 150,
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(120),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: <Widget>[
              Container(height: 80),
              TextField(
                controller: _username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  hintText: 'username',
                  labelText: 'username',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              Container(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                  fixedSize: const Size(double.maxFinite, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (_username.value.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResultsScreen(username: _username.value.text),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Insira algum username"),
                    ));
                  }
                },
                child: const Text('Buscar'),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
