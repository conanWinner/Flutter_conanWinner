import 'package:flutter/material.dart';
import 'package:flutter_w1/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<List<String>> card = [
  ["assets/images/apple.png", "Naturel Red 1", "1kg", "4.99"],
  ["assets/images/apple.png", "Naturel Red 2", "1kg", "4.99"],
  ["assets/images/apple.png", "Naturel Red 3", "1kg", "4.99"],
];

List<List<String>> subCard = [
  ["assets/images/apple.png", "Pulses"],
  ["assets/images/apple.png", "Naturel"],
  ["assets/images/apple.png", "Rice"],
];


class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
                child: Image.asset("assets/images/icon_signin.png", height: 30)),
            Row(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                Text("Dhaka, Banassre", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),)
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10, top: 20),
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
                    );
                  },
                  suggestionsBuilder: (context, controller) => {},),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Image.asset("assets/images/top_img.png"),
            ),

            _Content(title: "Exclusive Offer", card: card, checkSubCard: false,),
            _Content(title: "Best Selling", card: card, checkSubCard: false,),
            _Content(title: "Groceries", card: card, checkSubCard: true,),

          ]
        )
      ),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>
      [
        BottomNavigationBarItem(icon: Icon(Icons.store_mall_directory_sharp, color: Colors.black,), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.manage_search_outlined, color: Colors.black), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined, color: Colors.black), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline, color: Colors.black), label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.black), label: 'Account')

      ],
        selectedItemColor: Color(0xff53B175),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  _Content({required this.title, required this.card, required this.checkSubCard});

  final String title;
  final List<List<String>> card;
  List<List<String>> subCard = [
    ["assets/images/apple.png", "Pulses"],
    ["assets/images/apple.png", "Naturel"],
    ["assets/images/apple.png", "Rice"],
  ];
  final checkSubCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
          children:
          [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                Text("See all", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff53B175))),
              ],

            ),

            checkSubCard ? Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 105,
                    child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: card.length, itemBuilder: (context, index) {
                      return Card.outlined(child: _SubCard(image: subCard[index][0], cardName: subCard[index][1]));
                    },
                    )
                ),

                Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 250,
                    child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: card.length, itemBuilder: (context, index) {
                      return Card.outlined(child: _SampleCard(image: card[index][0], quality: card[index][2], cardName: card[index][1], price: card[index][3],));

                    },
                    )
                ),
              ],
            ): Container(
                margin: EdgeInsets.only(top: 20),
                height: 250,
                child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: card.length, itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailPage()),
                      )
                    },
                    child: Card.outlined(child: _SampleCard(image: card[index][0], quality: card[index][2], cardName: card[index][1], price: card[index][3],))
                  );
                },
                )
            ),

          ]
      ),
    );
  }
}


class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.image, required this.cardName,  required this.quality, required this.price});
  final String image;
  final String cardName;
  final String quality;
  final String price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 174, height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Container(margin: EdgeInsets.only(left: 30, top: 30),child: Image.asset(image, width: 104,)),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cardName, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                  Text(quality, style: TextStyle(fontWeight: FontWeight.w100, fontSize: 14, color: Color(0xff7C7C7C)))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$${price}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff53B175),
                      borderRadius: BorderRadius.circular(18),
                    ),
                      height: 46,
                      width: 46,
                      // color: ,
                      child: Icon(Icons.add, color: Colors.white, size: 40,))
                ]
              ),
            )
          ],
        )




        );
  }

}

class _SubCard extends StatelessWidget {
  const _SubCard({required this.image, required this.cardName});
  final String image;
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 250, height: 105,
        child: Row(
          children: [
            Container(margin: EdgeInsets.only( right: 10), child: Image.asset(image, height: 72,)),
            Text(cardName, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Color(0xff3E423F)),)
          ],
        )
    );
  }
}



