import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:native_image_cropper/native_image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/appbar_widget.dart';

import '../utils/constants.dart';
import 'app_button.dart';

class DefaultPage extends StatefulWidget {
  final double aspectRatio;
  final CropMode mode;
  const DefaultPage({
    required this.bytes,
    super.key, required this.aspectRatio, required this.mode,
  });

  final Uint8List bytes;

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  late CropController _controller;
  ImageFormat _format = ImageFormat.jpg;

  @override
  void initState() {
    super.initState();
    _controller = CropController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cropPreview = CropPreview(
      controller: _controller,
      bytes: widget.bytes,
      mode: widget.mode,
      maskOptions: MaskOptions(aspectRatio: widget.aspectRatio),
      dragPointBuilder: (size, position) => CropDragPoint(
        size: size,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
    return Scaffold(
      appBar: const AppBars(
        text: "Image Cropper",
      ),
      body: Column(
        children: [
          switch (Platform.operatingSystem) {
            'macos' => Expanded(
              child: cropPreview,
            ),
            _ => Expanded(child: cropPreview),
          },
          Padding(
            padding: 20.sp.padA,
            child: AppButton.fullWidth(
              isLoading: false,
              onTap: () => unawaited(_cropImage(context)),
              text: "CROP",
            )
            // SizedBox(
            //   width: double.infinity,
            //   child: const Text('CROP'),
            // ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<String> convertBytesToFilePath(Uint8List bytes, String fileName) async {
    try {
      // Get the temporary directory for storing the file
      Directory tempDir = await getTemporaryDirectory();
      String filePath = '${tempDir.path}/$fileName';

      // Write the byte data to the file
      File file = File(filePath);
      await file.writeAsBytes(bytes);

      return file.path;
    } catch (e) {
      // print("Error writing file: $e");
      throw Exception("Failed to write file");
    }
  }

  Future<void> _cropImage(BuildContext context) async {
    final croppedBytes = await _controller.crop(format: _format);
    if (context.mounted) {
      return navigationService.goBack(value: await convertBytesToFilePath(croppedBytes, DateTime.now().toString()));
    }
  }
}