import 'dart:io';

import 'package:flutter_full_learn/202/custom_exception.dart';

class FileDownload {
  void downloadItem(FileItem? item) {
    if (item == null) throw FileDownloadException();
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}
