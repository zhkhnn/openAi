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
          child: ListTile(
            title: const Text(
              'Открыть камеру',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            leading: Icon(
              Icons.camera_alt_rounded,
              color: Colors.green[900],
            ),
          ),
        ),
        const Divider(
          height: 1,
          color: Colors.grey,
        ),
        GestureDetector(
          onTap: widget.onFiles,
          child: ListTile(
            title: const Text(
              'Выбрать фото',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            leading: Icon(
              Icons.file_copy,
              color: Colors.green[900],
            ),
          ),
        ),
      ],
    );
  }
}
