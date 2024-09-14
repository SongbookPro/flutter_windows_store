import "src/messages.g.dart" as inner;

class StoreAppLicense {
  StoreAppLicense._({
    required this.isActive,
    required this.isTrial,
    required this.skuStoreId,
    required this.trialUniqueId,
    required this.trialTimeRemaining,
  });

  final bool isActive;

  final bool isTrial;

  final String skuStoreId;

  final String trialUniqueId;

  final Duration trialTimeRemaining;

  factory StoreAppLicense._fromInner(inner.StoreAppLicenseInner data) {
    return StoreAppLicense._(
      isActive: data.isActive,
      isTrial: data.isTrial,
      skuStoreId: data.skuStoreId,
      trialUniqueId: data.trialUniqueId,
      trialTimeRemaining: Duration(milliseconds: data.trialTimeRemaining),
    );
  }
}

class WindowsStoreApi {
  final _api = inner.WindowsStoreApi();

  Future<StoreAppLicense> getAppLicenseAsync() async {
    return StoreAppLicense._fromInner(await _api.getAppLicenseAsync());
  }
}
