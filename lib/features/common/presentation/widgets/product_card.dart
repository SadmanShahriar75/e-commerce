import 'package:crafy_bay/app/app_colors.dart';
import 'package:crafy_bay/app/asset_paths.dart';
import 'package:crafy_bay/app/constants.dart';
import 'package:crafy_bay/features/common/presentation/widgets/favourite_button.dart';
import 'package:crafy_bay/features/common/presentation/widgets/rating_widget.dart';

import 'package:crafy_bay/features/product/presentaion/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name);
      },
      child: SizedBox(
        width: 150,
        child: Card(
          elevation: 3,
          shadowColor: AppColors.themeColor.withAlpha(50),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 90,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                  color: AppColors.themeColor.withAlpha(30),
                  image: DecorationImage(image: AssetImage(AssetPaths.shoePng)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Nike Shoe RG34 - New Arrival",
                      maxLines: 1,
                      style: TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${Constants.takaSign}234",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),

                        RatingView(),

                        FavouriteButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
