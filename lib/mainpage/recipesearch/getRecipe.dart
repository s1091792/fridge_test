import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/mainpage/recipesearch/title_with_text.dart';
import 'package:flutter_app_test/mainpage/components/main_category.dart';
import 'dart:core';
import 'package:intl/intl.dart';



List<Map<String, dynamic>> recipeData = []; // 食譜的 List


StreamBuilder<QuerySnapshot> getRecipe() {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('recipe')
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData)
        return Center(
          child: CircularProgressIndicator(),
        );
      final int recipeCount = snapshot.data!.docs.length;

      // // 獲取當前時間
      // DateTime currentDate = DateTime.now();
      // // 計算七天後的日期
      // DateTime sevenDaysLater = currentDate.add(Duration(days: 7));
      // print('七天後的日期：$sevenDaysLater');


      // 將留言資料保存到 commentsData 中
      recipeData = snapshot.data!.docs.map((document) {

        // // DateTime foodDate = DateTime.parse(document['date']);
        // Timestamp timestamp = document['EXP'] as Timestamp;
        // DateTime expDate = timestamp.toDate();

        // if (expDate.isBefore(sevenDaysLater) == true){
        //   // print("有抓到");
        //   String formattedDate = DateFormat('yyyy-MM-dd').format(expDate);
        //   return {
        //     'title': document['food_name'] as String,
        //     'date':  formattedDate,
        //     'number': document['amount'] as int,
        //     'image': document['image'] as String,
        //   };
        // } else {
        //   print("沒有抓到7日內到期");
        //   return null;
        // }

        return {
          'title': document['recipe_name'] as String,
          'text': document['ingre_name'] as String,
          'imagepath': document['image'] as String,
          'step': document['context'] as String,
        };


      // }).whereType<Map<String, dynamic>>().toList();
      }).toList();
      print(recipeData);

      if (recipeCount > 0) {
        // 這裡不再回傳 Widget，只回傳一個空的 Container
        return Container();
      } else {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          alignment: Alignment.center,
          child: Text(
            'no recipe...',
            style: TextStyle(fontSize: 20),
          ),
        );
      }
    },
  );
}


