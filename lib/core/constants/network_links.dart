class NetworkLinks {
  static const String baseUrl = 'https://aloavto-backend.mirabbosoff.uz/api/v1';

  // === AUTHENTICATION ===
  static const String userLogin = '/users/login/';
  static const String userRegister = '/users/register/';
  static const String usersToken = '/users/token/';
  static const String refresh = '/users/token/refresh/';

  // === USERS ===
  static const String usersDashboard = '/users/dashboard/';
  static const String usersList = '/users/list/';
  static const String usersProfile = '/users/profile/';
  static String usersUserById(int id) => '/users/user/$id/';

  // === CARS ===
  static const String statusPptions = "/cars/cars/status-options/";
  static const String carData = '/cars/car-data/';
  static const String carEvaluation = '/cars/car-evaluation/';
  static const String carEvaluationChoices = '/cars/car-evaluation-choices/';
  static const String cars = '/cars/cars/';
  static String carById(int id) => '/cars/cars/$id/';
  static String carCards(int id) => '/cars/cars/$id/cards/';
  static const String carActive = '/cars/cars/active/';
  static const String carPurchase = '/cars/cars/purchase/';
  static const String carRedemption = '/cars/cars/redemption/';
  static const String carSold = '/cars/cars/sold/';
  static const String carLocations = '/cars/locations/';
  static String locationById(int id) => '/cars/locations/$id/';
  static const String latestLocation = '/cars/locations/latest/';

  // === DROPDOWNS ===
  static String complectations(String brand, String model) =>
      '/cars/complectations/$brand/$model/';
  static String models(String brand) => '/cars/models/$brand/';

  // === CONTRACTS ===
  static const String contracts = '/contracts/contracts/';
  static String contractById(int id) => '/contracts/contracts/$id/';
  static String downloadContract(int id) =>
      '/contracts/contracts/$id/download/';
  static String deleteContractImage(int id, int imageId) =>
      '/contracts/contracts/$id/images/$imageId/';
  static String signAdmin(int id) => '/contracts/contracts/$id/sign_admin/';
  static String signUser(int id) => '/contracts/contracts/$id/sign_user/';
  static String uploadContractImages(int id) =>
      '/contracts/contracts/$id/upload_images/';

  // === NOTIFICATIONS ===
  static const String notifications = '/notifications/notifications/';
  static String notificationById(int id) => '/notifications/notifications/$id/';
  static String deleteNotification(int id) =>
      '/notifications/notifications/$id/';
  static String markAsRead(int id) =>
      '/notifications/notifications/$id/mark_as_read/';
  static const String markAllAsRead =
      '/notifications/notifications/mark_all_as_read/';
  static const String notificationTemplates = '/notifications/templates/';
  static String templateById(int id) => '/notifications/templates/$id/';

  // === PAYMENTS ===
  static const String cardCategories = '/payments/card-categories/';
  static String cardCategoryById(int id) => '/payments/card-categories/$id/';
  static String cardsByCategory(int id) =>
      '/payments/card-categories/$id/cards/';
  static const String cardCategoriesActive =
      '/payments/card-categories/active/';

  static const String payments = '/payments/payments/';
  static String paymentById(int id) => '/payments/payments/$id/';
  static String processPayment(int id) => '/payments/payments/$id/process/';
  static String refundPayment(int id) => '/payments/payments/$id/refund/';
  static String updatePaymentStatus(int id) =>
      '/payments/payments/$id/update_status/';
  static const String paymentsCompleted = '/payments/payments/completed/';
  static const String paymentMethods = '/payments/payments/payment-methods/';
  static const String paymentStatuses = '/payments/payments/payment-statuses/';
  static const String paymentTypes = '/payments/payments/payment-types/';
  static const String paymentSummary = '/payments/payments/payment_summary/';
  static const String paymentsPending = '/payments/payments/pending/';
  static const String paymentsUpcoming = '/payments/payments/upcoming/';
}
