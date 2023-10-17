import 'cpp_finance_tracker_plugin_platform_interface.dart';
import 'package:flutter/services.dart'; // Додайте цей імпорт для MethodChannel

class CppFinanceTrackerPlugin {
  
  // Ініціалізуйте MethodChannel
  final MethodChannel _channel = const MethodChannel('cpp_finance_tracker_plugin');

  Future<String?> getPlatformVersion() {
    return CppFinanceTrackerPluginPlatform.instance.getPlatformVersion();
  }

  Future<int> addNumbers(int a, int b) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'a': a,
      'b': b,
    };
    return await _channel.invokeMethod('addNumbers', params);
  }
}
