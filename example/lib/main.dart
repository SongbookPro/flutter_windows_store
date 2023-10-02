import 'package:flutter/material.dart';
import 'dart:async';

import 'package:windows_store/windows_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _windowsStorePlugin = WindowsStoreApi();
  StoreAppLicense? license;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    final result = await _windowsStorePlugin.getAppLicenseAsync();
    setState(() {
      license = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('isActive = ${license?.isActive}'),
              Text('isTrial = ${license?.isActive}'),
              Text('skuStoreId = ${license?.skuStoreId}'),
              Text('trialUniqueId = ${license?.trialUniqueId}'),
              Text('trialTimeRemaining = ${license?.trialTimeRemaining}'),
            ],
          ),
        ),
      ),
    );
  }
}
