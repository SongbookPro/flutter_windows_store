A flutter plugin for getting license information from the Microsoft Store. The app needs to be packaged as a misx and associated with a published app for this to return meaningful values.

## Features

The following license information is returned:
- isActive
- isTrial
- skuStoreId
- trialUniqueId
- trialTimeRemaining

## Usage

```dart
final store = WindowsStoreApi();
final license = await store.getAppLicenseAsync();

print(license.isActive);
print(license.isTrial);
print(license.skuStoreId);
print(license.trialUniqueId);
print(license.trialTimeRemaining);
```

See the [Microsoft documentation](https://learn.microsoft.com/en-us/uwp/api/windows.services.store.storeapplicense) for further details of the returned values.
