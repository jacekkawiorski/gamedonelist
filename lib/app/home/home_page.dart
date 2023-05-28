import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

var currenttIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (currenttIndex == 0) {
          return const Center(
            child: Text('Jeden'),
          );
        }
        if (currenttIndex == 1) {
          return const Center(
            child: Text('Dwa'),
          );
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('jestes zalogowany jako ${widget.user.email}'),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text('Wyloguj'),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currenttIndex,
        onTap: (newIndex) {
          setState(() {
            currenttIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            label: 'Skończone Gry',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add),
            label: 'Dodaj grę',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: 'Moje konto',
          ),
        ],
      ),
    );
  }
}
