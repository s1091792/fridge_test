import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/mainpage/foodmanager/main_foods_pic.dart';
import 'main_category.dart';
import 'dart:core';
import 'package:intl/intl.dart';


  // Future<List<Map<String, dynamic>>> fetchData() async {
List<Map<String, dynamic>> commentsData1 = []; // 即將到期的 List
List<Map<String, dynamic>> commentsData7 = []; // 七天後到期的list
List<Map<String, dynamic>> commentsData30 = []; // 一個月後到期的list
// List<Map<String, dynamic>> commentsData = []; // 即將到期的 List


//即將到期 0-7天
StreamBuilder<QuerySnapshot> getFood1() {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('food')
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData)
        return Center(
          child: CircularProgressIndicator(),
        );
      final int commentCount1 = snapshot.data!.docs.length;

      // 獲取當前時間
      DateTime currentDate = DateTime.now();
      // 計算七天後的日期
      DateTime sevenDaysLater = currentDate.add(Duration(days: 7));
      print('七天後的日期：$sevenDaysLater');


      // 將留言資料保存到 commentsData 中
      commentsData1 = snapshot.data!.docs.map((document) {

        // DateTime foodDate = DateTime.parse(document['date']);
        Timestamp timestamp = document['EXP'] as Timestamp;
        DateTime expDate = timestamp.toDate();

        if (expDate.isBefore(sevenDaysLater) == true){
          // print("有抓到");
          String formattedDate = DateFormat('yyyy-MM-dd').format(expDate);
          return {
            'title': document['food_name'] as String,
            'date':  formattedDate,
            'number': document['amount'] as int,
            'image': document['image'] as String,
          };
        } else {
          print("沒有抓到即將到期");
          return null;
        }
        // };


      }).whereType<Map<String, dynamic>>().toList();
      print(commentsData1);

      if (commentCount1 > 0) {
        // 這裡不再回傳 Widget，只回傳一個空的 Container
        return Container();
      } else {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          alignment: Alignment.center,
          child: Text(
            'no food...',
            style: TextStyle(fontSize: 20),
          ),
        );
      }
    },
  );
}


//七天後到期 8-14天
StreamBuilder<QuerySnapshot> getFood7() {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('food')
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData)
        return Center(
          child: CircularProgressIndicator(),
        );
      final int commentCount7 = snapshot.data!.docs.length;

      // 獲取當前時間
      DateTime currentDate = DateTime.now();
      // 計算七天後的日期
      DateTime eightDaysLater = currentDate.add(Duration(days: 8));
      DateTime forteenDaysLater = currentDate.add(Duration(days: 14));
      print('8天後的日期：$eightDaysLater，14天後：$forteenDaysLater');


      // 將留言資料保存到 commentsData 中
      commentsData7 = snapshot.data!.docs.map((document) {

        // DateTime foodDate = DateTime.parse(document['date']);
        Timestamp timestamp = document['EXP'] as Timestamp;
        DateTime expDate = timestamp.toDate();


        // for (var comment in commentsData7){
        //   bool isInSevenDays = expDate.isBefore(sevenDaysLater);
          if (expDate.isAfter(eightDaysLater) == true && expDate.isBefore(forteenDaysLater) == true){
            // print("有抓到");
            String formattedDate = DateFormat('yyyy-MM-dd').format(expDate);
            return {
              'title': document['food_name'] as String,
              // 'date': document['EXP'] as String,
              'date':  formattedDate,
              'number': document['amount'] as int,
              'image': document['image'] as String,
            };
          } else {
            print("沒有抓到七天後到期");
            return null;
          }
        // };


      }).whereType<Map<String, dynamic>>().toList();
      print(commentsData7);

      if (commentCount7 > 0) {
        // 這裡不再回傳 Widget，只回傳一個空的 Container
        return Container();
      } else {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          alignment: Alignment.center,
          child: Text(
            'no food...',
            style: TextStyle(fontSize: 20),
          ),
        );
      }
    },
  );
}


//一個月後到期 30天
StreamBuilder<QuerySnapshot> getFood30() {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('food')
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData)
        return Center(
          child: CircularProgressIndicator(),
        );
      final int commentCount30 = snapshot.data!.docs.length;

      // 獲取當前時間
      DateTime currentDate = DateTime.now();
      // 計算七天後的日期
      DateTime fifteenDaysLater = currentDate.add(Duration(days: 15));
      print('15天後：$fifteenDaysLater');


      // 將留言資料保存到 commentsData 中
      commentsData30 = snapshot.data!.docs.map((document) {

        // DateTime foodDate = DateTime.parse(document['date']);
        Timestamp timestamp = document['EXP'] as Timestamp;
        DateTime expDate = timestamp.toDate();


        // for (var comment in commentsData7){
        //   bool isInSevenDays = expDate.isBefore(sevenDaysLater);
        if (expDate.isAfter(fifteenDaysLater) == true){
          // print("有抓到");
          String formattedDate = DateFormat('yyyy-MM-dd').format(expDate);
          return {
            'title': document['food_name'] as String,
            // 'date': document['EXP'] as String,
            'date':  formattedDate,
            'number': document['amount'] as int,
            'image': document['image'] as String,
          };
        } else {
          print("沒有抓到一個月後到期");
          return null;
        }
        // };


      }).whereType<Map<String, dynamic>>().toList();
      print(commentsData30);

      if (commentCount30 > 0) {
        // 這裡不再回傳 Widget，只回傳一個空的 Container
        return Container();
      } else {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          alignment: Alignment.center,
          child: Text(
            'no food...',
            style: TextStyle(fontSize: 20),
          ),
        );
      }
    },
  );
}




//   // 然後在 getComments 方法中，將留言資料保存到 commentsData 中
//   StreamBuilder<QuerySnapshot> getFood() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('food')
//           .snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData)
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         final int commentCount = snapshot.data!.docs.length;
//         // snapshot.data.documents
//         //     .sort((a, b) => b.data['time'].compareTo(a.data['time']));  //排序時間
//
//
//         // 將留言資料保存到 commentsData 中
//         commentsData = snapshot.data!.docs.map((document) {
//           return {
//             'title': document['food_name'] as String,
//             'date': document['EXP'] as String,
//             'number': document['amount'] as int,
//             'image': document['image'] as String,
//           };
//         }).toList();
//         print(commentsData);
//
//         if (commentCount > 0) {
//           // 這裡不再回傳 Widget，只回傳一個空的 Container
//           return Container();
//         } else {
//           return Container(
//             padding: EdgeInsets.symmetric(vertical: 10.0),
//             alignment: Alignment.center,
//             child: Text(
//               'no food...',
//               style: TextStyle(fontSize: 20),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
