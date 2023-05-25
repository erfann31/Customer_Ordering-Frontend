import 'package:flutter/cupertino.dart';

import '../model/entity/productRating.dart';
import '../model/repository/product_repository_impl.dart';

class StoreViewModel extends ChangeNotifier {
  var repository = ProductRepositoryImpl();
  ProductRatingData productRatingData = ProductRatingData();
  void getRatings(int storeId) async {
    productRatingData = repository.getRatings(storeId) as ProductRatingData;
    notifyListeners();
  }
}
