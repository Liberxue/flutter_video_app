import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// class SpeechModel {
//   String lang;
//   String name;
//   String defaultRate;
//   String defaultPitch;
//   SpeechModel({this.lang, this.name, this.defaultRate, this.defaultPitch});
// }

// class ComplicatedObjectNotifier extends ValueNotifier<SpeechModel> {
//   ComplicatedObjectNotifier(SpeechModel object) : super(object);

//   // SpeechModel speechModel = new SpeechModel();

//   void setTitle(SpeechModel speechModel) {
//     value.name = speechModel.name;
//     value.lang = speechModel.lang;
//     value.defaultRate = speechModel.defaultRate;
//     value.defaultPitch = speechModel.defaultPitch;
//     notifyListeners();
//   }
// }

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget(
      {@required this.lang,
      this.name,
      this.defaultRate,
      this.defaultPitch,
      child})
      : super(child: child);
  final String lang;
  final String name;
  final double defaultRate;
  final double defaultPitch;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    // return old.lang != lang;
    return true;
  }
}
