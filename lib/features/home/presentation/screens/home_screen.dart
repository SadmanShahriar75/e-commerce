import 'package:crafy_bay/app/asset_paths.dart';
import 'package:crafy_bay/features/common/presentation/providers/main_nav_container_provider.dart';
import 'package:crafy_bay/features/common/presentation/widgets/category_card.dart';
import 'package:crafy_bay/features/common/presentation/widgets/product_card.dart';
import 'package:crafy_bay/features/home/presentation/widgets/circle_icon_button.dart';
import 'package:crafy_bay/features/home/presentation/widgets/home_carousel_slider.dart';
import 'package:crafy_bay/features/home/presentation/widgets/product_search_field.dart';
import 'package:crafy_bay/features/home/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 8,
            children: [
              ProductSearchField(),
              HomeCarouselSlider(),

              SectionHeader(
                title: 'Categories',
                onTapSeeAll: () {
                  context.read<MainNavContainerProvider>().chnageToCategories();
                },
              ),

              _buildCategoryList(),

              // popular
              SectionHeader(
                title: 'Popular',
                onTapSeeAll: () {
                  context.read<MainNavContainerProvider>().chnageToCategories();
                },
              ),

              _buildPopularProductList(),

              // special
              SectionHeader(
                title: 'Special',
                onTapSeeAll: () {
                  context.read<MainNavContainerProvider>().chnageToCategories();
                },
              ),

              _buildPopularProductList(),

              // new
              SectionHeader(
                title: 'New',
                onTapSeeAll: () {
                  context.read<MainNavContainerProvider>().chnageToCategories();
                },
              ),

              _buildPopularProductList(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildPopularProductList() {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductCard();
        },
      ),
    );
  }

  SizedBox _buildCategoryList() {
    return SizedBox(
      height: 95,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,

        separatorBuilder: (context, index) => SizedBox(height: 12),

        itemBuilder: (context, index) {
          return CategoryCard();
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPaths.navLogoSvg),
      actions: [
        CircleIconButton(onTap: () {}, icon: Icons.person),
        const SizedBox(width: 4),
        CircleIconButton(onTap: () {}, icon: Icons.call),
        const SizedBox(width: 4),
        CircleIconButton(
          onTap: () {},
          icon: Icons.notifications_active_outlined,
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
