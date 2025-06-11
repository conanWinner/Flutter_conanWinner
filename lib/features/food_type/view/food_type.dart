import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/data/models/Product.dart';
import 'package:flutter_w1/features/cart/cubit/cart_cubit.dart';
import 'package:flutter_w1/features/items/view/drop_down_items.dart';
import 'package:flutter_w1/features/selected_items/cubit/selected_items_cubit.dart';
import 'package:flutter_w1/features/selected_items/view/selected_items_view.dart';

import '../../../core/widgets/horizontal_line.dart';

class DetailInformationFoodType extends StatelessWidget {
  const DetailInformationFoodType({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox.fromSize(size: Size(0, 14)),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Text(
              "Detail Information About",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox.fromSize(size: Size(6, 0)),
            Text(
              title ?? "",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff53B175),
              ),
            ),
          ],
        ),

        SizedBox.fromSize(size: Size(0, 12)),

        Text(
          "High in vitamins (especially vitamin C and folate), dietary fiber and various antioxidants. Support immune function, aid digestion, and help reduce chronic‑disease risk. Rich in fiber, vitamins A, K, folate, and minerals like potassium and magnesium.",
          maxLines: 6,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: Color(0xff7C7C7C),
          ),
        ),

        SizedBox.fromSize(size: Size(0, 12)),

        DropDownItems(),

        SizedBox.fromSize(size: Size(0, 12)),

        BlocBuilder<SelectedItemsCubit, SelectedItemsState>(
          builder: (context, state) {
            if (state.selectedItems.isEmpty) {
              return SizedBox.shrink();
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.selectedItems.keys.length,
              itemBuilder: (context, i) {
                int isShowHorizontal = 0;
                String grocery = state.selectedItems.keys.elementAt(i);
                Set<Product> products = state.selectedItems[grocery]!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    i > 0
                        ? HorizontalLine(
                          color: 0xff53B175,
                          vertical: 10,
                          horizontal: 0,
                          height: 2,
                        )
                        : SizedBox.shrink(),

                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        context
                            .watch<CartCubit>()
                            .foodType[int.parse(grocery) - 1]
                            .cardName,
                        style: TextStyle(
                          color: Color(0xff181725),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ...products.map((product) {
                      isShowHorizontal++;
                      return Column(
                        children: [
                          isShowHorizontal > 1
                              ? HorizontalLine(
                                color: 0xffE2E2E2,
                                vertical: 10,
                                horizontal: 10,
                                height: 1,
                              )
                              : SizedBox.shrink(),
                          SelectedItems(
                            id: product.id,
                            urlImage: product.image,
                            cardName: product.cardName,
                            price: "\$${product.price}",
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
