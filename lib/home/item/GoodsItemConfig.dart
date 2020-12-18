import 'package:flutter/material.dart';
import 'package:hp_flutter_module/home/ImageLinkWidget.dart';

import 'itemConfigs.dart';

class GoodsItemConfig implements BaseItemConfig {
  String picUrl;
  String link;
  String name;

  ///图片的实际宽高
  int width;
  int height;

  GoodsItemConfig(this.name, this.picUrl, this.link, this.height, this.width);

  @override
  Widget build(BuildContext context,
      {double containerWidth, double containerHeight}) {
    return Column(
      children: [
        SizedBox(
          width: _calculatePicActualWidth(containerWidth, containerHeight),
          height: _calculatePicActualHeight(containerWidth, containerHeight),
          child: ImageLinkWidget(picUrl, link),
        ),
        Text('$name'),
      ],
    );
  }

  double _calculatePicActualWidth(
      double containerWidth, double containerHeight) {
    if (containerWidth != null) {
      return containerWidth;
    } else if (containerHeight != null) {
      return containerHeight * (width / height);
    } else {
      return null;
    }
  }

  double _calculatePicActualHeight(
      double containerWidth, double containerHeight) {
    if (containerHeight != null) {
      return containerHeight;
    } else if (containerWidth != null) {
      return containerWidth * (height / width);
    } else {
      return null;
    }
  }
}
