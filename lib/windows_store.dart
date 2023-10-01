
import 'windows_store_platform_interface.dart';

class WindowsStore {
  Future<String?> getPlatformVersion() {
    return WindowsStorePlatform.instance.getPlatformVersion();
  }
}
