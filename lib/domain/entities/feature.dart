import 'package:flutter/material.dart';

class Feature {
  final String title;
  final Widget image;
  final Function() onTap;

  Feature(this.title, this.image, this.onTap);
}
