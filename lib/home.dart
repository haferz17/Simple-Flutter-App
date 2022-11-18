import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:badges/badges.dart';
import 'package:test_flutter/components/bottomnav.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final data = ['1', '2', '3', '4', '5', '6', '7'];
  List photos = [];
  var isLoading = true;
  int index = 0;

  Future<void> _fetchData() async {
    const API_URL = 'https://jsonplaceholder.typicode.com/photos';

    final response = await http.get(Uri.parse(API_URL));
    final data = json.decode(response.body);
    setState(() {
      isLoading = false;
      photos = data;
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Fetch data successful")));
  }

  void initState() {
    super.initState();
    _fetchData();
  }

  void onClickTab(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: const Drawer(
          child: Text('a'),
        ),
        appBar: buildAppBar(),
        body: RefreshIndicator(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 120,
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 5),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 85,
                        height: 85,
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.redAccent, width: 3),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuFXYHiQRuUmFTXcV8jr0Dhe0ldjj0rHR7Jw&usqp=CAU',
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                isLoading
                    ? const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: CircularProgressIndicator(color: Colors.red),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(children: [
                              Row(children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.redAccent, width: 3),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuFXYHiQRuUmFTXcV8jr0Dhe0ldjj0rHR7Jw&usqp=CAU',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 13),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Ryan Fuad',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            ),
                                            style: TextButton.styleFrom(
                                              minimumSize: Size.zero,
                                              padding: const EdgeInsets.only(
                                                  top: 2.0, bottom: 6.0),
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                          ),
                                          const Text('Jakarta, Indonesia',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15))
                                        ]),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(SimpleLineIcons.options),
                                  ),
                                ),
                              ]),
                              Container(
                                // width: 200,
                                // height: 200,
                                margin: const EdgeInsets.only(bottom: 7),
                                child: ClipRRect(
                                    child: Image.network(photos[index]['url']),
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              Row(children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Icon(
                                        FontAwesome.heart,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                            right: 5,
                                          ),
                                          child: Text(
                                            '180k',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Icon(
                                        MaterialCommunityIcons
                                            .comment_processing,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                            right: 5,
                                          ),
                                          child: Text(
                                            '22k',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Icon(
                                        FontAwesome.send,
                                        color: Colors.black,
                                        size: 25,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            '9k',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ])
                            ]),
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          );
                        },
                      ),
              ],
            ),
          ),
          onRefresh: () {
            return Future.delayed(
              const Duration(seconds: 1),
              () {
                setState(() {
                  isLoading = true;
                });
                _fetchData();
              },
            );
          },
        ),
        bottomNavigationBar: const BottomNav());
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text('Home'),
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(MaterialCommunityIcons.menu, size: 28),
          color: Colors.black,
          padding: const EdgeInsets.only(left: 30),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Entypo.camera, size: 28),
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
          child: IconButton(
            onPressed: () {},
            icon: Badge(
              badgeContent:
                  const Text('1', style: TextStyle(color: Colors.white)),
              child: const Icon(Ionicons.ios_mail, size: 28),
            ),
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
