
import 'dart:async';
import 'package:financer_hengchang/cycle_banner_flie/banner_model.dart';
import 'package:flutter/material.dart';


typedef void OnTapBannerItem(BannerModel model);

class Carousel extends StatefulWidget {
  final List <BannerModel> banners;
  final OnTapBannerItem onTap;

  final Color indicatorNormalColor; // 指示器球的正常颜色
  final Color indifcatorCurremtColor;// 指示器球的当前颜色

  final double indicatorWidth;// 指示器球的宽高
  final double indicatorMargin;// 指示器球之间间距

  final bool hiddenIndicator;// 是否影藏指示器
  final bool hiddenIndicatorForSingle;// 单个图片是否影藏指示器

  final bool autoScroll;// 是否循环
  final int seconds;// 轮播间隔

  Carousel(
      {Key key,
        @required this.banners,
        @required this.onTap,
        this.seconds = 3,
        this.autoScroll = true,
        this.hiddenIndicator = false,
        this.hiddenIndicatorForSingle = true,
        this.indicatorMargin = 1.5,
        this.indicatorWidth  = 6,
        this.indifcatorCurremtColor = Colors.white,
        this.indicatorNormalColor = Colors.grey
       }):super(key:key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  int _currentIndex = 1;
  PageController controller = PageController(initialPage: 1, viewportFraction: 1);
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.banners.length == 0)return;
    controller = PageController(initialPage: 1);
    if(widget.autoScroll && widget.banners.length > 1) {
        _setTimer();
      }
  }

  _setTimer(){
    _timer = Timer.periodic(Duration(seconds: widget.seconds), (timer) { //自动滚动
      controller.animateToPage(_currentIndex+1,
        duration: Duration(milliseconds: 300),
      curve: Curves.linear,);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {

    List<BannerModel>_list = List();
    if(widget.banners.length>0){
      _list..add(widget.banners[widget.banners.length-1])..addAll(widget.banners)..add(widget.banners[0]);
    }

    return widget.banners.length > 0
        ? Container(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                NotificationListener(
                  child: _pageView(_list),
                  onNotification: (ScrollNotification notification) {
                    if (widget.autoScroll && widget.banners.length > 1) {
                      if (notification.depth == 0 &&
                          notification is ScrollStartNotification) {
                        if (notification.dragDetails != null) {
                          _timer.cancel();
                        }
                      } else if (notification is ScrollEndNotification) {
                        _timer.cancel();
                        _setTimer();
                      }
                    }
                  },
                ),
                //下面小点
                _showIndicator() ? _buildIndicator() : Container(),
              ],
            ),
          )
        : Container();
  }


  //判断pageView是否可以滚动
  _isCanScroll(){
    if(widget.banners.length == 0 || widget.banners.length == 1) return false;
    return true;
  }

   //判断是否显示指示器
  _showIndicator(){
    if(widget.banners.length == 0) return false;
    if(widget.hiddenIndicator) return false;
    if(widget.banners.length == 1 && widget.hiddenIndicatorForSingle) return false;
    return true;
  }

  //创建指示器
  Widget _buildIndicator() {
    return Positioned(
      bottom: 15.0,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.banners
            .asMap()
            .map(
              (key, value) => MapEntry(
                key,
                Container(
                  width: widget.indicatorWidth,
                  height: widget.indicatorWidth,
                  margin:  EdgeInsets.only(left: 2.0,right: 2.0),
                  decoration: ShapeDecoration(
                    color: _currentIndex == key + 1
                        ? widget.indifcatorCurremtColor
                        : widget.indicatorNormalColor,
                    shape: CircleBorder(),
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }

  //创建轮播View
  Widget _pageView(List _list){

    return PageView(
      controller: controller,
      onPageChanged:(page){
        int newIndex;
        if(page == _list.length - 1){
          newIndex = 1;
          controller.jumpToPage(newIndex);
        }else if(page == 0){
          newIndex = _list.length -2;
          controller.jumpToPage(newIndex);
        }else{
          newIndex = page;
        }

        setState(() {
          _currentIndex = newIndex;
        });
      },
      children: _list.map((model) => _buildItem(model)).toList(),
      physics: _isCanScroll() ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),

    );
  }


  Widget _buildItem(BannerModel model){

    Image image = Image.asset(model.image,fit: BoxFit.cover,);
    if(model.url != null) image = Image.network(model.url,fit: BoxFit.cover,);

    return GestureDetector(
      onTap: (){
        if(widget.onTap != null){
          widget.onTap(model);
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          image,
        ],
      ),
    );
  }






}
