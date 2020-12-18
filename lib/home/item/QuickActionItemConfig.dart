import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hp_flutter_module/home/ImageLinkWidget.dart';
import 'package:hp_flutter_module/home/item/itemConfigs.dart';
import 'package:hp_flutter_module/home/item/mocker.dart';

class QuickActionItemConfig implements BaseItemConfig {
  Mocker mocker = Mocker();

  @override
  Widget build(BuildContext context,
      {double containerWidth, double containerHeight}) {
    var itemLength = MediaQuery.of(context).size.width / 5;
    return Column(
      children: [
        Container(
          height: itemLength,
          child: Row(
            children: [
              _item(0),
              _item(1),
              _item(2),
              _item(3),
              _item(4),
            ],
          ),
        ),
        Container(
          height: itemLength,
          child: Row(
            children: [
              _item(5),
              _item(6),
              _item(7),
              _item(8),
              _item(9),
            ],
          ),
        ),
      ],
    );
  }

  Widget _item(int index) {
    return Expanded(
      flex: 1,
      child: ClipOval(
        child: ImageLinkWidget(qaPics[index], '点击位置：QA_$index'),
      ),
    );
  }
}
