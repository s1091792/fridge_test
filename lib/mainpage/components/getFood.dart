import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/mainpage/foodmanager/main_foods_pic.dart';

//get留言的stream
StreamBuilder<QuerySnapshot> getFood() {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('food')
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData)
        return Center(
          child: CircularProgressIndicator(),
        );
      final int commentCount = snapshot.data!.docs.length;
      // snapshot.data.documents
      //     .sort((a, b) => b.data['time'].compareTo(a.data['time']));  //排序留言的時間
      if (commentCount > 0) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: commentCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data!.docs[index];
            return seven_food_pic(     //回傳留言給commentWidget 創新的留言顯示出來
              document['food_name'],
              document['EXP'],
              document['amount'],
              document['image'],
            );
          },
        );
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

//建一個新的留言在firestore裡
void createRecord(String food_name, var EXP, int amount, String image) async {
  await FirebaseFirestore.instance.collection("food").doc().set({
    'food_name': food_name,
    'EXP': EXP,
    'number': amount,
    'image': image,
  });
}
