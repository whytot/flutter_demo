import 'package:flutter/material.dart';

abstract class BaseItemConfig {
  Widget build(BuildContext context,
      {double containerWidth, double containerHeight});
}
