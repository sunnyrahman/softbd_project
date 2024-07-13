import '../global/constants/enum.dart';

enum AppConfig {
  base,
  todayCurriculumList,
}

extension AppUrlExtention on AppConfig {
  static String _baseUrl = "";
  static void setUrl(UrlLink urlLink) {
    switch (urlLink) {
      case UrlLink.isLive:
        _baseUrl = "";
        break;
      case UrlLink.isDev:
        _baseUrl = "https://api.npoint.io/";
        break;
      case UrlLink.isLocalServer:
        _baseUrl = "https://api.npoint.io/";
        break;
    }
  }
  String get url {
    switch (this) {
      case AppConfig.base:
        return _baseUrl;
      case AppConfig.todayCurriculumList:
        return 'bc69ae1f6991da81ab9a';
      default:
    }
    return "";
  }
}
