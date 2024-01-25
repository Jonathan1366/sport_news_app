import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
// import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sport_news_app/newdetail.dart';
import 'package:timeago/timeago.dart' as timeago;

// import 'package:intl/intl.dart';
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool iscChipSelected = false;
  String selectedpoint = 'all';

  // int _selectedCategoryIndex = 0;

  Future<List> readJson() async {
    // final String response = await rootBundle.loadString('assets/api.json');
    final http.Response response = await http.get(
      Uri.parse(
          // 192.168.56.1
          'http://192.168.20.205/uaswebmob/api.php?action=getAllPosts&trim=250'),
    );
    final data = await jsonDecode(response.body) as dynamic;
    return data["data"];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 79, 119, 252),
          shadowColor: Colors.grey,
          toolbarHeight: 70,
          title: const Text(
            'Sport News',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 25, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 75,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.fast),
                    addAutomaticKeepAlives: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        // SELECTOR CATEGORY NEWS
                        child: ActionChip(
                          shape: const StadiumBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 0, 47, 255))),
                          label: const Text('all'),
                          backgroundColor: selectedpoint == 'all'
                              ? const Color.fromARGB(255, 176, 187, 255)
                              : Colors.grey[200],
                          onPressed: () {
                            setState(() {
                              selectedpoint = 'all';
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ActionChip(
                          shape: const StadiumBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 0, 47, 255))),
                          backgroundColor: selectedpoint == 'motogp'
                              ? const Color.fromARGB(255, 176, 187, 255)
                              : Colors.grey[200],
                          label: const Text('motogp'),
                          onPressed: () {
                            setState(() {
                              selectedpoint = 'motogp';
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ActionChip(
                          shape: const StadiumBorder(
                            side: BorderSide(
                              color: Color.fromARGB(255, 0, 47, 255),
                            ),
                          ),
                          backgroundColor: selectedpoint == 'bulutangkis'
                              ? const Color.fromARGB(255, 176, 187, 255)
                              : Colors.grey[200],
                          label: const Text('bulutangkis'),
                          onPressed: () {
                            setState(() {
                              selectedpoint = 'bulutangkis';
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ActionChip(
                          shape: const StadiumBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 0, 47, 255))),
                          backgroundColor: selectedpoint == 'sepakbola'
                              ? const Color.fromARGB(255, 176, 187, 255)
                              : Colors.grey[200],
                          label: const Text('sepakbola'),
                          onPressed: () {
                            setState(
                              () {
                                selectedpoint = 'sepakbola';
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ActionChip(
                          shape: const StadiumBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 0, 47, 255))),
                          backgroundColor: selectedpoint == 'soccer'
                              ? const Color.fromARGB(255, 176, 187, 255)
                              : Colors.grey[200],
                          label: const Text('soccer'),
                          onPressed: () {
                            setState(() {
                              selectedpoint = 'soccer';
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ActionChip(
                          shape: const StadiumBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 0, 47, 255))),
                          backgroundColor: selectedpoint == 'basket'
                              ? const Color.fromARGB(255, 176, 187, 255)
                              : Colors.grey[200],
                          label: const Text('basket'),
                          onPressed: () {
                            setState(
                              () {
                                selectedpoint = 'basket';
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [],
                ),
                FutureBuilder<List>(
                  future: readJson(),
                  builder: (context, snapshot) {
                    // jika Future sedang menunggu atau tidak memiliki data, tampilkan circular progress indicator
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        !snapshot.hasData) {
                      const SizedBox(
                        height: 100,
                      );
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 5),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: CupertinoAlertDialog(
                          title: const Text('Failed'),
                          content: const Text('Something went wrong'),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text('Ok'),
                              onPressed: () => Navigator.of(context).pop(),
                            )
                          ],
                        ),
                      );
                    } else {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NewsDetail(data: snapshot.data![index]),
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 4,
                                shadowColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                // shadowColor: Colors.grey,
                                key: ValueKey(snapshot.data![index]["id"]),
                                margin: const EdgeInsets.only(
                                  // right: 5,
                                  // left: 5,
                                  top: 5,
                                ),
                                // container berita,
                                color: const Color.fromARGB(255, 238, 238, 238),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Text(
                                                snapshot.data![index]['author'],
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Text(
                                                timeago.format(
                                                  DateTime.parse(
                                                    snapshot.data![index]
                                                        ['created_at'],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]
                                          // subtitle: Text(snapshot.data![index]["categories"] +
                                          //     " " +
                                          //     snapshot.data![index]["content"]),
                                          ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Center(
                                            child: ClipRect(
                                              child: snapshot.data![index]
                                                          ['image'] !=
                                                      null  
                                                  ? Image.network(snapshot
                                                      .data![index]["image"])
                                                  : Image.asset(
                                                      'assets/no-picture.png'),
                                            ),
                                          )),
                                      // JUDUL
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          snapshot.data![index]['title'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data![index]['content'],
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //     items: [const BottomNavigationBarItem(icon: Icon(Icons.home))]),
      ),
    );
  }
}
