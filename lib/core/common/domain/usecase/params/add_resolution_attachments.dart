import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

class ResolutionAttachmentParams extends Equatable {
  final String? url;
  final int? type;
  final String? ticketId;
  final List<PlatformFile>? resolutionattachments;

  const ResolutionAttachmentParams({
    this.url,
    this.type,
    this.ticketId,
    required this.resolutionattachments,
  });

  @override
  List<Object?> get props => [];
}
