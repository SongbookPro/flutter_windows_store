#include "windows_store_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>
#include <sstream>

#include <iostream>
#include <ppltasks.h>
#include <winrt/Windows.Services.Store.h>
#include <winrt/Windows.Foundation.Collections.h>

using namespace winrt;
using namespace Windows::Services::Store;
using namespace Windows::Foundation;
using namespace Concurrency;

namespace windows_store {

// static
void WindowsStorePlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {
  auto channel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          registrar->messenger(), "windows_store",
          &flutter::StandardMethodCodec::GetInstance());

  auto plugin = std::make_unique<WindowsStorePlugin>();

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

WindowsStorePlugin::WindowsStorePlugin() {}

WindowsStorePlugin::~WindowsStorePlugin() {}

void WindowsStorePlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue> &method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if (method_call.method_name().compare("getPlatformVersion") == 0) {

          printf("Running co-routine\n");
    concurrency::create_task([]
    {
              try
        {
    StoreContext storeContext = StoreContext::GetDefault();
    auto licenseAsync = storeContext.GetAppLicenseAsync();
    auto license = licenseAsync.get();
    // concurrency::create_task(storeContext.GetAppLicenseAsync()).then([](StoreAppLicense license)
    // {
    bool isActive = license.IsActive();
    bool isTrial = license.IsTrial();
    auto skuStoreId = license.SkuStoreId();
    auto trialTimeRemaining = license.TrialTimeRemaining();

        printf("Is active = %d\n", isActive);
        printf("Is trial = %d\n", isTrial);
        
    // }, task_continuation_context::get_current_winrt_context());

        }
            catch (winrt::hresult_error const& ex)
        {
          printf("Error caught");
            winrt::hresult hr = ex.code(); // HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND).
            winrt::hstring message = ex.message(); // The system cannot find the file specified.
        }


    }
    );

    std::ostringstream version_stream;
    version_stream << "Windows ";
    if (IsWindows10OrGreater()) {
      version_stream << "10+";
    } else if (IsWindows8OrGreater()) {
      version_stream << "8";
    } else if (IsWindows7OrGreater()) {
      version_stream << "7";
    }
    result->Success(flutter::EncodableValue(version_stream.str()));
  } else {
    result->NotImplemented();
  }
}

}  // namespace windows_store
