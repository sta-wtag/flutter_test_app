import 'dart:io';
import 'package:flutter/material.dart';

class ImageViewerListTile extends StatefulWidget {
  final String imageTitle;
  final File imagePath;

  const ImageViewerListTile(
      {super.key, required this.imageTitle, required this.imagePath});

  @override
  State<ImageViewerListTile> createState() => _ImageViewerListTileState();
}

class _ImageViewerListTileState extends State<ImageViewerListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.imageTitle),
      subtitle: Image.file(
        widget.imagePath,
        width: 200,
        height: 200,
      ),
    );
  }
}
