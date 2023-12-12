import 'package:cs3541_final_project/amazon/views/compare_book.dart';
import 'package:flutter/material.dart';
import 'amazon/views/VideoPlayer.dart';
import 'amazon/views/amazon_component.dart';
import '../amazon/presenter/amazon_presenter.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.withOpacity(.5),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0))
            ),
            child: Text('Amazon Search', style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) {
                  return AmazonSearchScreen();
                },
              ));
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.withOpacity(.5),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0))
            ),
            child: Text('YouTube'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) {
                  return YouTubeScreen();
                },
              ));
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.withOpacity(.5),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0))
            ),
            child: Text('Amazon Book List', style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) {
                  return AmazonBookListScreen();
                },
              ));
            },
          ),
          ElevatedButton(

            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.withOpacity(.5),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0))
            ),
            child: Text('Compare Book ', style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) {
                  return CompareBook();
                },
              ));
            },
          ),
        ],
      ),
    );
    //);
  }
}




class AmazonBookListScreen extends StatefulWidget {
  @override _AmazonBookListScreen createState() => _AmazonBookListScreen();
}

class _AmazonBookListScreen extends State<AmazonBookListScreen> {
  @override
  Widget build(BuildContext context) {
    return  AmazonBookListPage(
      AmazonBookListPresenter(), title: 'Amazon Book List', key: Key("BOOK LIST"),);
  }
}




class AmazonSearchScreen extends StatefulWidget {
  @override _AmazonSearchScreen createState() => _AmazonSearchScreen();
}

class _AmazonSearchScreen extends State<AmazonSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return new AmazonSearchPage(
      new AmazonSearchPresenter(), title: 'Amazon Search', key: Key("SEARCH"),);
  }
}


class YouTubeScreen extends StatefulWidget {
  @override
  _YouTubeScreenState createState() => _YouTubeScreenState();
}
class _YouTubeScreenState extends State<YouTubeScreen> with SingleTickerProviderStateMixin {

  TabController? _tabController;

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  List<String> bookReviews = [
    "https://youtu.be/iUiu_sWXBfk?si=QoHRpI1GFOjciuJY",
    "https://youtu.be/9gBS8aUBneE?si=6CKBKjRkLOe03Iq1",
    "https://youtu.be/5RwlFfTF3T0?si=kKEv-wJWjBRSwCKm",
    "https://youtu.be/qY3c8KV9sDo?si=xs6ROV9cw1Yo_OEt",
    "https://youtu.be/q6Drg6ply4E?si=t1TttTG7UIgGPLaN",
    "https://youtu.be/9NuxjTjtHK4?si=Q69kgnwzvhzCNSi7",
    "https://youtu.be/unk2e3I0OG4?si=D5y9GnlzIfigxkX6",
    "https://youtu.be/OrHyygvLig0?si=oWx-K9npIz_ejnuJ",
    "https://youtu.be/iUiu_sWXBfk?si=QoHRpI1GFOjciuJY",

  ];
  List<String> studyHabits = [
    "https://youtu.be/IlU-zDU6aQ0?si=hQVmV1eKGsSuzQz1",
    "https://youtu.be/pd82ZHPNrvs?si=0_95-VpBc6HZrH2c",
    "https://youtu.be/z7e7gtU3PHY?si=bO8TymFdtszdsGH8",
    "https://youtu.be/Rvey9g0VgY0?si=v9aHLVLMbEAP8GPv",
    "https://youtu.be/ErsO3_-RQrs?si=qQKaGQWMn_RZGgxY",
    "https://youtu.be/BY4vl0UVkT0?si=RuWhIuuIVtO5_DEs",
    "https://youtu.be/SVb7fGRuRMU?si=baSlu2t9FunYWWP8",
    "https://youtu.be/gyITyJgNyQ8?si=taMbjA9TAA4h2PBq",
  ];
  List<String> computerScienceVideo = [
    "https://youtu.be/j7iXyUdJTHE?si=2Ulv93aV6wDT1M1m",
    "https://youtu.be/LtoBGQPuu1c?si=StdO3tCcfsGPicWz",
    "https://youtu.be/SzJ46YA_RaA?si=zchmaCQMsYMSMAog",
    "https://youtu.be/mCJWiR3Vdi8?si=LjaNzKoWTZ7_BkZo",
    "https://youtu.be/FpMNs7H24X0?si=m18XFnXGdB5D5yi8",
    "https://youtu.be/zOjov-2OZ0E?si=5rs35j7bYjaD0sBt",
    "https://www.youtube.com/watch?v=dNo_BVzNb28",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5 ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    child: Text(' Review Books ',style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
                  ),
                  Tab(

                    child: Text(" Study Habits ",style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
                  ),
                  Tab(
                    child: Text(' Computer Science video ',style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount : bookReviews.length,
                              itemBuilder: (context, index){
                                return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    child: YoutubeVideo(bookReviews[index]));
                              })
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount : studyHabits.length,
                              itemBuilder: (context, index){
                                return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    child: YoutubeVideo(studyHabits[index]));
                              })
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount : computerScienceVideo.length,
                              itemBuilder: (context, index){
                                return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    child: YoutubeVideo(computerScienceVideo[index]));
                              })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );



  }
}


