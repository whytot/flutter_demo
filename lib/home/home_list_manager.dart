import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import 'item/home_item.dart';

class HomeListDataManager extends ChangeNotifier {
  final Subject<HomeListData> listResultSubject =
      BehaviorSubject<HomeListData>();

  StreamSubscription<HomeListData> subject2ListResult(
      Function(HomeListData data) onData, Function(dynamic error) onError) {
    return listResultSubject.listen(onData)..onError(onError);
  }

  void requestHomeList() {
    _getHomePageListFromApi()
        .then((value) => listResultSubject.sink.add(value));
  }

  Future<HomeListData> _getHomePageListFromApi() async {
    print('开始 api请求');
    await sleep(Duration(seconds: 2));
    print('结束 api请求');
    return _mockData();
  }

  HomeListData _mockData() {
    var dataList = <HomeListItemData>[];
    dataList.add(HomeListItemData('top', false, 170));
    dataList.add(HomeListItemData('quick', false, 120));
    dataList.add(HomeListItemData('hcp', false, 200));
    dataList.add(HomeListItemData('rpos', false, 300));
    dataList.add(HomeListItemData('aaaa', true, 120));
    dataList.add(HomeListItemData('adsff', true, 180));
    dataList.add(HomeListItemData('tocbsdsp', true, 100));
    dataList.add(HomeListItemData('sfgsgqwer', true, 180));
    dataList.add(HomeListItemData('qwerqwe', true, 180));
    dataList.add(HomeListItemData('wrsdgx', true, 100));
    dataList.add(HomeListItemData('cvx', true, 120));
    dataList.add(HomeListItemData('tyuty', true, 120));
    dataList.add(HomeListItemData('uio', true, 180));
    dataList.add(HomeListItemData('5433', true, 100));
    dataList.add(HomeListItemData('to2ertp', true, 120));
    dataList.add(HomeListItemData('234567', true, 120));
    dataList.add(HomeListItemData('teasdxop', true, 180));
    dataList.add(HomeListItemData('zz', true, 100));
    dataList.add(HomeListItemData('bb', true, 120));
    dataList.add(HomeListItemData('nn', true, 120));
    return HomeListData(DateTime.now().toString(), dataList);
  }
}
