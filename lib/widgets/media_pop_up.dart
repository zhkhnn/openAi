import 'package:flutter/material.dart';

class MediaPopUp extends StatefulWidget {
  final VoidCallback onCamera;
  final VoidCallback onFiles;
  const MediaPopUp({
    super.key,
    required this.onCamera,
    required this.onFiles,
  });

  @override
  State<MediaPopUp> createState() => _MediaPopUpState();
}

class _MediaPopUpState extends State<MediaPopUp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onCamera,
          child: const ListTile(
            title: Text('Открыть камеру'),
            leading: Icon(Icons.camera_alt_rounded),
          ),
        ),
        const Divider(
          height: 1,
          color: Colors.grey,
        ),
        GestureDetector(
          onTap: widget.onFiles,
          child: const ListTile(
            title: Text('Открыть фото'),
            leading: Icon(Icons.file_copy),
          ),
        ),
      ],
    );
  }
}
