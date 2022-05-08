import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hackathon/pages/HomePage.dart';
import 'package:hackathon/pages/SearchPage.dart';

class notifcationWidget extends StatefulWidget {
  const notifcationWidget({Key? key}) : super(key: key);

  @override
  State<notifcationWidget> createState() => _notifcationWidgetState();
}

class _notifcationWidgetState extends State<notifcationWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
        child: Image.asset(
          'assets/Снимок экрана 2022-05-07 в 07.09.27.png',
          height: 700,
        ),
      ),
      StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('notifications').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    height: 5,
                    color: Color.fromRGBO(229, 229, 229, 1),
                    width: 400,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    width: 400,
                    color: Colors.white,
                    child: Text(
                      snapshot.data!.docs[index].get('text'),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    ]);
  }
}
