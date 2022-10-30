import 'package:flutter/material.dart';
import 'package:flutter_ripple/flutter_ripple.dart';
import 'package:planet/src/constants/Colors.dart';
import 'package:planet/src/screen/yt.dart';
import 'package:planet/src/services/ap.dart';
import 'package:planet/src/widget/Rivewall.dart';
import 'package:planet/src/widget/Rounded.dart';

class DetailPage extends StatelessWidget {
  dynamic infoPlanet, desc;
  int num;

  DetailPage(
      {super.key,
      required this.desc,
      required this.infoPlanet,
      required this.num});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              Rivewall(),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 200),
                          Text(
                            infoPlanet['Planet'],
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 26,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            desc['description'] == null
                                ? 'no data'
                                : desc['description'],
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 21,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 128.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        child: RoundedContainer(
                          shadowColor:
                              Color.fromARGB(255, 200, 11, 11).withOpacity(0.4),
                          blurRadius: 15.0,
                          isShadow: true,
                          radius: 24,
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          color: Color.fromARGB(218, 5, 5, 68),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 6.0),
                                      child: Center(
                                        child: Text(
                                          "Video",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        height: 90,
                                        child: FutureBuilder<dynamic>(
                                          future:
                                              Planetvideo(infoPlanet['Planet']),
                                          builder: (context, snapshot) {
                                            return snapshot.hasData
                                                ? ListView.builder(
                                                    itemCount: snapshot
                                                        .data['contents']
                                                        .length,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) {
                                                      // print(snapshot
                                                      //         .data['contents']
                                                      //     [index]);
                                                      return InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) =>
                                                                    VideoScreen(
                                                                        id: snapshot.data['contents'][index]['video']
                                                                            [
                                                                            'videoId']),
                                                              ));
                                                        },
                                                        child: play(snapshot
                                                            .data['contents']
                                                                [index]['video']
                                                                ['thumbnails']
                                                                [0]['url']
                                                            .toString()),
                                                      );
                                                    },
                                                  )
                                                : Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                    value: 20,
                                                    color: Colors.redAccent,
                                                  ));
                                          },
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 34,
                child: Hero(
                    tag: infoPlanet['Planet'],
                    child: Image.asset(
                      infoPlanet['img'],
                      height: 250,
                    )),
              ),
              Positioned(
                top: 60,
                left: 22,
                child: Text(
                  num.toString(),
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 247,
                    color: primaryTextColor.withOpacity(0.08),
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget play(String x) {
  return Stack(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              x,
              width: 82,
              height: 82,
              fit: BoxFit.cover,
            )),
      ),
      Positioned(
        top: 20,
        left: 25,
        child: SizedBox(
          height: 42,
          width: 42,
          child: FlutterRipple(
            rippleColor: Colors.red,
            radius: 20.0,
            child: Icon(
              Icons.play_arrow_rounded,
              color: white,
              size: 16,
            ),
          ),
        ),
      )
    ],
  );
}
