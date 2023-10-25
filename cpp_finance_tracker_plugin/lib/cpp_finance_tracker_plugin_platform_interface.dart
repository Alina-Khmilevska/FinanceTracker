import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cpp_finance_tracker_plugin_method_channel.dart';

abstract class CppFinanceTrackerPluginPlatform extends PlatformInterface {
  /// Constructs a CppFinanceTrackerPluginPlatform.
  CppFinanceTrackerPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static CppFinanceTrackerPluginPlatform _instance = MethodChannelCppFinanceTrackerPlugin();

  /// The default instance of [CppFinanceTrackerPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelCppFinanceTrackerPlugin].
  static CppFinanceTrackerPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CppFinanceTrackerPluginPlatform] when
  /// they register themselves.
  static set instance(CppFinanceTrackerPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
