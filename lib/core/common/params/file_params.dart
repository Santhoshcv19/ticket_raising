import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class FileParams extends Equatable {
  final String path;
  final String? fileName;
  final Uint8List? file;

  const FileParams({required this.path, this.fileName, this.file});

  @override
  List<Object?> get props => [path, fileName, file];
}
