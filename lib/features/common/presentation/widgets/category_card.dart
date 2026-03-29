import 'package:crafy_bay/app/app_colors.dart';
import 'package:crafy_bay/features/product/presentaion/screens/product_list_by_category_screens.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListByCategoryScreens.name);
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.themeColor.withAlpha(30),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.computer,
                size: 28,
                color: AppColors.themeColor,
              ),
            ),
          ),
          Text(
            "Computer",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.themeColor,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
