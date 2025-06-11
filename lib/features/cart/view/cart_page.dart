import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/data/models/Grocery.dart';
import 'package:flutter_w1/features/cart/cubit/cart_cubit.dart';
import 'package:flutter_w1/features/cart/widgets/sub_item_food_type.dart';
import 'package:flutter_w1/features/food_type/cubit/food_type_cubit.dart';
import 'package:flutter_w1/features/food_type/food_type.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        centerTitle: true,

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Container(color: Color(0xffE2E2E2), height: 1),
        ),
      ),
      body: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          children: [
            DropdownButtonHideUnderline(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return DropdownButton2<Grocery>(
                    isExpanded: true,
                    hint: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Food Type',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        BlocBuilder<FoodTypeCubit, FoodTypeState>(
                          builder: (context, state) {
                            if (state.nameCard == '') {
                              return Text(
                                'Select food type',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            } else {
                              return Text(
                                "${state.nameCard}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    items:
                        state.foodType
                            .map(
                              (Grocery item) => DropdownMenuItem<Grocery>(
                                value: item,
                                child: SubItemFoodType(
                                  name: item.cardName,
                                  urlImage: item.image,
                                  onSelectPressed: () {
                                    context.read<FoodTypeCubit>().isShow();
                                    context.read<FoodTypeCubit>().changNameCard(
                                      item.cardName,
                                    );
                                    context.read<FoodTypeCubit>().changIdGrocery(
                                      item.id,
                                    );
                                  },
                                ),
                              ),
                            )
                            .toList(),
                    onChanged: (Grocery? value) {
                      // setState(() {
                      //   selectedValue = value;
                      // });
                    },
                    buttonStyleData: const ButtonStyleData(
                      decoration: BoxDecoration(color: Color(0xff53B175)),
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      height: 66,
                      // width: 140,
                    ),
                    menuItemStyleData: const MenuItemStyleData(height: 66),
                    iconStyleData: const IconStyleData(
                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                      iconSize: 26,
                      iconEnabledColor: Colors.white,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 260,
                      decoration: BoxDecoration(color: Color(0xff53B175)),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(2),
                        thumbVisibility: MaterialStateProperty.all(true),
                      ),
                    ),
                  );
                },
              ),
            ),

            BlocBuilder<FoodTypeCubit, FoodTypeState>(
              builder: (context, state) {
                if (state.isShow) {
                  return DetailInformationFoodType(title: state.nameCard);
                } else
                  return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
