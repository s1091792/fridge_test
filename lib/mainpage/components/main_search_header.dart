import 'package:flutter/material.dart';
import 'package:flutter_app_test/colors.dart';

class HeaderWithSearchBOx extends StatelessWidget {
  const HeaderWithSearchBOx({Key? key, required this.size, required this.imagepath, required this.otherpage}) : super(key: key);

  final Size size;
  final String imagepath;
  final Function() otherpage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: kDefaultPadding,),
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  //外部間距
                  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  //外部間距
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  width: size.width / 1.4,
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
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "Search",
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
                      Image.asset('assets/icons/search.png'),
                    ],
                  ),
                ),
                Expanded(
                  child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: IconButton(
                          onPressed: otherpage,
                          icon: Image.asset(imagepath))),
                ),
              ],
            ),
            //foodmanager(),
          ],
        ),
    );
  }
}
