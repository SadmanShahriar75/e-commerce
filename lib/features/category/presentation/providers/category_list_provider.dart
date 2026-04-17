import 'package:crafy_bay/app/set_up_network_caller.dart';
import 'package:crafy_bay/app/urls.dart';
import 'package:crafy_bay/core/services/network_caller.dart';
import 'package:crafy_bay/features/category/data/models/category_list_model.dart';
import 'package:flutter/material.dart';

class CategoryListProvider extends ChangeNotifier {
  final int _pageSize = 30;
  int _currentPageNo = 0;
  int? _lastPageNo;

  bool _intailLoading = false;
  bool _loadingMoreData = false;

  List<CategoryListModel> _categoryList = [];

  List<CategoryListModel> get categoryList => _categoryList;
  String? _errorMessage;

  bool get intailLoading => _intailLoading;
  bool get moreInLoading => _loadingMoreData;

  String? get errorMessage => _errorMessage;

  Future<bool> fetchCategoryList() async {
    bool isSuccess = false;
    if (_currentPageNo == 0) {
      _categoryList.clear();
      _intailLoading = true;
    } else if (_currentPageNo < _lastPageNo!) {
      _loadingMoreData = true;
    } else {
      false;
    }
    notifyListeners();
    _currentPageNo++;

    final NetworkResponse response = await getNetworkCaller().getRequest(
      url: Urls.categoryListUrl(_pageSize, _currentPageNo),
    );
    if (response.isSuccess) {
      _lastPageNo ??= response.responseData['data']['last_page'];
      List<CategoryListModel> list = [];
      for (Map<String, dynamic> jsonData
          in response.responseData['data']['results']) {
        list.add(CategoryListModel.fromJson(jsonData));
      }
      _categoryList.addAll(list);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    if (_intailLoading) {
      _intailLoading = false;
    } else {
      _loadingMoreData = false;
    }
    notifyListeners();

    return isSuccess;
  }

  Future<void> loadInitialCategoryList() async {
    _currentPageNo = 0;
    _lastPageNo = null;
    await fetchCategoryList();
  }
}
