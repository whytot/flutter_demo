import 'dart:math';

import 'GoodsItemConfig.dart';
import 'QuickActionItemConfig.dart';
import 'itemConfigs.dart';

const qaPics = [
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608291319358&di=3fd4f5e7ebc17f7c694b48851fab95d1&imgtype=0&src=http%3A%2F%2Fspider.nosdn.127.net%2F7aa697cfb9aa414d4eaf341ab5310b7e.jpeg',
  'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2629447256,416461880&fm=26&gp=0.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608291319358&di=60caced0144038ef12f57712f248cb0b&imgtype=0&src=http%3A%2F%2Fa.vpimg4.com%2Fupload%2Fmerchandise%2F45531%2FTINZE-B-5521G-2.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608291319358&di=da8655c4fce1b0d760af63785551eea6&imgtype=0&src=http%3A%2F%2Fimages.ofweek.com%2FUpload%2FNews%2F2018-05%2F16%2Fzhouxiyao%2F1526437399541051110.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608291319358&di=330c655d52306b04d7d83ef6288da0b9&imgtype=0&src=http%3A%2F%2Fimage8.wbiao.co%2Fshop%2F201512_16_W6920100_29583.jpg',
  'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1384670379,46093559&fm=26&gp=0.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608291319358&di=e969c5ebdf235f4e5c493bf5f33f9927&imgtype=0&src=http%3A%2F%2Fpic.16pic.com%2F00%2F10%2F56%2F16pic_1056886_b.jpg',
  'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3425057523,4033004900&fm=26&gp=0.jpg',
  'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2908675597,1722754561&fm=26&gp=0.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608291319358&di=0168ec134b08cf31dea4bf079eef3618&imgtype=0&src=http%3A%2F%2Fpic11.secooimg.com%2Fproduct%2F500%2F500%2F19%2F25%2F13871925.jpg',
];

const goodsPics = [
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=447f625ebf7c01069712a7ea13a44767&imgtype=0&src=http%3A%2F%2Fpic2.16pic.com%2F00%2F19%2F31%2F16pic_1931716_b.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=e1bcf9782293b551f3fac7749ba7a4d3&imgtype=0&src=http%3A%2F%2Fwww.officedoyen.com%2Fuploads%2Fallimg%2F141003%2F1-14100322552E53.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=341bc69338cb4db1e8db407d01ddea57&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2F5w%2F7c%2FQJ6217249688.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=22559871253e79dfabb5dc233d119df6&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fk2%2Fgw%2FQJ8829960049.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=a10076fc37ba344e1785066a06a72901&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fvs%2Fh8%2FQJ8858412057.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=12c46dd8713ba3489093af54a919eb26&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fd0%2Fxt%2FQJ6653999622.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=f0884dc1d23dd5c9d33a7dbc82b447d8&imgtype=0&src=http%3A%2F%2Fimgcache.tuwandata.com%2Fv2%2Fthumb%2Fall%2FOGZjMyw2MDAsMTAwLDQsMywxLC0xLDEs%2Fu%2Fwww.tuwan.com%2Fuploads%2Fallimg%2F1512%2F09%2F819_151209114054_1.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=8918ac8f6a9af1b6eac1bfb42a080f99&imgtype=0&src=http%3A%2F%2Fimg.08087.cc%2Fuploads%2F20190505%2F11%2F1557025907-snHKVobAhS.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=f31bacda09a87d9cf169e684c7e0a022&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2F78%2F8x%2FQJ6179193900.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=f31bacda09a87d9cf169e684c7e0a022&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2F78%2F8x%2FQJ6179193900.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=a10076fc37ba344e1785066a06a72901&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fvs%2Fh8%2FQJ8858412057.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=12c46dd8713ba3489093af54a919eb26&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fd0%2Fxt%2FQJ6653999622.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=f0884dc1d23dd5c9d33a7dbc82b447d8&imgtype=0&src=http%3A%2F%2Fimgcache.tuwandata.com%2Fv2%2Fthumb%2Fall%2FOGZjMyw2MDAsMTAwLDQsMywxLC0xLDEs%2Fu%2Fwww.tuwan.com%2Fuploads%2Fallimg%2F1512%2F09%2F819_151209114054_1.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=8918ac8f6a9af1b6eac1bfb42a080f99&imgtype=0&src=http%3A%2F%2Fimg.08087.cc%2Fuploads%2F20190505%2F11%2F1557025907-snHKVobAhS.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=f31bacda09a87d9cf169e684c7e0a022&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2F78%2F8x%2FQJ6179193900.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608285385927&di=f31bacda09a87d9cf169e684c7e0a022&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2F78%2F8x%2FQJ6179193900.jpg',
];

class Mocker {
  final _random = Random();

  List<BaseItemConfig> mockGoodsList() {
    var items = <BaseItemConfig>[];
    goodsPics.forEach((url) {
      items.add(GoodsItemConfig(
          '我是名字', url, '我是link', 100 + (_random.nextInt(3) * 30), 100));
    });
    return items;
  }

  List<BaseItemConfig> mockFixedList() {
    return <BaseItemConfig>[QuickActionItemConfig()];
  }

  List<BaseItemConfig> mockAll() {
    return mockFixedList()..addAll(mockGoodsList());
  }
}
