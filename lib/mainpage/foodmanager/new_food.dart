import 'package:flutter/material.dart';
import 'package:flutter_app_test/colors.dart';

class Todo {
  //還有到期日
  //final String date;
  //final String url;//圖片
  final String title;
  final int number;

  const Todo(this.title, this.number, );
}

class NewFood extends StatefulWidget {
  const NewFood({Key? key}) : super(key: key);

  @override
  State<NewFood> createState() => _NewFoodState();
}

class _NewFoodState extends State<NewFood> {
  final controller = TextEditingController();
  int count = 0;
  void incrementCounter() {
    setState(() {
      count++;
    });
  }

  void decrementCounter() {
    setState(() {
      count--;
    });
  }
  @override
  void inidState() {
    super.initState();

  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    print('新增食材的dispose方法');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false, //不讓畫面因為鍵盤超出頁面
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Image.asset("assets/icons/back.png"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            '新增食材',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        //主要新增的地方
        body: Container(
          margin: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 100,
                width: 100,
                color: kPrimaryColor.withOpacity(0.23),
                //新增照片
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/plus.png',
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                //外部間距
                //margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                //外部間距
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xFFE9EEF1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    ),
                  ],
                ),
                //名字
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    controller: controller,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "名稱：",
                      hintStyle: TextStyle(
                        color: kPrimaryColor.withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      // surffix isn't working properly  with SVG
                      // thats why we use row
                      // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor.withOpacity(0.23),
                        textStyle: TextStyle(fontSize: 30.0),
                      ),
                      onPressed: () => {
                        decrementCounter(),
                      },
                      child: Text("-"),
                    ),
                    Container(
                      width: 150,
                      child: Text(
                        "$count",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor.withOpacity(0.23),
                        textStyle: TextStyle(fontSize: 30.0),
                      ),
                      onPressed: () => {
                        incrementCounter(),
                      },
                      child: Text("+"),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      textStyle: TextStyle(fontSize: 30.0),
                    ),
                    onPressed: () => {Navigator.pop(context)},
                    child: Text("取消"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      textStyle: TextStyle(fontSize: 30.0),
                    ),
                    onPressed: () => {
                    Navigator.of(context, rootNavigator: true)
                        .pop(controller.text,),
                      controller.clear(),
                    },
                    child: Text("確認"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}