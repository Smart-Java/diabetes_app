class APIEndPoints {
  static String baseURL = 'https://dispatchaapp.com.ng/api';
  // static String baseURL = 'http://192.168.0.114:8000/api';
  static String loginEndPoint = '/login';
  static String registerEndPoint = '/register';
  static String otpEndPoint = '/';
  static String resendVerificationEmailEndPoint = '/verify-email';
  static String resendOTPEndPoint = '/';
  static String userCategoriesEndPoint = '/category';
  static String userDataEndPoint = '/user';
  static String logoutEndPoint = '/logout';
  static String forgotPasswordEndPoint = '/reset-password';
  static String sendTokenToEmailForForgotPasswordEndPoint = '/forgot-password';
  static String orderCostingElementsAndPricingEndPoint = '';
  static String orderPlacingEndPoint = '/order';
  static String allVehiclesEndPoint = '/vehicle';
  static String allOrdersEndPoint = '/all/order';
  static String allowDriverToGoOnlineAndOfflineEndPoint =
      '/driver/go-on-or-offline';
  static String driverFirstIndexAssignedOrderEndPoint =
      '/driver/all/assigned-order';
  static String currentOrdersEndPoint = '/driver/current/orders';
  static String currentOrdersPickedUpEndPoint = '/order/status';
  static String currentOrdersOnTheWayEndPoint = '/order/status';
  static String currentOrdersDoneEndPoint = '/order/status';
  static String acceptWaitingOrderEndPoint = '/driver/accept/order';
  static String rejectWaitingOrderEndPoint = '/driver/accept/order';
  static String acceptAssignedOrderEndPoint = '/driver/accept-assigned-order';
  static String rejectAssignedOrderEndPoint = '/driver/reject-assigned-order';
  static String waitingOrdersEndPoint = '/driver/all/order';
  static String assignedOrdersEndPoint = '/driver/all/assigned-order';
  static String completedOrdersEndPoint = '/driver/completed/orders';
  static String waitingOrdersAndOrderSettingDetailsEndPoint = '/setting';
  static String customerOrderDetailsEndPoint = '/order/details';
  static String orderAssignedDriverDetailsEndPoint = '/user/order/driver';
  static String driverOrderDetailsEndPoint = '/driver/order/details';
  static String transactionRecordEndPoint = '/all/user/transaction';
  static String avaliableBalanceEndPoint = '/user/balance';
  static String addNewCreditCardEndPoint = '/user/add/credit-card';
  static String updateUserWalletAndDetailsEndPoint = '/user/wallet/add';
  static String allUserSavedCreditCardDetailsEndPoint = '/user/all/credit-card';
  static String viewCreditCardDetailsEndPoint = '/user/view/credit-card';
  static String updateCreditCardDetailsEndPoint = '/user/update/credit-card';
  static String deleteCreditCardDetailsEndPoint = '/user/delete/credit-card';
  static String checkOutUsingCreditCardEndPoint = '';
  static String checkOutUsingWalletEndPoint = '';
  static String updateCustomerProfileEndPoint = '/update/profile';
  static String updateDriverProfileEndPoint = '/update/profile';
  static String updateAddressEndPoint = '/address';
  static String applyForADriverEndPoint = '/driver/asset';
  static String disableEnableAccountEndPoint = '/user/disable';
  static String driverPerformanceEndPoint = '/user/performance';
  static String noOfAvailableVehiclesEndPoint = '/driver/available';
  static String customerOrderDeliveryConfirmationEndPoint = '';
  static String customerOrderDeliveryFeedbackReponseEndPoint = '/user/order/rate';
  static String proofOfDeliveryUploadEndPoint = '/driver/order/pod';

  // static String siteDirectoryForImageUploads =
  //     'http://192.168.0.114:8000/upload/admin_images/';
  static String siteDirectoryForImageUploads =
      'https://dispatchaapp.com.ng/upload/admin_images/';
  static String siteDirectoryForVehicleImageUploads =
      'https://dispatchaapp.com.ng/upload/vehicle_images/';
}

class APIEndPointsParameter {
  static const String authHeader = 'Authorization';
  static const String noAuthHeader = 'NoAuthorization';
  static const String bearer = 'Bearer ';
}
