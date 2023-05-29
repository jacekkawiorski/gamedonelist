import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddGamePageContent extends StatefulWidget {
  const AddGamePageContent({
    super.key,
  });

  @override
  State<AddGamePageContent> createState() => _AddGamePageContentState();
}

class _AddGamePageContentState extends State<AddGamePageContent> {
  var gameName = '';
  var system = '';
  var playTime = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Podaj nazwę gry'),
            onChanged: (newValue) {
              setState(() {
                gameName = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Podaj nazwe systemu'),
            onChanged: (newValue) {
              setState(() {
                system = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Podaj czas przejscia'),
            keyboardType: TextInputType.number,
            onChanged: (newValue) {
              setState(() {
                playTime = newValue;
              });
            },
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('games').add({
                'gameName': gameName,
                'system': system,
                'time': playTime,
                'rating': 4.5,
              });
            },
            child: const Text('Dodaj do listy'),
          )
        ],
      ),
    );
  }
}
