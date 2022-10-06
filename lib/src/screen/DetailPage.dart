import 'package:flutter/material.dart';
import 'package:planet/src/constants/Colors.dart';
import 'package:planet/src/services/ap.dart';
import 'package:planet/src/widget/Rounded.dart';

class DetailPage extends StatelessWidget {
  dynamic infoPlanet;

  DetailPage({super.key, required this.infoPlanet});

  @override
  Widget build(BuildContext context) {
    final String arg = infoPlanet['Planet'];
    var i;

    void setPlant() async {
      i = await Planetvideo('Planet `$arg`');

      print(i.length);
    }

    setPlant();

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/Detail-bg.png'))),
          child: Stack(
            children: <Widget>[
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
                            '',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 26,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Solar System',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 31,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Text(
                                      "There is still time to start the examuis",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 20,
                right: 34,
                child: Hero(
                    tag: infoPlanet['Planet'],
                    child: Image.asset(infoPlanet['img'])),
              ),
              Positioned(
                top: 60,
                left: 32,
                child: Text(
                  3.toString(),
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
