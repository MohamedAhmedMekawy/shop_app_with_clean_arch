class EndPoints {
  static const String baseUrl = 'https://student.valuxapps.com/api/';
  static const String login = '${baseUrl}$LOGIN';
  static const String LOGIN = 'login';
  static const String register = '${baseUrl}$REGISTER';
  static const String REGISTER = 'register';
  static const String home = '${baseUrl}$HOME';
  static const String HOME = 'home';
  static const String FAVORITE = 'favorites';
  static const String favorites = '${baseUrl}$FAVORITE';
  static const String categories = '${baseUrl}$CATEGORIES';
  static const String CATEGORIES = 'categories';
  static const String cart = '${baseUrl}$CART';
  static const String CART = 'carts';
  static const ADDORDER = 'orders';
  static const ADDADDRESS = 'addresses';
  static const SIGNOUT = 'logout';

  static const String logout = '${baseUrl}$SIGNOUT';


  static const String address = '${baseUrl}$ADDADDRESS';

  static const String order = '${baseUrl}$ADDORDER';

  static const String search = '${baseUrl}$SEARCH';
  static const String SEARCH = 'products/search';

  static const String profile = '${baseUrl}$PROFILE';
  static const String PROFILE = 'profile';

  static const String updateProfile = '${baseUrl}$UPDATEPROFILE';
  static const String UPDATEPROFILE = 'update-profile';

  static const String changePassword = '${baseUrl}$CHANGEPASSWORD';
  static const String CHANGEPASSWORD = 'change-password';

  static const String faqs = '${baseUrl}$FAQS';
  static const String FAQS = 'faqs';

  static String updateCartProductsPath(int id) => 'carts/$id';

  static String categoriesDetails(int categoriesId) =>
      '${baseUrl}categories/$categoriesId';

  static String productDetails(int productId) =>
      '${baseUrl}products/$productId';

  static String updateAddress(int addressId) =>
      '${baseUrl}addresses/$addressId';

  static String deleteAddress(int addressId) =>
      '${baseUrl}addresses/$addressId';

  static const String GETFAVORITE = 'favorites';
  static const String getFavorite = '${baseUrl}$GETFAVORITE';

  static String cancelOrder(int id) => 'orders/$id/cancel';
}
