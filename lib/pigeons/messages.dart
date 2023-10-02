// ignore: depend_on_referenced_packages
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/messages.g.dart',
  dartOptions: DartOptions(),
  cppOptions: CppOptions(namespace: 'windows_store'),
  cppHeaderOut: 'windows/pigeon/messages.g.h',
  cppSourceOut: 'windows/pigeon/messages.g.cpp',
  dartPackageName: 'windows_store',
))
class StoreAppLicenseInner {
  final bool isActive;
  final bool isTrial;
  final String skuStoreId;
  final String trialUniqueId;
  final int trialTimeRemaining;

  const StoreAppLicenseInner(this.isActive, this.isTrial, this.skuStoreId, this.trialUniqueId, this.trialTimeRemaining);
}

@HostApi()
abstract class WindowsStoreApi {
  @async
  StoreAppLicenseInner getAppLicenseAsync();
}
