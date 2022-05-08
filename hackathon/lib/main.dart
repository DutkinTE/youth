import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hackathon/pages/HomePage.dart';
import 'package:hackathon/pages/SearchPage.dart';
import 'package:hackathon/pages/Notification.dart';

String _text = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomePageWidget(),
    SearchPageWidget(),
    AddWidget(),
    notifcationWidget(),
    UserPageWidget()
  ];
  static final List _widgetAppBar = [
    Image.asset(
      'assets/Снимок экрана 2022-05-06 в 11.20.00.png',
      height: 50,
    ),
    TextField(
        decoration: InputDecoration(
      icon: Icon(
        Icons.search,
        color: Colors.black,
      ),
      filled: true,
      fillColor: Colors.white,
      labelText: 'Поиск',
      hintText: 'Введите имя пользователя',
    )),
    Row(children: [
      Text('Новая запись', style: TextStyle(color: Colors.black)),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(174, 0, 0, 0),
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            FirebaseFirestore.instance.collection('my_posts').add({
              'date': '7 мая в 10:25',
              'text': _text,
              'comments': 0,
              'likes': 0
            });
          },
          color: Colors.red,
        ),
      ),
    ]),
    Image.asset(
      'assets/Снимок экрана 2022-05-06 в 11.20.00.png',
      height: 50,
    ),
    Image.asset(
      'assets/Снимок экрана 2022-05-06 в 11.20.00.png',
      height: 50,
    ),
  ];
  static List _widgetColor = [
    Color.fromRGBO(229, 229, 229, 1),
    Color.fromRGBO(229, 229, 229, 1),
    Colors.white,
    Color.fromRGBO(229, 229, 229, 1),
    Colors.white
  ];
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
      print(flutterErrorDetails.toString());
      return Center(child: CircularProgressIndicator());
    };
    return MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: _widgetColor.elementAt(_selectedIndex),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: _widgetAppBar.elementAt(_selectedIndex),
            centerTitle: true,
            elevation: 0,
          ),
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 30,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.red,
                ),
                label: 'Главная',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.red),
                label: 'Поиск',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add, color: Colors.red),
                label: 'Добавить',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined, color: Colors.red),
                label: 'Уведомления',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, color: Colors.red),
                label: 'Пользователь',
                backgroundColor: Colors.white,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
        ));
  }
}

class UserPageWidget extends StatefulWidget {
  const UserPageWidget({Key? key}) : super(key: key);

  @override
  State<UserPageWidget> createState() => _UserPageWidgetState();
}

class _UserPageWidgetState extends State<UserPageWidget> {
  String last_name = '';
  String name = '';
  String description = '';
  String name_1 = '';
  String last_name_1 = '';

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 30, 0),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            'assets/SAVE_20220428_160958.jpg',
                          ),
                        );
                      }),
                ),
                Column(
                  children: [
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 25, 30, 0),
                            child: Text(
                              snapshot.data!.docs[0].get('posts').toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 30, 0),
                      child: Text(
                        'Посты',
                        style: TextStyle(fontSize: 11),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 25, 30, 0),
                            child: Text(
                              snapshot.data!.docs[0].get('followers'),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 30, 0),
                      child: Text(
                        'Подписчики',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                            child: Text(
                              snapshot.data!.docs[0].get('following'),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(
                        'Подписки',
                        style: TextStyle(fontSize: 11),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                name_1 = snapshot.data!.docs[0].get('name');
                last_name_1 = snapshot.data!.docs[0].get('last_name');
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 230, 0),
                  child: Text(
                    snapshot.data!.docs[0].get('last_name') +
                        ' ' +
                        snapshot.data!.docs[0].get('name'),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                );
              }),
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 130, 10),
                  child: Container(
                    width: 200,
                    child: Text(
                      snapshot.data!.docs[0].get('description'),
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                );
              }),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[200],
                elevation: 0,
              ),
              onPressed: () {
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
                          child: Column(
                            children: [
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Text('Изменение профиля',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20,
                                        inherit: false)),
                              ),
                              Container(
                                color: Colors.white,
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                height: 600,
                                width: 250,
                                child: Scaffold(
                                  backgroundColor: Colors.white,
                                  body: Column(children: [
                                    TextField(
                                      decoration: InputDecoration(
                                          labelText: 'Фамилия',
                                          hintText: 'Введите фамилию'),
                                      onChanged: (text) {
                                        setState(() {
                                          last_name = text;
                                        });
                                      },
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          labelText: 'Имя',
                                          hintText: 'Введите имя'),
                                      onChanged: (text) {
                                        setState(() {
                                          name = text;
                                        });
                                      },
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          labelText: 'Описание',
                                          hintText: 'Введите Описание'),
                                      onChanged: (text) {
                                        setState(() {
                                          description = text;
                                        });
                                      },
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 20, 0, 0),
                                      child: StreamBuilder(
                                          stream: FirebaseFirestore.instance
                                              .collection('users')
                                              .snapshots(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<QuerySnapshot>
                                                  snapshot) {
                                            return ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.red,
                                                ),
                                                onPressed: () {
                                                  FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(
                                                          'bdiijBribzaCXTlE2h9K')
                                                      .update({
                                                    'name': name,
                                                    'last_name': last_name,
                                                    'description': description
                                                  });
                                                },
                                                child: Container(
                                                    width: 300,
                                                    child: Center(
                                                        child: Text(
                                                            'Сохранить'))));
                                          }),
                                    ),
                                  ]),
                                ),
                              )
                            ],
                          ),
                          height: 650,
                          width: 300,
                          color: Colors.white,
                        ),
                      );
                    });
              },
              child: Container(
                width: 300,
                child: Center(
                  child: Text(
                    'Редактировать профиль',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        ],
      ),
      StreamBuilder(
          stream: FirebaseFirestore.instance.collection('my_posts').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            FirebaseFirestore.instance
                .collection('users')
                .doc('bdiijBribzaCXTlE2h9K')
                .update({'posts': snapshot.data!.docs.length});
            return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 230, 0, 0),
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    String id = snapshot.data!.docs[index].id;
                    return Stack(children: [
                      Container(
                          color: Colors.white,
                          child: Column(children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 0, 0),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/SAVE_20220428_160958.jpg'),
                                    radius: 25,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10, 10, 0, 0),
                                        child:
                                            Text(last_name_1 + ' ' + name_1)),
                                    Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 0),
                                        child: Text(snapshot.data!.docs[index]
                                            .get('date')))
                                  ],
                                )
                              ],
                            ),
                            Container(
                                width: 370,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Text(
                                  snapshot.data!.docs[index].get('text'),
                                  textAlign: TextAlign.left,
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
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.favorite_outline,
                                            color: Colors.red),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(5, 0, 0, 0),
                                          child: Text(snapshot.data!.docs[index]
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.comment_outlined,
                                        color: Colors.red,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(5, 0, 0, 0),
                                        child: Text(snapshot.data!.docs[0]
                                            .get('comments')
                                            .toString()),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                          ])),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(320, 20, 0, 0),
                        child: IconButton(
                          iconSize: 25,
                          color: Colors.red,
                          icon: Icon(Icons.delete_outline),
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('my_posts')
                                .doc(id)
                                .delete();
                          },
                        ),
                      )
                    ]);
                  }),
            );
          })
    ]);
  }
}

class AddWidget extends StatefulWidget {
  const AddWidget({Key? key}) : super(key: key);

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: TextField(
              maxLines: 31,
              decoration: InputDecoration(
                  hintText: 'Напишите здесь текст', border: InputBorder.none),
              onChanged: (text) {
                setState(() {
                  _text = text;
                });
              },
            ))
      ],
    );
  }
}
