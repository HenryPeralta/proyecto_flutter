import 'dart:convert';

import 'package:proyecto_flutter/features/dashboard/data/models/user_account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDashboardDataSource {
  final SharedPreferences sharedPreferences;

  static const String _productsCachePrefix = 'dashboard_products';

  LocalDashboardDataSource(this.sharedPreferences);

  Future<void> saveProducts(
    String email,
    List<UserAccountModel> products,
  ) async {
    final encodedProducts = products
        .map((product) => product.toJson())
        .toList();
    await sharedPreferences.setString(
      _cacheKey(email),
      jsonEncode(encodedProducts),
    );
  }

  Future<List<UserAccountModel>> getProducts(String email) async {
    try {
      final productsJson = sharedPreferences.getString(_cacheKey(email));
      if (productsJson == null) return [];

      final products = jsonDecode(productsJson) as List<dynamic>;
      return products.map((product) {
        return UserAccountModel.fromJson(product as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      return [];
    }
  }

  String _cacheKey(String email) => '${_productsCachePrefix}_$email';
}
