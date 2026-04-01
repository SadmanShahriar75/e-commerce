import 'package:crafy_bay/app/app_colors.dart';
import 'package:crafy_bay/app/constants.dart';
import 'package:crafy_bay/features/cart/presentation/widgets/inc_dec_button.dart';
import 'package:crafy_bay/features/common/presentation/widgets/favourite_button.dart';
import 'package:crafy_bay/features/common/presentation/widgets/rating_widget.dart';
import 'package:crafy_bay/features/product/presentaion/widgets/color_picker.dart';
import 'package:crafy_bay/features/product/presentaion/widgets/product_image_slider.dart';
import 'package:crafy_bay/features/product/presentaion/widgets/size_picker.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = '/product-detils';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Nike Show 2DGG3 -New Edition 2026",
                                style: textTheme.titleMedium,
                              ),
                            ),
                            IncDecButton(onChange: (newValue) {}),
                          ],
                        ),
                        Row(
                          children: [
                            RatingView(),
                            TextButton(
                              onPressed: () {},
                              child: Text('Reviews'),
                            ),

                            FavouriteButton(),
                          ],
                        ),
                        Text('Color', style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        ColorPicker(
                          colors: ['Black', 'White', 'Red'],
                          onChanged: (selectedColor) {},
                        ),
                        SizedBox(height: 8),
                        Text('Size', style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        SizePicker(
                          sizes: ['M', 'L', 'XL', 'XXL'],
                          onChanged: (selectedSize) {},
                        ),

                        const SizedBox(height: 16),
                        Text('Description', style: textTheme.titleMedium),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPrizeAndToCartSection(textTheme),
        ],
      ),
    );
  }

  Container _buildPrizeAndToCartSection(TextTheme textTheme) {
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
                "${Constants.takaSign}500",
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: FilledButton(onPressed: () {}, child: Text("Add to Cart")),
          ),
        ],
      ),
    );
  }
}
