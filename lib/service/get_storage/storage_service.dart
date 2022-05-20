import 'package:get_storage/get_storage.dart';

class GetStorageService {
  static final GetStorageService _instance = GetStorageService._init();
  static GetStorageService get instance => _instance;
  GetStorageService._init();

  final box = GetStorage();
}
