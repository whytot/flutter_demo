import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import 'HomeDataVo.dart';
import 'home_list_manager.dart';
import 'item/GoodsItemConfig.dart';
import 'item/itemConfigs.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('HomePage build');
    return ChangeNotifierProvider<_HomePageVm>(
      create: (BuildContext context) =>
          _HomePageVm(context.read<HomeListDataManager>()),
      builder: (BuildContext context, Widget child) {
        print('ChangeNotifierProvider build');
        return Scaffold(
          body: _Page(),
        );
      },
    );
  }
}

class _Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('_Page build');
    print('${context.toString()}');
    return Column(
      children: [
        FlatButton(
          onPressed: () => context.read<_HomePageVm>().onOtherClick(),
          child: Selector(
            builder: (BuildContext context, String b, Widget c) => Text('$b'),
            selector: (BuildContext context, _HomePageVm b) => b.otherMessage,
          ),
        ),
        Expanded(
          child: Selector(
            builder: (context, List<BaseItemConfig> configs, child) {
              print('_homeList build');
              return _homeList(context, configs);
            },
            selector: (context, _HomePageVm vm) {
              return vm.items;
            },
            shouldRebuild: (List<BaseItemConfig> a, List<BaseItemConfig> b) {
              return a.length != b.length;
            },
          ),
        ),
      ],
    );
  }

  StaggeredTile _tileBuilder(int index, bool wholeLine) {
    if (wholeLine) {
      return StaggeredTile.fit(2);
    } else {
      return StaggeredTile.fit(1);
    }
  }

  bool _wholeLine(BaseItemConfig config) {
    return !(config is GoodsItemConfig);
  }

  double _itemWidth(BuildContext context, BaseItemConfig config) {
    final size = MediaQuery.of(context).size;
    return size.width / (_wholeLine(config) ? 1 : 2);
  }

  Widget _homeList(BuildContext context, List<BaseItemConfig> configs) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      crossAxisCount: 2,
      itemCount: configs.length,
      crossAxisSpacing: 4,
      mainAxisSpacing: 2,
      itemBuilder: (context, index) {
        var itemConfig = configs[index];
        return itemConfig.build(context,
            containerWidth: _itemWidth(context, itemConfig));
      },
      staggeredTileBuilder: (index) =>
          _tileBuilder(index, _wholeLine(configs[index])),
    );
  }
}

class _HomePageVm extends ChangeNotifier {
  String otherMessage = '点我点我点我点我点我点我';
  List<BaseItemConfig> items = [];
  final CompositeSubscription _compositeDispose = CompositeSubscription();
  HomeListDataManager _manager;

  _HomePageVm(this._manager) {
    print('_HomePageVm init');
    _manager.subject2ListResult(_onData(), _onError()).addTo(_compositeDispose);
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
    _compositeDispose.dispose();
  }

  void onOtherClick() {
    _manager.requestHomeList();
  }

  Function _onData() {
    return (HomeDataVo data) {
      print('_onData');
      otherMessage = '更新时间：${data.timeStamp}';
      items = data.dataList;
      notifyListeners();
    };
  }

  Function _onError() {
    return (error) {
      print('_onError');
      otherMessage = '数据异常：$error';
      notifyListeners();
    };
  }
}
