import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GameListPageContent extends StatelessWidget {
  const GameListPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('games').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Coś poszło nie tak'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text('Ładowanie'),
            );
          }

          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text('Game Name'),
                          const SizedBox(height: 25),
                          Text(document['gameName']),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('System'),
                          const SizedBox(height: 25),
                          Text(document['system']),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Play Time'),
                          const SizedBox(height: 25),
                          Text(document['time'].toString()),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Rating'),
                          const SizedBox(height: 25),
                          Text(document['rating'].toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ],
          );
        });
  }
}
