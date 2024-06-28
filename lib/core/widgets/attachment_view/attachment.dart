// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/primary_button.dart';
import 'package:ticket_raising_management/core/widgets/attachment_view/audio_attachment.dart';
import 'package:ticket_raising_management/core/widgets/attachment_view/image_attachment.dart';
import 'package:ticket_raising_management/core/widgets/attachment_view/pdf_attachment.dart';
import 'package:ticket_raising_management/core/widgets/attachment_view/video_attachment.dart';
import 'package:ticket_raising_management/services/provider.dart';

class AttachmentView extends ConsumerStatefulWidget {
  final List<AttachmentEntity> data;
  final int type;

  const AttachmentView({
    super.key,
    required this.data,
    required this.type,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AttachmentViewState();
}

class _AttachmentViewState extends ConsumerState<AttachmentView> {
  final List<AttachmentEntity> _attachments = [];

  int _currentItem = 0;

  final PageController _controller = PageController();
  final Duration _duration = const Duration(milliseconds: 200);
  final Cubic _curve = Curves.easeIn;

  bool _isDownloading = false;

  Future<void> _onPrevious() async {
    await _controller.previousPage(duration: _duration, curve: _curve);
    _currentItem = _controller.page?.toInt() ?? 0;
    setState(() {});
  }

  Future<void> _onNext() async {
    await _controller.nextPage(duration: _duration, curve: _curve);
    _currentItem = _controller.page?.toInt() ?? 0;
    setState(() {});
  }

  Future<void> _onDownload() async {
    if (_isDownloading) return;
    setState(() => _isDownloading = true);
    final url = _attachments[_currentItem].url;
    final fileName = _attachments[_currentItem].fileName;
    final bytes = await ref.read(fileService).downloadFile(url);
    final base64 = base64Encode(bytes);
    final href = 'data:application/octet-stream;base64,$base64';
    final anchor = AnchorElement(href: href)..target = 'blank';
    anchor.download = fileName;
    document.body?.append(anchor);
    anchor.click();
    anchor.remove();
    setState(() => _isDownloading = false);
  }

  @override
  void initState() {
    for (var item in widget.data) {
      if (item.type == widget.type) _attachments.add(item);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Spacer(),
      Expanded(
        flex: 2,
        child: AlertDialog(
          backgroundColor: AppColors.white,
          elevation: 0,
          icon: const Row(children: [Spacer(), CloseButton()]),
          content: SizedBox(
            width: 100,
            child: Column(children: [
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller,
                  itemBuilder: (context, index) {
                    final data = _attachments[index];

                    if (data.type == 1) return ImageAttachment(url: data.url);
                    if (data.type == 2) return VideoAttachment(url: data.url);
                    if (data.type == 3) return AudioAttachment(url: data.url);
                    if (data.type == 4) return PdfAttachment(url: data.url);

                    return const SizedBox();
                  },
                  itemCount: _attachments.length,
                ),
              ),
              const SizedBox(height: Dimen.space),
              Row(children: [
                IconButton(
                  onPressed: _onPrevious,
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Expanded(
                  child: PageViewDotIndicator(
                    currentItem: _currentItem,
                    count: _attachments.length,
                    unselectedColor: AppColors.grey,
                    selectedColor: AppColors.blue,
                    size: const Size(12, 12),
                    unselectedSize: const Size(8, 8),
                  ),
                ),
                IconButton(
                  onPressed: _onNext,
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ]),
            ]),
          ),
          actions: [
            Row(children: [
              const Spacer(flex: 2),
              Expanded(
                child: PrimaryButton(
                  text: _isDownloading ? 'Downloading' : 'Download',
                  onTap: _onDownload,
                ),
              ),
            ]),
          ],
        ),
      ),
      const Spacer(),
    ]);
  }
}
