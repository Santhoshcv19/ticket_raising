import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ticket_raising_management/core/helpers/media.helper.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/utils/assets/assets.dart';
import 'package:ticket_raising_management/core/utils/texts/body.text.dart';
import 'package:ticket_raising_management/core/widgets/image.dart';

class AudioAttachment extends ConsumerStatefulWidget {
  final String? url;

  const AudioAttachment({super.key, required this.url});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AudioAttachmentState();
}

class _AudioAttachmentState extends ConsumerState<AudioAttachment> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  double _currentPos = 0;
  double _maxPos = 0;

  String _currentPoslabel = '00:00:00';
  String _maxPoslabel = '00:00:00';

  bool isplaying = false;

  @override
  void initState() {
    Future.microtask(() async {
      await _audioPlayer.setUrl(widget.url ?? '');

      _audioPlayer.durationStream.listen((event) {
        _maxPos = event?.inSeconds.toDouble() ?? 0;
        _maxPoslabel = MediaHelper.duration(_maxPos.toInt());
      });

      _audioPlayer.playingStream.listen((event) {
        setState(() => isplaying = event);
      });

      _audioPlayer.positionStream.listen((event) {
        _currentPos = event.inSeconds.toDouble();
        _currentPoslabel = MediaHelper.duration(_currentPos.toInt());
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(),
      const Photo(image: Assets.music),
      const Spacer(),
      Slider(
        value: double.parse(_currentPos.toString()),
        min: 0,
        max: _maxPos,
        label: _currentPoslabel,
        onChanged: (double value) async {
          double seekval = value;
          await _audioPlayer.seek(Duration(milliseconds: seekval.round()));
          _currentPos = seekval;
          _currentPoslabel = MediaHelper.duration(seekval.toInt());

          setState(() {});
        },
      ),
      Row(children: [
        AppBodyText(data: _currentPoslabel),
        const Spacer(),
        IconButton.filledTonal(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.grey300),
          ),
          onPressed: () async {
            if (!isplaying) return await _audioPlayer.play();
            if (isplaying) return await _audioPlayer.pause();
          },
          icon: Icon(isplaying ? Icons.pause : Icons.play_arrow_outlined),
        ),
        const Spacer(),
        AppBodyText(data: _maxPoslabel),
      ]),
    ]);
  }
}
