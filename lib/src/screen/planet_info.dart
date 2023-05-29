import 'package:flutter/material.dart';
import 'package:planet/src/services/planet_Ytservices.dart';
import 'package:planet/src/widget/planet_content_card.dart';
import 'package:planet/src/widget/planet_card.dart';
import 'package:rive/rive.dart';

class PlanetInfo extends StatefulWidget {
  PlanetInfo(
      {super.key,
      required this.tag,
      required this.name,
      required this.desc,
      required this.position});

  String tag, name, desc;
  String position;

  @override
  State<PlanetInfo> createState() => _PlanetInfoState();
}

class _PlanetInfoState extends State<PlanetInfo> {
  dynamic Post;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    Post = await Planetvideo().getvideo(widget.name);
    // print(Post['contents'][0]['video']['thumbnails'][0]['url']);
    if (Post != null) {
      setState((() => isLoading = true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          RiveAnimation.asset(
            'assets/rive/cosmos.riv',
            fit: BoxFit.cover,
          ),
          PlanetDetail(
            tag: widget.tag,
            desc: widget.desc,
            position: widget.position,
          ),
          // ExhibitionBottomSheet()
          ContentCard(content: Post, load: isLoading),
        ],
      ),
    );
  }
}

// ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.asset(
//                         widget.listing.coverUrl,
//                         fit: BoxFit.cover,
//                       ),
