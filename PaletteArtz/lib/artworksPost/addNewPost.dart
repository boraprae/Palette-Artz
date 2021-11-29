import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AddNewPost extends StatefulWidget {
  const AddNewPost({Key? key}) : super(key: key);

  @override
  _AddNewPostState createState() => _AddNewPostState();
}

class _AddNewPostState extends State<AddNewPost> {
  TextEditingController artTitleController = TextEditingController();
  TextEditingController artDescriptionController = TextEditingController();
  TextEditingController artTagController = TextEditingController();
  var dropdownvalue = 'Select style of arts';
  var styleItem = [
    'Select style of arts',
    'Anime & Manga',
    'K-pop Fanart',
    'Fantasy',
    'Series Fanart',
    'Game Art',
    'Ilustration',
    'Digital Art'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: bgBlack,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.3 * size.height,
            width: size.width,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: darkLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_a_photo_outlined,
                    size: 0.05 * size.height,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Tap to select your artworks',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: artTitleController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(fontSize: 12.0, color: grayText),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: pinkG, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.01 * size.height,
                ),
                Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                  child: TextField(
                    controller: artDescriptionController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(fontSize: 12.0, color: grayText),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: pinkG, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: lightGray),
                  height: 50,
                  child: Row(
                    children: [
                      DropdownButton(
                        value: dropdownvalue,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        selectedItemBuilder: (BuildContext context) {
                          return styleItem.map((String styleItem) {
                            return Text(
                              styleItem,
                              style: const TextStyle(color: Colors.white54),
                            );
                          }).toList();
                        },
                        underline: SizedBox(),
                        items: styleItem.map((String styleItem) {
                          return DropdownMenuItem(
                            child: Text(styleItem),
                            value: styleItem,
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: TextFieldTags(
                    tagsStyler: TagsStyler(
                      showHashtag: true,
                      tagMargin: const EdgeInsets.only(right: 4.0),
                      tagCancelIcon:
                          Icon(Icons.cancel, size: 15.0, color: Colors.white),
                      tagCancelIconPadding:
                          EdgeInsets.only(left: 4.0, top: 2.0),
                      tagPadding: EdgeInsets.only(
                          top: 2.0, bottom: 4.0, left: 8.0, right: 4.0),
                      tagDecoration: BoxDecoration(
                        color: pinkG,
                        // border: Border.all(
                        //   color: Colors.white,
                        // ),
                        // borderRadius: const BorderRadius.all(
                        //   Radius.circular(20.0),
                        // ),
                      ),
                      tagTextStyle: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.white),
                    ),
                    textFieldStyler: TextFieldStyler(
                      textFieldFilled: true,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      hintText: "Add your tags here",
                      hintStyle: TextStyle(
                          fontSize: 12.0, color: Colors.white.withOpacity(0.5)),
                      isDense: false,
                      textFieldFocusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: pinkG, width: 0.5),
                      ),
                      textFieldEnabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                      ),
                    ),
                    onDelete: (tag) {
                      print('onDelete: $tag');
                    },
                    onTag: (tag) {
                      print('onTag: $tag');
                    },
                    validator: (String tag) {
                      print('validator: $tag');
                      if (tag.length > 10) {
                        return "hey that is too much";
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
