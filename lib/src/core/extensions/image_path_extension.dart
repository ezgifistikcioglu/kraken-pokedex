// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum ImagePaths { ic_facebook, ic_google }

extension ImagePathsExtension on ImagePaths {
  String pathImage() {
    return 'assets/images/authentication/$name.png';
  }

  Widget toWidget({double height = 27}) {
    return Image.asset(pathImage(), height: height);
  }
}
