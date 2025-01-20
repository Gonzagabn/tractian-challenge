import 'package:tractian_challenge/app/data/client/rest_client.dart';

base class IBaseRepository {
  final IRestClient client;

  IBaseRepository({
    required this.client,
  });
}
