import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:gamedonelist/app/home/add_game/add_game_page_content.dart';
import 'package:gamedonelist/app/home/game_list/game_list_page_content.dart';
import 'package:gamedonelist/app/home/my_account/my_account_page_content.dart';

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
      appBar: AppBar(
        title: const Text('Game Done List'),
      ),
      body: Builder(builder: (context) {
        if (currenttIndex == 0) {
          return const GameListPageContent();
        }
        if (currenttIndex == 1) {
          return const AddGamePageContent();
        }

        return MyAccountPageContent(email: widget.user.email);
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
