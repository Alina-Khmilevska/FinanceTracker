import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cpp_finance_tracker_plugin_platform_interface.dart';

/// An implementation of [CppFinanceTrackerPluginPlatform] that uses method channels.
class MethodChannelCppFinanceTrackerPlugin extends CppFinanceTrackerPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cpp_finance_tracker_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
