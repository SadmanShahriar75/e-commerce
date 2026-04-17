import 'package:crafy_bay/features/category/presentation/providers/category_list_provider.dart';
import 'package:crafy_bay/features/common/presentation/providers/main_nav_container_provider.dart';
import 'package:crafy_bay/features/common/presentation/widgets/category_card.dart';
import 'package:crafy_bay/features/common/presentation/widgets/center_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      context.read<CategoryListProvider>().fetchCategoryList();
      _scrollController.addListener(_LoadMoreData);
    });
  }

  void _LoadMoreData() {
    if (_scrollController.position.extentBefore < 300) {
      context.read<CategoryListProvider>().fetchCategoryList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, __) {
        context.read<MainNavContainerProvider>().backToHome();
      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.read<MainNavContainerProvider>().backToHome();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Categories"),
        ),
        body: Consumer<CategoryListProvider>(
          builder: (context, categoryListProvider, child) {
            if (categoryListProvider.intailLoading) {
              return CenterCircularProgress();
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      controller: _scrollController,
                      itemCount: categoryListProvider.categoryList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          categoryListModel:
                              categoryListProvider.categoryList[index],
                        );
                      },
                    ),
                  ),
                ),
                if (categoryListProvider.moreInLoading)
                  CenterCircularProgress(),
              ],
            );
          },
        ),
      ),
    );
  }
}
