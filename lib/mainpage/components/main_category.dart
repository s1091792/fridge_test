import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/colors.dart';
import 'package:flutter_app_test/mainpage/foodmanager/foodstitle_with_more_btn.dart';
import 'package:flutter_app_test/mainpage/foodmanager/main_foods_pic.dart';

import '../foodmanager/new_food.dart';
import '../recipesearch/title_with_text.dart';
import 'main_search_header.dart';
import 'getFood.dart';


class foodmanager extends StatefulWidget {
  const foodmanager({Key? key}) : super(key: key);

  @override
  State<foodmanager> createState() => _foodmanagerState();
}

List<dynamic> allData = []; // 儲存所有抓取到的資料的陣列

//食材管理
class _foodmanagerState extends State<foodmanager> {
  String text = "尚未接收資料";

  //////
  @override
  void initState() {
    super.initState();
    // fetchData(); // 在初始化時開始抓取資料
  }

  //////

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    //////
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('food').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('發生錯誤: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('載入中...');
          }

          // 獲取所有文件的列表
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          //////

          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                  HeaderWithSearchBOx(
                  size: size,
                  imagepath: 'assets/icons/plus.png',
                  otherpage: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewFood(),
                      ),

                    );
                    //從 B 畫面回傳後更新畫面資料
                    setState(() {
                      print(result);
                      if (result != null) {
                        text = result;
                      } else {
                        print("新增食材沒有回傳訊息");
                      }
                    });
                  },
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),

                Column(
                    children: <Widget>[
                      TitleWithMorebtn(title: "即將到期", press: () {}),
                      getFood1(),
                      seven_food_pic(
                        title: commentsData1.map((comment) => comment['title'] as String).toList(),
                        date: commentsData1.map((comment) => comment['date'] as String).toList(),
                        number: commentsData1.map((comment) => comment['number'] as int).toList(),
                        press: () {},
                        image: commentsData1.map((comment) => comment['image'] as String).toList(),
                      )


          ],
          ),



          SizedBox(
          height: kDefaultPadding / 2,
          ),

                    Column(
                      children: <Widget>[
                        TitleWithMorebtn(title: "七天後到期", press: () {}),
                        getFood7(),
                        seven_food_pic(
                          title: commentsData7.map((comment) => comment['title'] as String).toList(),
                          date: commentsData7.map((comment) => comment['date'] as String).toList(),
                          number: commentsData7.map((comment) => comment['number'] as int).toList(),
                          press: () {},
                          image: commentsData7.map((comment) => comment['image'] as String).toList(),
                        )


                      ],
                    ),

          SizedBox(
          height: kDefaultPadding / 2,
          ),
                    Column(
                      children: <Widget>[
                        TitleWithMorebtn(title: "一個月後到期", press: () {}),
                        getFood30(),
                        seven_food_pic(
                          title: commentsData30.map((comment) => comment['title'] as String).toList(),
                          date: commentsData30.map((comment) => comment['date'] as String).toList(),
                          number: commentsData30.map((comment) => comment['number'] as int).toList(),
                          press: () {},
                          image: commentsData30.map((comment) => comment['image'] as String).toList(),
                        )


                      ],
                    ),
          SizedBox(
          height: kDefaultPadding / 2,
          ),
          //seven_food_pic(),
          ],
          ),
          ),
          );
        }
    );
  }
}

//食譜查詢
class recipesearch extends StatefulWidget {
  const recipesearch({Key? key}) : super(key: key);

  @override
  State<recipesearch> createState() => _recipesearchState();
}

class _recipesearchState extends State<recipesearch> {
  int a=1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBOx(
            size: size,
            imagepath: 'assets/icons/filter.png',
            otherpage: () {},
          ),
          Container(
            width: size.width,
            margin: const EdgeInsets.only(left: kDefaultPadding),
            child: Text(
              "推薦食譜",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          recipe_title_text(
            size: size,
            title: [
              "香蒜奶油培根義大利麵",
              "剝皮辣椒雞湯",
              "玉米濃湯",
              "小雞燉蘑菇",
            ],
            text: [
              "蒜頭、培根、蘑菇、鮮奶油、義大利麵、黑胡椒、雞蛋",
              "薑、雞腿肉、剝皮辣椒罐頭、蛤蜊、米酒",
              "玉米、鮮奶、雞蛋、紅蘿蔔",
              "雞翅、菇類、薑、八角、鹽、料理酒、乾香菇、大蔥、乾辣椒、醬油、糖、油",
            ],
            imagepath: [
              "https://i.im.ge/2023/05/14/URFbIT.image.png",
              "https://i.im.ge/2023/05/14/URFE5r.image.png",
              "https://i.im.ge/2023/05/14/URFwEq.image.png",
              "https://i.im.ge/2023/05/14/URFVrJ.image.png",
            ],
            step: [
              "把全部食材丟進鍋裡",
              "把剝皮辣椒罐頭倒進鍋裡",
              "把火腿切成丁",
              "把小雞脫毛",
            ],
            press: () {},
          ),
        ],
      ),
    );
  }
}

class shoppinglist extends StatefulWidget {
  const shoppinglist({
    Key? key,
  }) : super(key: key);

  @override
  State<shoppinglist> createState() => _shoppinglistState();
}

class _shoppinglistState extends State<shoppinglist> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return const list_checkbox();
  }
}

class list_checkbox extends StatefulWidget {
  const list_checkbox({
    super.key,
  });

  @override
  State<list_checkbox> createState() => _list_checkboxState();
}

class _list_checkboxState extends State<list_checkbox> {
  int a=1;
  TextEditingController? controller;
  TextEditingController? lablecontroller;
  String name = '';
  List<Map> categories = [
    {"title": "蘋果", "isChecked": false},
    {"title": "番茄", "isChecked": false},
    {"title": "柳橙", "isChecked": false},
    {"title": "牛奶", "isChecked": false},
    {"title": "水壺", "isChecked": false},
    {"title": "礦泉水", "isChecked": false},
    {"title": "喇叭", "isChecked": false},
    {"title": "泡麵", "isChecked": false},
    {"title": "餅乾", "isChecked": false},
    {"title": "糖果", "isChecked": false},
    {"title": "奇異果", "isChecked": false},
  ];
  @override
  void inidState() {
    super.initState();
    controller = TextEditingController(text: "默認值");
    lablecontroller = TextEditingController(text: "默認值");
  }

  @override
  void dispose() {
    controller?.dispose();
    lablecontroller?.dispose();
    super.dispose();
    print('購物清單的dispose方法');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(name),
          CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: IconButton(
                  onPressed: () async {
                    final name = await openDialog(context);
                    if (name == null || name.isEmpty) return;
                    setState(() => this.name = name);
                  },
                  icon: Image.asset("assets/icons/plus.png"))),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: categories.map((favorite) {
                return Dismissible(
                  background: Container(
                    color: Colors.red,
                  ),
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    setState(() {
                      categories.remove(favorite);
                    });
                  },
                  child: CheckboxListTile(
                      title: Text(
                        favorite['title'],
                        style: TextStyle(fontSize: 25),
                      ),
                      activeColor: kPrimaryColor,
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      value: favorite['isChecked'],
                      onChanged: (val) {
                        setState(() {
                          favorite['isChecked'] = val;
                        });
                      }),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> openDialog(BuildContext context) => showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("新增物品"),
      content: Column(
        children: [
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: '名稱：',
              labelText: 'name',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            controller: controller,
            onSubmitted: (_) => submit(),
            onChanged: (text) {
              print('First text field: $text');
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: '數量：',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            controller: lablecontroller,
            onSubmitted: (_) => submit(),
            onChanged: (text) {
              print('First text field: $text');
            },
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              controller?.clear();
            },
            child: Text("取消")),
        TextButton(onPressed: submit, child: Text("新增")),
      ],
    ),
  );
  void submit() {
    Navigator.of(context, rootNavigator: true)
        .pop([controller!.text, lablecontroller!.text]);
    controller?.clear();
  }
}
