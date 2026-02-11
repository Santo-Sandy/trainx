import 'dart:io';

import 'package:StoreLink/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  XFile? imageFile;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(cameras[0], ResolutionPreset.medium);

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      setState(() {
        imageFile = image;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camera")),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_controller);
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),

            // Capture Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: FloatingActionButton(
                onPressed: takePicture,
                child: const Icon(Icons.camera_alt),
              ),
            ),

            // Preview Captured Image
            if (imageFile != null)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Image.file(File(imageFile!.path), height: 120),
              ),
          ],
        ),
      ),
    );
  }
}
