import 'package:crafy_bay/app/app_colors.dart';
import 'package:crafy_bay/app/constants.dart';
import 'package:crafy_bay/features/cart/presentation/widgets/card_item.dart';
import 'package:flutter/material.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("Carts")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CardItem();
                },
              ),
            ),
          ),

          _buildTotalPrizeAndCheckOutSection(textTheme),
        ],
      ),
    );
  }

  Container _buildTotalPrizeAndCheckOutSection(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withAlpha(40),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total Prize", style: textTheme.bodyLarge),
              Text(
                "${Constants.takaSign}242",
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: FilledButton(onPressed: () {}, child: Text("Checkout")),
          ),
        ],
      ),
    );
  }
}
