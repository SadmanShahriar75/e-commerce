import 'package:crafy_bay/app/app_colors.dart';
import 'package:crafy_bay/app/asset_paths.dart';
import 'package:crafy_bay/app/constants.dart';
import 'package:crafy_bay/features/cart/presentation/screens/inc_dec_button.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Card(
      elevation: 3,
      color: Colors.white,
      shadowColor: AppColors.themeColor.withAlpha(50),
      child: Row(
        spacing: 4,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetPaths.shoePng, height: 90, width: 70),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nike KY3434 - new Arrival Show",
                              maxLines: 1,
                              style: textTheme.bodyLarge?.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              "Color: Black Size -XL",
                              maxLines: 1,
                              style: textTheme.bodySmall?.copyWith(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete, color: Colors.grey),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${Constants.takaSign}242",

                        style: textTheme.bodyLarge?.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.themeColor,
                        ),
                      ),

                      IncDecButton(onChange: (int p1) {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
