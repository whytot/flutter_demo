class BaseHomeItemConfig {
  final bool wholeLine;
  final String name;
  final double height;

  const BaseHomeItemConfig(this.wholeLine, this.name, this.height);
}

class GoodsItemConfig extends BaseHomeItemConfig {
  GoodsItemConfig(String name, double height) : super(false, name, height);
}

const topBannerItemConfig = BaseHomeItemConfig(true, 'top', 120);
const quickActionItemConfig = BaseHomeItemConfig(true, 'quick', 150);
const rposActionItemConfig = BaseHomeItemConfig(true, 'rpos', 130);
const hcpActionItemConfig = BaseHomeItemConfig(true, 'hcp', 90);
