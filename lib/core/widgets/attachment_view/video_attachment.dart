import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoAttachment extends ConsumerStatefulWidget {
  final String? url;

  const VideoAttachment({super.key, required this.url});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VideoAttachmentState();
}

class _VideoAttachmentState extends ConsumerState<VideoAttachment> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async => await _initialize());
  }

  Future<void> _initialize() async {
    final uri = Uri.parse(widget.url!);
    _controller = VideoPlayerController.networkUrl(uri);
    await _controller?.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) return const SizedBox();

    final bool isInitialized = _controller?.value.isInitialized ?? false;
    final bool isPlaying = _controller?.value.isPlaying ?? false;

    return Stack(alignment: Alignment.center, children: [
      if (!isInitialized) const CircularProgressIndicator(),
      if (isInitialized) VideoPlayer(_controller!),
      IconButton(
        onPressed: () async {
          setState(() {});
          if (isPlaying) return await _controller?.pause();
          await _controller?.play();
        },
        icon: Icon(isPlaying ? Icons.pause_circle : Icons.play_circle),
      ),
    ]);
  }
}
