#include "windows_store_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>
#include <sstream>

#include <iostream>
#include <ppltasks.h>
#include <winrt/Windows.Services.Store.h>
#include <winrt/Windows.Foundation.Collections.h>

#include "pigeon/messages.g.h"

using namespace winrt;
using namespace Windows::Services;
using namespace Windows::Foundation;
using namespace Concurrency;

namespace windows_store
{

  class WindowsStoreApiInstance : public WindowsStoreApi
  {
  public:
    WindowsStoreApiInstance() {}
    virtual ~WindowsStoreApiInstance() {}

    void GetAppLicenseAsync(std::function<void(ErrorOr<StoreAppLicense> reply)> result)
    {
      concurrency::create_task([result]
                               {
		  try {
        Store::StoreContext storeContext = Store::StoreContext::GetDefault();
        auto licenseAsync = storeContext.GetAppLicenseAsync();
        auto license = licenseAsync.get();

        std::string skuStoreId = winrt::to_string(license.SkuStoreId());
        std::string trialUniqueId = winrt::to_string(license.TrialUniqueId());

        result(StoreAppLicense(license.IsActive(), license.IsTrial(), skuStoreId, trialUniqueId, license.TrialTimeRemaining().count()));
		  }  catch (winrt::hresult_error const& ex)
        {
            winrt::hresult hr = ex.code();
            winrt::hstring message = ex.message();
            result(FlutterError(std::to_string(hr.value), winrt::to_string(message), ""));
        } });
    }
  };

  // static
  void WindowsStorePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarWindows *registrar)
  {
    static auto plugin = std::make_unique<WindowsStoreApiInstance>();
    WindowsStoreApi::SetUp(registrar->messenger(),
                           plugin.get());
  }

} // namespace windows_store
