import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_file/internet_file.dart';

import 'package:ticket_raising_management/core/constants/file.constants.dart';

abstract class FileService {
  Future<FilePickerResult?> pickMultiImage();
  Future<FilePickerResult?> pickImage();
  Future<FilePickerResult?> pickAudio();
  Future<FilePickerResult?> pickFile();
  Future<Uint8List> downloadFile(String? url);
}

class FileServiceImpl implements FileService {
  final FilePicker _filePicker = FilePicker.platform;
  static var httpClient = HttpClient();

  @override
  Future<FilePickerResult?> pickMultiImage() async {
    try {
      var files = await _filePicker.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );
      return files;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FilePickerResult?> pickImage() async {
    try {
      var file = await _filePicker.pickFiles(type: FileType.image);
      return file;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FilePickerResult?> pickAudio() async {
    try {
      return await _filePicker.pickFiles(
        type: FileType.audio,
        allowMultiple: true,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FilePickerResult?> pickFile() async {
    try {
      var file = await _filePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: FileConstants.fileTypes,
        allowMultiple: true,
      );

      return file;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Uint8List> downloadFile(String? url) async {
    try {
      if (url == null) throw 'Invalid URL';
      final data = await InternetFile.get(url);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
