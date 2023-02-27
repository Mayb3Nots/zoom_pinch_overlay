import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget listRow(int profile, int image, int likes, String name, String text) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage('https://picsum.photos/800?image=$profile'),
              ),
              SizedBox(width: 8),
              Text(name)
            ]),
          ),
          ZoomOverlay(
              modalBarrierColor: Colors.black12, // optional
              minScale: 0.5, // optional
              maxScale: 3.0, // optional
              twoTouchOnly: true,
              animationDuration: Duration(milliseconds: 300),
              animationCurve: Curves.fastOutSlowIn,
              onScaleStart: () {
                debugPrint('zooming!');
              }, // optional
              onScaleEnd: () {
                debugPrint('zooming ended!');
              }, // optional
              child: CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/800?image=$image')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    FaIcon(
                      FontAwesomeIcons.heart,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 16),
                    FaIcon(
                      FontAwesomeIcons.comment,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 16),
                    FaIcon(
                      FontAwesomeIcons.paperPlane,
                      color: Colors.black54,
                    ),
                  ]),
                  FaIcon(
                    FontAwesomeIcons.bookmark,
                    color: Colors.black54,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text('$likes likes'),
              ),
              RichText(
                  text: TextSpan(
                      text: name,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                    TextSpan(
                      text: ' ' + text,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    )
                  ]))
            ]),
          ),
          SizedBox(height: 10)
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            title: Text('Instagram',
                style: GoogleFonts.cookie(
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                    fontSize: 38)),
            systemOverlayStyle: SystemUiOverlayStyle.dark),
        body: ListView(
          children: <Widget>[
            listRow(1027, 1062, 36, 'mary.porter',
                'Lucy doesnt want to get out of bed today, its far too cold for the little darling.'),
            listRow(324, 557, 65, 'paul.bishop',
                'Looks like its going to be a rough crossing.'),
            listRow(453, 585, 29, 'mel_fortwright',
                'The stands are packed, this is going to be a good game !'),
            listRow(64, 653, 18, 'robDavidJuiceMan', 'My office for day.'),
          ],
        ));
  }
}
