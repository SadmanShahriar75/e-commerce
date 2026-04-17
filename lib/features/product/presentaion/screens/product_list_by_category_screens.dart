import 'package:crafy_bay/features/common/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';

class ProductListByCategoryScreens extends StatefulWidget {
  const ProductListByCategoryScreens({super.key});

  static const String name = '/product-list-by-category';

  @override
  State<ProductListByCategoryScreens> createState() =>
      _ProductListByCategoryScreensState();
}

class _ProductListByCategoryScreensState
    extends State<ProductListByCategoryScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Electronices")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            // return FittedBox(child: CategoryCard());
          },
        ),
      ),
    );
  }
}
