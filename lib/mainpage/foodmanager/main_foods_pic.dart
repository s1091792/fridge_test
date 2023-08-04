import 'package:flutter/material.dart';
import 'package:flutter_app_test/colors.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget seven_food_pic(String food_name, String EXP, int amount, String image) {
  // DateTime myDate = date;// 這裡放入您的 DateTime 物件

  return Container(
    width: double.maxFinite,
    height:182,
    child: ListView.builder(
        itemCount: food_name.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin:const EdgeInsets.only(left: kDefaultPadding-5,top: 10),
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              /*image: DecorationImage(
                  image: new NetworkImage(
                    widget.image[index],
                  ),
                  fit: BoxFit.cover,
                ),*/
            ),
            child:Column(
              children: <Widget>[
                FadeInImage.assetNetwork(
                  height: 130,
                  image: image,
                  placeholder: 'assets/images/icecofe.png',
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow:[
                      BoxShadow(
                        offset: Offset(0,10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.23),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      RichText(                        //顯示title和date
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: food_name,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            TextSpan(
                              text: EXP,
                              style: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(            //顯示數量
                        'amount',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          );
        }),
  );
}