import 'package:crafy_bay/app/app_colors.dart';
import 'package:crafy_bay/features/category/data/models/category_list_model.dart';
import 'package:crafy_bay/features/product/presentaion/screens/product_list_by_category_screens.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryListModel});

  final CategoryListModel categoryListModel;

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
              child: Image.network(
                categoryListModel.icon,
                width: 30,
                height: 30,
                errorBuilder: (_, _, _) =>
                    Icon(Icons.error, size: 28, color: Colors.grey),
              ),
            ),
          ),
          Text(
            categoryListModel.title,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.themeColor,
              letterSpacing: 0.5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
