import "src/messages.g.dart" as inner;

class StoreAppLicense {
  StoreAppLicense._({
    required this.isActive,
    required this.isTrial,
    required this.skuStoreId,
    required this.trialUniqueId,
    required this.trialTimeRemaining,
  });

  /// True if the license is valid and provides the current user an entitlement to use the app;
  /// otherwise, false.
  final bool isActive;

  /// True if the license is a trial license; otherwise, false.
  final bool isTrial;

  /// The Store ID of a the licensed app SKU from the Microsoft Store catalog.
  final String skuStoreId;

  /// A unique ID that identifies the combination of the current user and the usage-limited
  /// trial that is associated with this app license.
  final String trialUniqueId;

  /// The remaining time for the usage-limited trial that is associated with this app license.
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

  /// Get's the license information for from the Microsoft Store. Only works on Windows.
  Future<StoreAppLicense> getAppLicenseAsync() async {
    return StoreAppLicense._fromInner(await _api.getAppLicenseAsync());
  }
}
