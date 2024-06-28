class Url {
  static String get _apiUrl {
    return 'https://mopuserapitest.convenientcare.life/PlatformCoreServices';
  }

  static String get _baseUrl {
    return 'https://us-central1-ticketing-management-sys.cloudfunctions.net';
  }

  static String get _inventoryUrl {
    return 'https://inventorydevapi.convenientcare.life/PlatformCoreServices';
  }

  static String get login => '$_inventoryUrl/inventory/Login/GetRoles';
  static String get getUsers => '$_apiUrl/Authorize/UserMaster/List';
  static String get sendEmail => '$_baseUrl/sendEmail';
}
