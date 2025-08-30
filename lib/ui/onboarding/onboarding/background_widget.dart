import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackgroundWidget extends StatefulWidget {
  final String assetPath; // can be .png/.jpg/.mp4
  final BoxFit fit;

  const BackgroundWidget({super.key, required this.assetPath, this.fit = BoxFit.cover});

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  VideoPlayerController? _controller;
  bool get isVideo => widget.assetPath.toLowerCase().endsWith(".mp4");

  @override
  void initState() {
    super.initState();
    if (isVideo) {
      _controller = VideoPlayerController.asset(widget.assetPath)
        ..initialize().then((_) {
          _controller!
            ..setLooping(true)
            ..setVolume(0) // 👈 mute video
            ..play();
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isVideo && _controller != null && _controller!.value.isInitialized) {
      return FittedBox(
        fit: widget.fit,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: _controller!.value.size.width,
          height: _controller!.value.size.height,
          child: VideoPlayer(_controller!),
        ),
      );
    } else {
      return Image.asset(
        widget.assetPath,
        fit: widget.fit,
        width: double.infinity,
        height: double.infinity,
      );
    }
  }
}
