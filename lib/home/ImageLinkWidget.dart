import 'package:flutter/material.dart';
import 'package:hp_flutter_module/home/LinkHandler.dart';
import 'package:provider/provider.dart';

import 'LinkHandler.dart';

///内部不限制宽高，如果外部不使用限制宽高的widget，那么将会看到被'撑开'的效果
class ImageLinkWidget extends StatelessWidget {
  final String url;
  final String link;

  ImageLinkWidget(this.url, this.link);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.scaleDown,
      filterQuality: FilterQuality.low,
      repeat: ImageRepeat.repeat,
      frameBuilder: (a, b, c, d) => _frameBuilder(a, b, c, d),
    );
  }

  ///frame是null表示图片未加载时
  Widget _frameBuilder(BuildContext context, Widget child, int frame,
      bool wasSynchronouslyLoaded) {
    if (frame == null) {
      ///loading时显示的内容
      return Container(
        color: Colors.grey,
        child: Text('loading……'),
      );
    } else {
      return InkWell(
        onTap: () => context.read<LinkHandler>().handleLink(link),
        child: child,
      );
    }
  }
}
