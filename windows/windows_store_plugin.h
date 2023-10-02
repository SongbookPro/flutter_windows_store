#ifndef FLUTTER_PLUGIN_WINDOWS_STORE_PLUGIN_H_
#define FLUTTER_PLUGIN_WINDOWS_STORE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace windows_store
{

    class WindowsStorePlugin
    {
    public:
        static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);
    };

} // namespace windows_store

#endif // FLUTTER_PLUGIN_WINDOWS_STORE_PLUGIN_H_
