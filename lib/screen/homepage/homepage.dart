import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_realtime_test/services/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  final Stream<QuerySnapshot> massagesStream =
      CustomDatabase.streamData(CustomDatabase.messages);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: massagesStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            return Expanded(
              child: ListView(
                children: snapshot.data!.docs
                    .map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return Text(data['text']);
                    })
                    .toList()
                    .cast(),
              ),
            );
          },
        ),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'New message',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            sendMessage(controller.text);
            controller.clear();
          },
          child: const Text('Send'),
        ),
      ],
    ));
  }

  void sendMessage(String text) {
    Map<String, dynamic> data = {
      'sender': FirebaseAuth.instance.currentUser!.uid,
      'text': text,
      'time': DateTime.now().toIso8601String(),
    };
    CustomDatabase.addData(CustomDatabase.messages, data);
  }
}
