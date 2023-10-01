#include "include/windows_store/windows_store_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "windows_store_plugin.h"

void WindowsStorePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  windows_store::WindowsStorePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
