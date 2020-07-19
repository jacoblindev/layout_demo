import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Navigation Basics',
      initialRoute: '/',
      routes: {
        '/': (context) => FirstRoute(),
        '/second': (context) => DetailScreen(),
      },
    ),
  );
}

class FirstRoute extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Demo'),
        ),
        body: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/second',
                );
              },
              child: Hero(
                tag: 'imageHero',
                child: Image.asset(
                  'images/person-on-a-bridge-near-a-lake-747964.jpg',
                ),
              ),
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Second Route"),
//      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
          tag: 'imageHero',
          child: Container(
            height: double.infinity,
            child: Image.asset(
              'images/person-on-a-bridge-near-a-lake-747964.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

Widget titleSection = Container(
  padding: EdgeInsets.all(32.0),
  child: Row(
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Schönau am Königssee, Germany',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            Text(
              'by Simon Migaj',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      FavoriteWidget(),
    ],
  ),
);

Widget buttonSection = Container(
  padding: EdgeInsets.symmetric(
    vertical: 0,
    horizontal: 24.0,
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      FlatButton(
        onPressed: () {},
        child: Column(
          children: <Widget>[
            Icon(
              Icons.phone,
              color: Colors.indigoAccent,
              size: 36.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'CALL',
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
      FlatButton(
        onPressed: () {},
        child: Column(
          children: <Widget>[
            Icon(
              Icons.directions,
              color: Colors.indigoAccent,
              size: 36.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'ROUTE',
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
      FlatButton(
        onPressed: () {},
        child: Column(
          children: <Widget>[
            Icon(
              Icons.share,
              color: Colors.indigoAccent,
              size: 36.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'SHARE',
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Person on a Bridge Near a Lake\n'
    'Uploaded at December 20, 2017\n'
    'Size	6.1 MB\n'
    'Resolution	4000px x 2525px\n'
    'Taken At	September 08, 2017 1:45 pm\n'
    'Aspect Ratio	160:101',
    softWrap: true,
    style: TextStyle(
      fontSize: 18.0,
    ),
  ),
);

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 99;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount--;
        _isFavorited = false;
      } else {
        _favoriteCount++;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(4.0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.redAccent,
            iconSize: 24.0,
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          child: Text(
            '$_favoriteCount',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        )
      ],
    );
  }
}
