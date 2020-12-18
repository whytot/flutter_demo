import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'HomeDataVo.dart';
import 'item/mocker.dart';

class HomeListDataManager extends ChangeNotifier {
  final Subject<HomeDataVo> listResultSubject = BehaviorSubject<HomeDataVo>();

  StreamSubscription<HomeDataVo> subject2ListResult(
      Function(HomeDataVo data) onData, Function(dynamic error) onError) {
    return listResultSubject.listen(onData)..onError(onError);
  }

  @override
  void dispose() {
    listResultSubject.close();
    super.dispose();
  }

  void requestHomeList() {
    _getHomePageListFromApi()
        .then((value) => listResultSubject.sink.add(value));
  }

  Future<HomeDataVo> _getHomePageListFromApi() async {
    print('开始 api请求');
    await sleep(Duration(seconds: 2));
    print('结束 api请求');
    return _mockData();
  }

  Mocker mocker = Mocker();

  HomeDataVo _mockData() {
    return HomeDataVo(DateTime.now().toString(), mocker.mockAll());
  }
}
