import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafy_bay/app/app_colors.dart';
import 'package:crafy_bay/app/asset_paths.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _seletedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _seletedIndex.value = index;
            },
            autoPlay: true,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 231, 231, 231),
                  ),
                  child: Stack(
                    children: [
                      // SVG Background
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(AssetPaths.shoePng),
                        ),
                      ),

                      // Content
                      Center(
                        child: Text(
                          'Nick $i',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );

                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   margin: EdgeInsets.symmetric(horizontal: 5.0),
                //   decoration: BoxDecoration(
                //     color: const Color.fromARGB(255, 0, 161, 167),
                //     image: DecorationImage(image:
                //     SvgPicture.asset(AssetPaths.navLogoSvg),
                //     ),
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //   alignment: Alignment.center,
                //   child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                // );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),

        ValueListenableBuilder(
          valueListenable: _seletedIndex,
          builder: (context, selectedIndex, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    width: 12,
                    height: 12,
                    margin: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: i == _seletedIndex.value
                          ? AppColors.themeColor
                          : null,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
