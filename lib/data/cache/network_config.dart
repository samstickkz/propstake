//this class has all remote service configurations, and it takes care of the different environments we have
import '../../utils/constants.dart';

class NetworkConfig {

  static String developBaseUrl = baseUrl;
  static String releaseBaseUrl = productionBaseUrl;

}
