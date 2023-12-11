import 'package:flutter/material.dart';
import 'amazon/views/VideoPlayer.dart';
import 'amazon/views/amazon_component.dart';
import '../amazon/presenter/amazon_presenter.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
          children: <Widget>[
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
          ],
        ),
      );
    //);
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

class AmazonBookListScreen extends StatefulWidget {
  @override _AmazonBookListScreen createState() => _AmazonBookListScreen();
}

class _AmazonBookListScreen extends State<AmazonBookListScreen> {
  @override
  Widget build(BuildContext context) {
    return new AmazonBookListPage(
      new AmazonBookListPresenter(), title: 'Amazon Book List', key: Key("BOOK LIST"),);
  }
}
class YouTubeScreen extends StatefulWidget {
  @override
  _YouTubeScreenState createState() => _YouTubeScreenState();
}
class _YouTubeScreenState extends State<YouTubeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Youtube")),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_three_sweet_dreams.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: YoutubeVideo("https://www.youtube.com/watch?v=G6x6oo1Zvhg"),
              ),
              SizedBox(height: 16),
              Expanded(
                child: YoutubeVideo("https://www.youtube.com/watch?v=b093aqAZiPU" ),
              )],
          ),
        ),
      ),
    );
  }
}


