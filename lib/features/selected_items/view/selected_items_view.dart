import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/features/selected_items/cubit/selected_items_cubit.dart';

class SelectedItems extends StatelessWidget {
  const SelectedItems({
    super.key,
    required this.id,
    required this.urlImage,
    required this.cardName,
    required this.price,
  });
  final String id;
  final String urlImage;
  final String cardName;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image(image: AssetImage(urlImage), width: 50),
            SizedBox(width: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  cardName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 14,
                    color: Color(0xff7C7C7C),
                  ),
                ),
              ],
            ),
          ],
        ),

        BlocBuilder<SelectedItemsCubit, SelectedItemsState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<SelectedItemsCubit>().decrementQuantity(id);
                      },
                      child: const Icon(
                        Icons.remove,
                        color: Color(0xff53B175),
                        size: 24,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        border: Border.all(color: Color(0xffE2E2E2), width: 1.0),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Text(
                          state.getQuantityById(id).toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<SelectedItemsCubit>().incrementQuantity(id);
                      },
                      child: const Icon(
                        Icons.add,
                        color: Color(0xff53B175),
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
