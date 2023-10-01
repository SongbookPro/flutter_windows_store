#ifndef FLUTTER_PLUGIN_WINDOWS_STORE_PLUGIN_H_
#define FLUTTER_PLUGIN_WINDOWS_STORE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace windows_store {

class WindowsStorePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  WindowsStorePlugin();

  virtual ~WindowsStorePlugin();

  // Disallow copy and assign.
  WindowsStorePlugin(const WindowsStorePlugin&) = delete;
  WindowsStorePlugin& operator=(const WindowsStorePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace windows_store

#endif  // FLUTTER_PLUGIN_WINDOWS_STORE_PLUGIN_H_
