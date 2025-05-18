import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _count = 1;
  bool heart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2F3F2),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new), // Icon mũi tên quay lại
          onPressed: () {
            Navigator.pop(context); // Hành động quay lại màn hình trước
          },
        ),
        
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              color: Color(0xffF2F3F2),
              padding: EdgeInsets.only(bottom: 20, top: 20),
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/apple_home.png",
                height: 200,
                width: 320,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Naturel Red Apple",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "1kg, Price",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff7C7C7C),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        heart = !heart;
                      });
                    },
                    child: Image.asset(
                      "assets/images/heart.png",
                      height: 24,
                      width: 24,
                      color: heart ? Colors.red : Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _count > 1 ? _count-- : _count;
                          });
                        },
                        child: Text(
                          "-",
                          style: TextStyle(
                            fontSize: 30,
                            color: _count == 1 ? Color(0xffB3B3B3) : Color(0xff53B175),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          border: Border.all(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                          child: Text(
                            _count.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _count < 5 ? _count++ : _count;
                          });
                        },
                        child: Text(
                          "+",
                          style: TextStyle(
                            fontSize: 30,
                            color: _count == 5 ? Color(0xffB3B3B3) : Color(0xff53B175),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "\$4.99",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                  ),
                ],
              ),
            ),

            Container(
              height: 1.0, // Độ dày của đường kẻ
              color: Color(0xffE2E2E2), // Màu sắc của đường kẻ
              margin: EdgeInsets.symmetric(
                vertical: 10.0, horizontal: 30
              ), // Khoảng cách trên và dưới
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Detail",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Image.asset("assets/images/show.png", height: 10),
                    ],
                  ),
                  Text(
                    "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
                    style: TextStyle(fontSize: 13, color: Color(0xff7C7C7C), fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),

            Container(
              height: 1.0, // Độ dày của đường kẻ
              color: Color(0xffE2E2E2), // Màu sắc của đường kẻ
              margin: EdgeInsets.symmetric(
                vertical: 10.0, horizontal: 30
              ), // Khoảng cách trên và dưới
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nutritions",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.all(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 6,
                            right: 6,
                            top: 3,
                            bottom: 3,
                          ),
                          child: Text("100gr"),
                        ),
                      ),
                      Image.asset("assets/images/right.png", height: 18),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              height: 1.0,
              color: Color(0xffE2E2E2),
              margin: EdgeInsets.symmetric(
                vertical: 10.0, horizontal: 30
              ), // Khoảng cách trên và dưới
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Review",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            // Thêm khoảng cách giữa các hình (tùy chọn)
                            child: Image.asset(
                              "assets/images/star.png",
                              height: 16,
                            ),
                          );
                        }),
                      ),
                      Image.asset("assets/images/right.png", height: 18),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF53B175),
                ),
                onPressed: () => {},
                child: Text(
                  "Add To Basket",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
