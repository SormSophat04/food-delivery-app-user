class ApiEndpoint {
  //Base URL
  static const String baseUrl = 'http://192.168.0.126:9099/';

  //Restaurant Endpoints
  static const String restaurants = 'restaurants';
  static const String restaurant = 'restaurants/{id}';

  //Category Endpoints
  static const String categories = 'categories';
  static const String category = 'categories/{id}';

  //Food Endpoints
  static const String foods = 'foods';
  static const String food = 'foods/{id}';

  //Cart Endpoints
  static const String carts = 'cart';
  static const String cart = 'cart/{id}';
  static const String cartItem = 'cart/items';
  static const String cartItemId = 'cart/{id}/items';

  //User Endpoints
  static const String users = 'users';
  static const String user = 'users/{id}';

  //Review Endpoints
  static const String reviews = 'reviews';
  static const String review = 'reviews/{id}';

  //Ingredients Endpoints
  static const String ingredients = 'ingredients';
  static const String ingredient = 'ingredients/{id}';

  //Order Endpoints
  static const String orders = 'orders';
  static const String order = 'orders/{id}';
}
