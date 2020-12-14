import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'item/home_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _HomePageVm(),
      child: Scaffold(
        body: _Page(),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector(
      builder: (context, configs, child) {
        return _homeList(configs);
      },
      selector: (context, _HomePageVm vm) {
        return vm.items;
      },
      shouldRebuild:
          (List<BaseHomeItemConfig> previous, List<BaseHomeItemConfig> next) {
        //TODO: 这里要考虑好刷新的条件，什么条件控制整体刷新，什么条件控制单个刷新
        return previous.length != next.length;
      },
    );
  }

  StaggeredTile _tileBuilder(int index, bool wholeLine) {
    if (wholeLine) {
      return StaggeredTile.fit(2);
    } else {
      return StaggeredTile.fit(1);
    }
  }

  ///TODO: 刷新和适配逻辑需要详细设计
  Widget _homeList(configs) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: configs.length,
      crossAxisSpacing: 4,
      mainAxisSpacing: 2,
      itemBuilder: (context, index) {
        return Container(
          height: configs[index].height,
          color: Colors.white,
          child: Text('${configs[index].name}'),
        );
      },
      staggeredTileBuilder: (index) =>
          _tileBuilder(index, configs[index].wholeLine),
    );
  }
}

class _HomePageVm extends ChangeNotifier {
  List<BaseHomeItemConfig> items = [
    topBannerItemConfig,
    quickActionItemConfig,
    rposActionItemConfig,
    hcpActionItemConfig,
    GoodsItemConfig('qwe', 151),
    GoodsItemConfig('sdf', 124),
    GoodsItemConfig('xcvb', 145),
    GoodsItemConfig('gyuiutygjfh', 122),
    GoodsItemConfig('zcz', 147),
    GoodsItemConfig('a', 135),
    GoodsItemConfig('uuu', 173),
    GoodsItemConfig('qiioowe', 119),
    GoodsItemConfig('xcvbnm', 143),
    GoodsItemConfig('c', 134),
  ];
}
