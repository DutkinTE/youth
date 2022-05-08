import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        color: Colors.white,
        child: Container(
            margin: const EdgeInsetsDirectional.fromSTEB(15, 15, 0, 15),
            height: 160.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: '',
                        transitionDuration: Duration(milliseconds: 200),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return Center(
                              child: Container(
                            height: 750,
                            width: 350,
                            color: Colors.white,
                            child: ListView(children: [
                              Image.asset(
                                  'assets/Снимок экрана 2022-05-07 в 07.38.11.png'),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 5, 5),
                                child: Text(
                                  '8 мая',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      inherit: false),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 5),
                                child: Text('воскресенье',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 5),
                                child: Text('12:00',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 20),
                                child: Text(
                                    'Государственный академический театр им. А.С.Пушкина',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                            ]),
                          ));
                        });
                  },
                  child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                          'assets/Снимок экрана 2022-05-07 в 07.38.11.png'),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 100.0,
                  ),
                ),
                Container(
                  width: 15.0,
                  color: Colors.white,
                ),
                GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: '',
                        transitionDuration: Duration(milliseconds: 200),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return Center(
                              child: Container(
                            height: 750,
                            width: 350,
                            color: Colors.white,
                            child: ListView(children: [
                              Image.asset(
                                  'assets/Снимок экрана 2022-05-07 в 07.46.32.png'),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 5, 5),
                                child: Text(
                                  '7 мая',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      inherit: false),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 5),
                                child: Text('суббота',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 5),
                                child: Text('09:00',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 5),
                                child: Text(
                                    'Якутский государственный объединенный музей истории и культуры народов Севера им. Ем. Ярославского',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                            ]),
                          ));
                        });
                  },
                  child: Container(
                    child: Image.asset(
                        'assets/Снимок экрана 2022-05-07 в 07.46.32.png'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 100.0,
                  ),
                ),
                Container(
                  width: 15.0,
                  color: Colors.white,
                ),
                GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: '',
                        transitionDuration: Duration(milliseconds: 200),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return Center(
                              child: Container(
                            height: 750,
                            width: 350,
                            color: Colors.white,
                            child: ListView(children: [
                              Image.asset(
                                  'assets/Снимок экрана 2022-05-07 в 07.49.44.png'),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 5, 5),
                                child: Text(
                                  '7 мая',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      inherit: false),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 5),
                                child: Text('суббота',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 5),
                                child: Text('09:00',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 5),
                                child: Text(
                                    'Государственный театр эстрады Республики Саха (Якутия)',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                            ]),
                          ));
                        });
                  },
                  child: Container(
                    child: Image.asset(
                        'assets/Снимок экрана 2022-05-07 в 07.49.44.png'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 100.0,
                  ),
                ),
                Container(
                  width: 15.0,
                  color: Colors.white,
                ),
                GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: '',
                        transitionDuration: Duration(milliseconds: 200),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return Center(
                              child: Container(
                            height: 750,
                            width: 350,
                            color: Colors.white,
                            child: ListView(children: [
                              Image.asset(
                                  'assets/Снимок экрана 2022-05-07 в 07.50.15.png'),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 5, 5),
                                child: Text(
                                  '6 мая - 13 мая',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      inherit: false),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 5),
                                child: Text('',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 5),
                                child: Text(
                                    'Понедельник 10:00 - 17:00\nВторник 10:00 - 17:00\nСреда 10:00 - 17:00\nЧетверг 10:00 - 17:00\nПятница 10:00 - 17:00',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 5),
                                child: Text('',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                            ]),
                          ));
                        });
                  },
                  child: Container(
                    child: Image.asset(
                        'assets/Снимок экрана 2022-05-07 в 07.50.15.png'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 100.0,
                  ),
                ),
                Container(
                  width: 15.0,
                  color: Colors.white,
                ),
                GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: '',
                        transitionDuration: Duration(milliseconds: 200),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return Center(
                              child: Container(
                            height: 750,
                            width: 350,
                            color: Colors.white,
                            child: ListView(children: [
                              Image.asset(
                                  'assets/Снимок экрана 2022-05-07 в 07.50.32.png'),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 5, 5),
                                child: Text(
                                  '13 мая',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      inherit: false),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 5),
                                child: Text('пятница',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 5),
                                child: Text('12:00',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 5, 5),
                                child: Text(
                                    'Государственный академический русский драматический театр им. А.С.Пушкина',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        inherit: false)),
                              ),
                            ]),
                          ));
                        });
                  },
                  child: Container(
                    child: Image.asset(
                        'assets/Снимок экрана 2022-05-07 в 07.50.32.png'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 100.0,
                  ),
                ),
              ],
            )),
      ),
      StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            Icon _buttonIcon = Icon(Icons.favorite_outline, color: Colors.red);

            return Container(
                color: Colors.white,
                child: Column(children: [
                  Container(
                    height: 2,
                    color: Color.fromRGBO(229, 229, 229, 1),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/Rectangle 31.png'),
                          radius: 25,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 0, 0),
                              child: Text(
                                  snapshot.data!.docs[0].get('last_name') +
                                      ' ' +
                                      snapshot.data!.docs[0].get('name'))),
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 35, 0),
                              child: Text(snapshot.data!.docs[0].get('date')))
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(130, 0, 0, 0),
                        child: Icon(
                          Icons.bookmark_outline_outlined,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Text(
                        snapshot.data!.docs[0].get('text'),
                      )),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 30,
                        width: 70,
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            children: [
                              _buttonIcon,
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5, 0, 0, 0),
                                child: Text(snapshot.data!.docs[0]
                                    .get('likes')
                                    .toString()),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 30,
                      width: 70,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.comment_outlined,
                              color: Colors.red,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5, 0, 0, 0),
                              child: Text(snapshot.data!.docs[0]
                                  .get('comment')
                                  .toString()),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                ]));
          }),
      StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('image_posts').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return Container(
                color: Colors.white,
                child: Column(children: [
                  Container(
                    height: 2,
                    color: Color.fromRGBO(229, 229, 229, 1),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/Rectangle 31.png'),
                          radius: 25,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 0, 0),
                              child: Text(
                                  snapshot.data!.docs[0].get('last_name') +
                                      ' ' +
                                      snapshot.data!.docs[0].get('name'))),
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 35, 0),
                              child: Text(snapshot.data!.docs[0].get('date')))
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(130, 0, 0, 0),
                        child: Icon(
                          Icons.bookmark_outline_outlined,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child:
                          Image.network(snapshot.data!.docs[0].get('image'))),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 30,
                        width: 70,
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            children: [
                              Icon(Icons.favorite_outline, color: Colors.red),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5, 0, 0, 0),
                                child: Text(snapshot.data!.docs[0]
                                    .get('likes')
                                    .toString()),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 30,
                      width: 70,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.comment_outlined,
                              color: Colors.red,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5, 0, 0, 0),
                              child: Text(snapshot.data!.docs[0]
                                  .get('comment')
                                  .toString()),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                ]));
          }),
      StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('video_posts').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return Container(
                color: Colors.white,
                child: Column(children: [
                  Container(
                    height: 2,
                    color: Color.fromRGBO(229, 229, 229, 1),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/Rectangle 31.png'),
                          radius: 25,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 0, 0),
                              child: Text(
                                  snapshot.data!.docs[0].get('last_name') +
                                      ' ' +
                                      snapshot.data!.docs[0].get('name'))),
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 35, 0),
                              child: Text(snapshot.data!.docs[0].get('date')))
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(130, 0, 0, 0),
                        child: Icon(
                          Icons.bookmark_outline_outlined,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Stack(children: [
                        FutureBuilder(
                          future: _initializeVideoPlayerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              // If the VideoPlayerController has finished initialization, use
                              // the data it provides to limit the aspect ratio of the video.
                              return AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                // Use the VideoPlayer widget to display the video.
                                child: VideoPlayer(_controller),
                              );
                            } else {
                              // If the VideoPlayerController is still initializing, show a
                              // loading spinner.
                              return const Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    100, 70, 0, 0),
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              150, 80, 0, 0),
                          child: FloatingActionButton(
                            backgroundColor: Color.fromRGBO(255, 0, 0, 0.0),
                            onPressed: () {
                              // Wrap the play or pause in a call to `setState`. This ensures the
                              // correct icon is shown.
                              setState(() {
                                // If the video is playing, pause it.
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  // If the video is paused, play it.
                                  _controller.play();
                                }
                              });
                            },
                            // Display the correct icon depending on the state of the player.
                            child: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Color.fromRGBO(255, 0, 0, 0.0),
                            ),
                          ),
                        ),
                      ])),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 30,
                        width: 70,
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            children: [
                              Icon(Icons.favorite_outline, color: Colors.red),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5, 0, 0, 0),
                                child: Text(snapshot.data!.docs[0]
                                    .get('likes')
                                    .toString()),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 30,
                      width: 70,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.comment_outlined,
                              color: Colors.red,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5, 0, 0, 0),
                              child: Text(snapshot.data!.docs[0]
                                  .get('comment')
                                  .toString()),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                ]));
          })
    ]);
  }
}
