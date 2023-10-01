import 'package:flutter_test/flutter_test.dart';
import 'package:windows_store/windows_store.dart';
import 'package:windows_store/windows_store_platform_interface.dart';
import 'package:windows_store/windows_store_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWindowsStorePlatform
    with MockPlatformInterfaceMixin
    implements WindowsStorePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WindowsStorePlatform initialPlatform = WindowsStorePlatform.instance;

  test('$MethodChannelWindowsStore is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWindowsStore>());
  });

  test('getPlatformVersion', () async {
    WindowsStore windowsStorePlugin = WindowsStore();
    MockWindowsStorePlatform fakePlatform = MockWindowsStorePlatform();
    WindowsStorePlatform.instance = fakePlatform;

    expect(await windowsStorePlugin.getPlatformVersion(), '42');
  });
}
