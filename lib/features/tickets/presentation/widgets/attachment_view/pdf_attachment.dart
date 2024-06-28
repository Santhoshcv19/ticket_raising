import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:ticket_raising_management/services/provider.dart';

class PdfAttachment extends ConsumerStatefulWidget {
  final String? url;

  const PdfAttachment({super.key, required this.url});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PdfAttachmentState();
}

class _PdfAttachmentState extends ConsumerState<PdfAttachment> {
  @override
  Widget build(BuildContext context) {
    final file = ref.read(fileService);

    return FutureBuilder(
      future: file.downloadFile(widget.url),
      builder: (context, snapshot) {
        final data = snapshot.data;

        if (data == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SfPdfViewer.memory(data);
      },
    );
  }
}
