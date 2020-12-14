## 基础部分
### dart
    https://www.dartcn.com/guides/language/language-tour
    语言规范：
        https://www.dartcn.com/guides/language/effective-dart/style
        在analysis_options.yaml中编辑需要的规则
            当前项目使用了google提供的一个它认为更合理的一套规范
            https://pub.flutter-io.cn/packages/pedantic
            在analysis_options.yaml中添加include: package:pedantic/analysis_options.yaml即可
### 比较重要的几个lib
    rxdart
    provider
    bloc/flutter_bloc：https://bloclibrary.dev/#/gettingstarted
    
## 其它 
### 控制层与model交互
    rxdart
    provider
    bloc/flutter_bloc
    原生Stream
### V与控制层交互
    BLoC和MVVM两种模式，二者的区别与关联：
        BLoC中V层通过event向控制层发送请求
        MVVM中V层通过VM提供的接口向控制层发送请求
        二者的控制层都通过state更新V层
    一些库和实现方式：
        Stream（原生）
        provider
        bloc/flutter_bloc
    还有：
        还有一些其它的模式 redux
### 依赖注入
    状态管理框架的lib都可以实现依赖注入，目前mark写的base项目用的是dartin(一个在provider基础上实现的lib)
### 存储
### 网络请求
### flutter-原生交互
### UI
    瀑布流：flutter_staggered_grid_view，开发者很久没有更新了
    图片加载
### 单元测试
