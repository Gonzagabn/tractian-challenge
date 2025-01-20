import 'package:get/get.dart';
import 'package:tractian_challenge/app/core/base/base_di.dart';
import 'package:tractian_challenge/app/data/client/rest_client.dart';

class ClientDI implements IBaseDI {
  @override
  Future initModules() async {
    Get.put<IRestClient>(
      RestClient(),
      permanent: true,
    );
  }
}
