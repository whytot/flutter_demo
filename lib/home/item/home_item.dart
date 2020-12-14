class BaseHomeItemConfig {
  final bool wholeLine;
  final String name;
  final double height;

  const BaseHomeItemConfig(this.wholeLine, this.name, this.height);
}

// BaseHomeItemConfig convert(HomeListItemData data) {
//   if (data.goods) {
//     return GoodsItemConfig('商品名：${data.name}', data.height);
//   } else {
//     return BaseHomeItemConfig(true, '${data.name}', data.height);
//   }
// }

class GoodsItemConfig extends BaseHomeItemConfig {
  GoodsItemConfig(String name, double height) : super(false, name, height);
}

const topBannerItemConfig = BaseHomeItemConfig(true, 'top', 120);
const quickActionItemConfig = BaseHomeItemConfig(true, 'quick', 150);
const rposActionItemConfig = BaseHomeItemConfig(true, 'rpos', 130);
const hcpActionItemConfig = BaseHomeItemConfig(true, 'hcp', 90);

class HomeListData {
  String timeStamp;
  List<HomeListItemData> dataList;

  HomeListData(this.timeStamp, this.dataList);
}

class HomeListItemData {
  String name;
  bool goods;
  double height;

  HomeListItemData(this.name, this.goods, this.height);
}
