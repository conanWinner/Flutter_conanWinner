import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/data/models/Product.dart';
import 'package:flutter_w1/features/cart/widgets/sub_item_food_type.dart';
import 'package:flutter_w1/features/food_type/cubit/food_type_cubit.dart';
import 'package:flutter_w1/features/items/cubit/items_cubit.dart';
import 'package:flutter_w1/features/items/widgets/sub_item.dart';
import 'package:flutter_w1/features/selected_items/cubit/selected_items_cubit.dart';

class DropDownItems extends StatelessWidget {
  const DropDownItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: DropdownButtonHideUnderline(
            child: BlocBuilder<ItemsCubit, ItemsState>(
              builder: (context, state) {
                final foodTypeState = context.watch<FoodTypeCubit>().state;

                return DropdownButton2<Product>(
                  isExpanded: true,
                  hint: Text(
                    'Select item',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  items:
                      state.listItems
                          .where(
                            (item) =>
                                item.id_grocery == foodTypeState.id_grocery,
                          )
                          .map(
                            (Product item) => DropdownMenuItem<Product>(
                              value: item,
                              child: SubItem(
                                name: item.cardName,
                                urlImage: item.image,
                                onSelectPressed: () {},
                              ),
                            ),
                          )
                          .toList(),
                  onChanged: (Product? value) {
                    // selected item
                    context.read<SelectedItemsCubit>().addItems(value!);
                  },
                  buttonStyleData: const ButtonStyleData(
                    decoration: BoxDecoration(color: Color(0xff53B175)),
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    height: 56,
                    width: 180,
                  ),
                  menuItemStyleData: const MenuItemStyleData(height: 50),
                  iconStyleData: const IconStyleData(
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    iconSize: 26,
                    iconEnabledColor: Colors.white,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    width: 180,
                    maxHeight: 220,
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
        ),
      ],
    );
  }
}
