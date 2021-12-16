import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'image_data.dart';

class SeparatePage extends StatefulWidget {
  const SeparatePage({Key? key}) : super(key: key);

  @override
  _SeparatePageState createState() => _SeparatePageState();
}

class _SeparatePageState extends State<SeparatePage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        backgroundColor: bgBlack,
        title:
            Text('${data['name']}'), //! can chang name title but now hard code
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: InstagramSearchGrid(),
      ),
    );
  }
}

class InstagramSearchGrid extends StatefulWidget {
  @override
  _InstagramSearchGridState createState() => _InstagramSearchGridState();
}

class _InstagramSearchGridState extends State<InstagramSearchGrid> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: imageList.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          print(index);
        },
        child: ImageCard(
          imageData: imageList[index],
        ),
      ),
      staggeredTileBuilder: (index) => StaggeredTile.count(
          (index % 8 == 0) ? 2 : 1, (index % 8 == 0) ? 2 : 1),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
    );
  }
}

class ImageCard extends StatefulWidget {
  const ImageCard({this.imageData});

  final ImageData? imageData;

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Image.network(widget.imageData!.imageUrl!, fit: BoxFit.cover),
    );
  }
}
