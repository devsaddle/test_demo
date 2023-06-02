import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Popver extends StatefulWidget {
  const Popver({super.key});

  @override
  State<Popver> createState() => _PopverState();
}

class _PopverState extends State<Popver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popver"),
      ),
      body: Center(
        child: Container(
            child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showPopover(context, _contentWidget());
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text("Show Comments")),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "半屏弹窗的显示：\n · 第一个弹窗正常显示，弹窗外部空间有半透明黑色遮罩 \n · 第二个弹窗在第一个弹窗基础上覆盖显示，需要额外处理遮罩区域。\n如果像第一个弹窗那样显示半透明黑色遮罩的话，在显示层面会显示成两个遮罩叠加，此时颜色会加深，效果不太好 \n所以此处第二个弹窗会将外部区域颜色设置成全透明色",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget _contentWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: SafeArea(
          top: false,
          bottom: true,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(minHeight: 64),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.only(
                                  left: 20, top: 20, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Comments",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Container(),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 350,
                  color: Colors.white,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundImage: NetworkImage(
                                      'https://cdn.pixabay.com/photo/2018/03/31/06/31/dog-3277416_1280.jpg'),
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tim Cook",
                                      style: TextStyle(
                                          fontSize: 15,
                                          decoration: TextDecoration.none,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "10h ago",
                                      style: TextStyle(
                                          fontSize: 10,
                                          decoration: TextDecoration.none,
                                          color: Colors.black26),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              "At Apple, we believe technology should be designed to help everyone do what they love. We’re excited to preview new accessibility features to help even more people follow their dreams.",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Icon(Icons.favorite_border_outlined),
                                ),
                                GestureDetector(
                                  child: Icon(Icons.thumb_down_alt_outlined),
                                ),
                                GestureDetector(
                                  child:
                                      Icon(Icons.chat_bubble_outline_outlined),
                                ),
                                GestureDetector(
                                  child: Icon(Icons.more_horiz_outlined),
                                  onTap: () {
                                    showPopover(context, _reportWidget(),
                                        barrierColor: Colors.transparent);
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        color: Colors.black12,
                        height: 1,
                      );
                    },
                    itemCount: 2,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _reportWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: SafeArea(
              top: false,
              bottom: true,
              child: Container(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        constraints: BoxConstraints(minHeight: 64),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CupertinoButton(
                              padding: EdgeInsets.only(top: 20),
                              child: Icon(
                                Icons.close,
                                size: 30,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(height: 12),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Report",
                                style: TextStyle(
                                    fontSize: 18,
                                    decoration: TextDecoration.none,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        color: Colors.black12,
                        height: 2,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                      Container(
                        height: 350,
                        color: Colors.white,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Under age",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        decoration: TextDecoration.none,
                                        color: Colors.black),
                                  )),
                            );
                          },
                          itemCount: 8,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 12),
                        ),
                      ),
                    ]),
              ))),
    );
  }

  Future<T?> showPopover<T>(BuildContext context, Widget child,
      {RouteSettings? routeSettings,
      bool barrierDismissible = true,
      Color barrierColor = kCupertinoModalBarrierColor}) {
    return showCupertinoModalPopup<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      routeSettings: routeSettings,
      barrierColor: barrierColor,
      builder: (context) => Dismissible(
        direction: DismissDirection.down,
        onDismissed: (direction) => Navigator.pop(context),
        key: Key(''),
        child: child,
      ),
    );
  }
}
