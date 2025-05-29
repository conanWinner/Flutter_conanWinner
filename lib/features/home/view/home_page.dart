import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/core/core.dart';
import 'package:flutter_w1/data/models/Product.dart';
import 'package:flutter_w1/features/detail/cubit/detail_cubit.dart';
import 'package:flutter_w1/features/detail/view/detail_page.dart';

import '../cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                constraints: BoxConstraints.expand(),
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 5),
                      child: Image.asset(
                        "assets/images/icon_signin.png",
                        height: 30,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on),
                        Text(
                          "Dhaka, Banassre",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xff4C4F4D),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 0,
                        top: 20,
                        right: 20,
                        left: 20,
                      ),
                      child: SearchAnchor(
                        builder: (
                          BuildContext context,
                          SearchController controller,
                        ) {
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

                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is HomeLoaded) {
                          return Expanded(
                            child: ListView(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  child: Image.asset(
                                    "assets/images/top_img.png",
                                  ),
                                ),

                                _Content(
                                  title: "Exclusive Offer",
                                  card: state.card,
                                  checkSubCard: false,
                                  subCard: state.subCard,
                                ),

                                _Content(
                                  title: "Best Selling",
                                  card: state.card,
                                  checkSubCard: false,
                                  subCard: state.subCard,
                                ),

                                _Content(
                                  title: "Groceries",
                                  card: state.card,
                                  checkSubCard: true,
                                  subCard: state.subCard,
                                ),
                              ],
                            ),
                          );
                        }

                        return Container();
                      },
                    ),
                  ],
                ),
              ),

              state is HomeLoading ? LoadingOverlay() : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  _Content({
    required this.title,
    required this.card,
    required this.checkSubCard,
    required this.subCard,
  });

  final String title;
  final List<Product> card;
  final bool checkSubCard;
  final List<Product> subCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff181725),
                ),
              ),
              Text(
                "See all",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff53B175),
                ),
              ),
            ],
          ),

          checkSubCard
              ? Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 105,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: card.length,
                      itemBuilder: (context, index) {
                        return Card.outlined(
                          child: _SubCard(
                            image: subCard[index].image,
                            cardName: subCard[index].cardName,
                          ),
                        );
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: card.length,
                      itemBuilder: (context, index) {
                        return Card.outlined(
                          color: Colors.white,
                          child: _SampleCard(
                            image: card[index].image,
                            weight: card[index].weight ?? '',
                            cardName: card[index].cardName,
                            price: card[index].price ?? '',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
              : Container(
                margin: EdgeInsets.only(top: 20),
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: card.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap:
                          () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => BlocProvider(
                                      create: (_) => DetailCubit(card[index]),
                                      child: const DetailPage(),
                                    ),
                              ),
                            ),
                          },
                      child: Card.outlined(
                        color: Colors.white,
                        child: _SampleCard(
                          image: card[index].image,
                          weight: card[index].weight ?? '',
                          cardName: card[index].cardName,
                          price: card[index].price ?? '',
                        ),
                      ),
                    );
                  },
                ),
              ),
        ],
      ),
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({
    required this.image,
    required this.cardName,
    required this.weight,
    required this.price,
  });
  final String image;
  final String cardName;
  final String weight;
  final String price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 174,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Container(
            margin: EdgeInsets.only(left: 30, top: 30),
            child: Image.asset(image, width: 104),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardName,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  weight,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 14,
                    color: Color(0xff7C7C7C),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${price}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff53B175),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  height: 46,
                  width: 46,
                  // color: ,
                  child: Icon(Icons.add, color: Colors.white, size: 40),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SubCard extends StatelessWidget {
  const _SubCard({required this.image, required this.cardName});
  final String image;
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 105,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Image.asset(image, height: 72),
          ),
          Text(
            cardName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color(0xff3E423F),
            ),
          ),
        ],
      ),
    );
  }
}
