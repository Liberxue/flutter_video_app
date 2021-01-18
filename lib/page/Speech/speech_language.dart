import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/Utils/store.dart';
import 'package:ciying/api/speech/speech.dart';
import 'package:ciying/grpc/proto/common.pbenum.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/models/speech.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SpeechLanguage extends StatefulWidget {
  const SpeechLanguage({Key key, this.tabAction, this.callBack})
      : super(key: key);
  final String tabAction;
  final Function callBack;
  @override
  _SpeechLanguageState createState() => new _SpeechLanguageState();
}

class _SpeechLanguageState extends State<SpeechLanguage>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;

  List<LangType> seppckLangType = <LangType>[];
  bool isLoading = true;
  int _selectIndex = 0;
  String _lang = "zh-CN-XiaoxiaoNeural";
  String _name = "普通话-女";
  double _defaultRate = 0.73;
  double _speechPitch = 0.86;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    loadSpeeckList();
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 800));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    // animationController = AnimationController(
    //     duration: const Duration(milliseconds: 2000), vsync: this);
    super.dispose();
  }

  Future loadSpeeckList() async {
    GetSpeeckListRequest getSpeeckListRequest = GetSpeeckListRequest();
    getSpeeckListRequest.action = widget.tabAction;
    GetSpeeckListResponse getSpeeckListResponse =
        await SpeechApi.getSpeeckListApiRequest(getSpeeckListRequest);
    if (this.mounted) {
      if (getSpeeckListResponse.code != ResponseCode.SUCCESSFUL)
        setState(() {
          seppckLangType = null;
          isLoading = true;
        });
      else
        setState(() {
          seppckLangType = getSpeeckListResponse.langType;
          _lang = seppckLangType[0].lang;
          _name = seppckLangType[0].name;
          _defaultRate = seppckLangType[0].rate;
          _speechPitch = seppckLangType[0].pitch;
          Cache.setCache("speechLang", seppckLangType[0].lang);
          Cache.setCache("name", seppckLangType[0].name);
          Cache.setCache("speechRate", seppckLangType[0].rate.toString());
          Cache.setCache("speechPitch", seppckLangType[0].pitch.toString());
          isLoading = false;
        });
    }
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Padding(
            padding: const EdgeInsets.all(50),
            child: Text(
              "正在加载 ... ",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                letterSpacing: 0.27,
                color: HexColor("#252C4E"),
              ),
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                new Container(
                  height: 60,
                  width: double.infinity,
                  child: FutureBuilder<bool>(
                      future: getData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        return ListView.builder(
                          padding: const EdgeInsets.only(
                              top: 0, bottom: 0, right: 16, left: 16),
                          itemCount: seppckLangType.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final int count = seppckLangType.length > 10
                                ? 10
                                : seppckLangType.length;
                            final Animation<double> animation =
                                Tween<double>(begin: 0.0, end: 1.0).animate(
                                    CurvedAnimation(
                                        parent: animationController,
                                        curve: Interval(
                                            (1 / count) * index, 1.0,
                                            curve: Curves.fastOutSlowIn)));
                            animationController.forward();
                            // return CategoryView(
                            //   langType: seppckLangType[index],
                            //   animation: animation,
                            //   animationController: animationController,
                            //   callback: () {
                            //     widget.callBack();
                            //   },
                            // );
                            return ShareDataWidget(
                              lang: _lang,
                              name: _name,
                              defaultRate: _defaultRate,
                              defaultPitch: _speechPitch,
                              child: FadeTransition(
                                opacity: animation,
                                child: ChoiceChip(
                                  label: Text(seppckLangType[index].name),
                                  selected: _selectIndex == index,
                                  backgroundColor: Colors.grey[10],
                                  labelPadding: EdgeInsets.all(5.0),
                                  elevation: 0.5,
                                  padding: EdgeInsets.all(8.0),
                                  avatar: CircleAvatar(
                                    // backgroundImage:
                                    //     AssetImage('assets/images/logo.png'),
                                    backgroundColor: Colors.white70,
                                    child: Text(
                                      seppckLangType[index]
                                          .name[0]
                                          .toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.red),
                                    ),
                                  ),
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: HexColor("#536470"),
                                      fontSize: 14),
                                  selectedColor: Colors.red[60],
                                  shadowColor: Colors.white,
                                  selectedShadowColor: Colors.red[60],
                                  onSelected: (v) {
                                    setState(() {
                                      _selectIndex = index;
                                      _lang = seppckLangType[index].lang;
                                      _name = seppckLangType[index].name;
                                      _defaultRate = seppckLangType[index].rate;
                                      _speechPitch =
                                          seppckLangType[index].pitch;
                                      Cache.setCache("speechLang",
                                          seppckLangType[index].lang);
                                      Cache.setCache(
                                          "name", seppckLangType[index].name);
                                      Cache.setCache(
                                          "speechRate",
                                          seppckLangType[index]
                                              .rate
                                              .toString());
                                      Cache.setCache(
                                          "speechPitch",
                                          seppckLangType[index]
                                              .pitch
                                              .toString());
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 5000),
                  opacity: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Container(
                            width: 50,
                            height: 35,
                            decoration: BoxDecoration(
                              color: HexColor("F3DFE0"),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                              border:
                                  Border.all(width: 0, style: BorderStyle.none),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "语速",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Color(0xFF4A6572)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 360,
                          child: SfSlider(
                            min: 0.6,
                            max: 1.6,
                            value: _defaultRate,
                            interval: 0.2,
                            stepSize: 0.1,
                            showTicks: true,
                            activeColor: HexColor("#F3DFE0").withOpacity(0.8),
                            inactiveColor: HexColor("#F6F4FD"),
                            showLabels: true,
                            enableTooltip: true,
                            minorTicksPerInterval: 1,
                            tooltipTextFormatterCallback:
                                (dynamic actualValue, String formattedText) {
                              return _defaultRate.toStringAsFixed(1) + " x";
                            },
                            labelFormatterCallback:
                                (dynamic actualValue, String formattedText) {
                              return formattedText + ' x';
                            },
                            onChanged: (dynamic value) {
                              setState(() {
                                _defaultRate = value;
                                Cache.setCache(
                                    "speechRate", value.toStringAsFixed(2));
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 5000),
                  opacity: 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            bottom: 5,
                          ),
                          child: Container(
                            width: 50,
                            height: 35,
                            decoration: BoxDecoration(
                              color: HexColor("DAE5C8"),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                              border:
                                  Border.all(width: 0, style: BorderStyle.none),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "语调",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Color(0xFF4A6572)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            width: 360,
                            child: SfSlider(
                              min: 0.0,
                              max: 2.0,
                              value: _speechPitch,
                              interval: 0.4,
                              showTicks: true,
                              activeColor: HexColor("#DAE5C8"),
                              stepSize: 0.01,
                              inactiveColor:
                                  HexColor("#DAE5C8").withOpacity(0.2),
                              labelFormatterCallback:
                                  (dynamic actualValue, String formattedText) {
                                // if (actualValue == 0.0) {
                                //   return '低沉';
                                // } else if (actualValue == 1.8) {
                                //   return '清朗';
                                // }
                                return actualValue < 1.0 ? '低沉' : '清朗';
                              },
                              showLabels: true,
                              enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (dynamic value) {
                                setState(() {
                                  _speechPitch = value;
                                  Cache.setCache(
                                      "speechVoice", value.toStringAsFixed(2));
                                });
                              },
                            )),
                      ],
                    ),
                  ),
                )
              ]);
  }
}
