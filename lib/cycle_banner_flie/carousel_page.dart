import 'package:flutter/material.dart';
import 'banner_model.dart';
import 'carousel_widget.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {


  var model  = BannerModel(null,image: 'images/LYE10.jpg');
  var model1 = BannerModel(null,image: 'images/LYE12.jpg');
  var model2 = BannerModel(null,image: 'images/LYE6.jpg');
  var model3 = BannerModel(null,image: 'images/LYE15.jpg');

  List<BannerModel> banners = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    banners..add(model)..add(model1)..add(model2)..add(model3);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("轮播图"),),
      body: Center(
        child: Column(
          children: <Widget>[

            SizedBox(height: 100,),

            Container(
//              width: double.maxFinite,
//              height: 300,
              width: MediaQuery.of(context).size.width-30,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(5.0),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.black54,
                       offset: Offset(2.0,2.0),
                       blurRadius: 4.0,
                     ),
                   ],
              ),
              child:Carousel(
                banners: banners,
                onTap: (model){
                  print(model.image);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
