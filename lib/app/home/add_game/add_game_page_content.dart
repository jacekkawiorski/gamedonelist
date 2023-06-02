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
  var rating = 3.0;

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
          Text('Ocena '),
          Slider(
            onChanged: (newValue) {
              setState(() {
                rating = newValue;
              });
            },
            value: rating,
            min: 1.0,
            max: 6.0,
            divisions: 10,
            label: rating.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('games').add({
                'gameName': gameName,
                'system': system,
                'time': playTime,
                'rating': rating,
              });
            },
            child: const Text('Dodaj do listy'),
          )
        ],
      ),
    );
  }
}
