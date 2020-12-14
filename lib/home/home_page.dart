import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import 'home_list_manager.dart';
import 'item/home_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('HomePage build');
    return ChangeNotifierProvider<_HomePageVm>(
      create: (BuildContext context) => _HomePageVm(),
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
            builder: (a, b, c) => Text('$b'),
            selector: (a, _HomePageVm b) => b.otherMessage,
          ),
        ),
        Expanded(
          child: Selector(
            builder: (context, List<BaseHomeItemConfig> configs, child) {
              ///这里要注意，如果这里的build触发，homeList里面的内容全部被rebuild
              ///也就是说如果内外同时触发selector，那么里面的selector很可能响应不到
              print('_homeList build');
              return _homeList(context, configs);
            },
            selector: (context, _HomePageVm vm) {
              return vm.items;
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

  ///TODO: 刷新和适配逻辑需要详细设计
  Widget _homeList(BuildContext context, configs) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
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
  String otherMessage = '';
  final List<BaseHomeItemConfig> items = [
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
  final CompositeSubscription _compositeDispose = CompositeSubscription();
  HomeListDataManager _manager;

  _HomePageVm() {
    print('_HomePageVm init');
    //TODO 想办法注入进来
    _manager = HomeListDataManager();
    _manager.subject2ListResult(_onData(), _onError()).addTo(_compositeDispose);
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
    _compositeDispose.dispose();
  }

  void onOtherClick() async {
    _manager.requestHomeList();
  }

  Function _onData() {
    return (HomeListData data) {
      print('_onData');
      otherMessage = '更新时间：${data.timeStamp}';
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
