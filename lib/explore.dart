import 'dart:math';

import 'package:flutter/material.dart';

List<List<String>> categories = [
  ["assets/images/vegetable.png", "Frash Fruits & Vegetable"],
  ["assets/images/vegetable.png", "Frash Fruits & Vegetable"],
  ["assets/images/vegetable.png", "Frash Fruits & Vegetable"],
  ["assets/images/vegetable.png", "Frash Fruits & Vegetable"],
  ["assets/images/vegetable.png", "Frash Fruits & Vegetable"],
  ["assets/images/vegetable.png", "Frash Fruits & Vegetable"],
  ["assets/images/vegetable.png", "Frash Fruits & Vegetable"],
  ["assets/images/vegetable.png", "Frash Fruits & Vegetable"],
];

List<int> colors = [
  0xff53B175, 0xffF8A44C, 0xffF7A593, 0xffD3B0E0, 0xffFDE598, 0xffB7DFF5, 0xff836AF6, 0xffD73B77
];

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox.shrink(),
        title: Text(
          "Find Products",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 0, top: 20, right: 20, left: 20),
              child: SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
                  return SearchBar(
                    controller: controller,
                    padding: const WidgetStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    leading: const Icon(Icons.search),
                    hintText: "Search Store",
                    elevation: WidgetStatePropertyAll(4),
                  );
                },
                suggestionsBuilder: (context, controller) => {},
              ),
            ),

            Expanded(
              child: GridView.custom(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.9, crossAxisSpacing: 4, mainAxisSpacing: 4  ),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _Card(color: colors[random.nextInt(colors.length)], img: categories[index][0], cardName: categories[index][1]);
                  },
                  childCount: categories.length,
                ),
                padding: EdgeInsets.all(20),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.color, required this.img, required this.cardName});
  final int color;
  final String img;
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: _SampleCard(img: img, cardName: cardName),
      color: Color(color).withOpacity(0.25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Color(color).withOpacity(1), width: 1),
      ),
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.img, required this.cardName});
  final String img;
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(img, height: 60),
          Text(
            cardName,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
