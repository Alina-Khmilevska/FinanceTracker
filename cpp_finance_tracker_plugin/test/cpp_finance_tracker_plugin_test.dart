import 'package:flutter_test/flutter_test.dart';
import 'package:cpp_finance_tracker_plugin/cpp_finance_tracker_plugin.dart';
import 'package:cpp_finance_tracker_plugin/cpp_finance_tracker_plugin_platform_interface.dart';
import 'package:cpp_finance_tracker_plugin/cpp_finance_tracker_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCppFinanceTrackerPluginPlatform
    with MockPlatformInterfaceMixin
    implements CppFinanceTrackerPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CppFinanceTrackerPluginPlatform initialPlatform = CppFinanceTrackerPluginPlatform.instance;

  test('$MethodChannelCppFinanceTrackerPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCppFinanceTrackerPlugin>());
  });

  test('getPlatformVersion', () async {
    CppFinanceTrackerPlugin cppFinanceTrackerPlugin = CppFinanceTrackerPlugin();
    MockCppFinanceTrackerPluginPlatform fakePlatform = MockCppFinanceTrackerPluginPlatform();
    CppFinanceTrackerPluginPlatform.instance = fakePlatform;

    expect(await cppFinanceTrackerPlugin.getPlatformVersion(), '42');
  });
}
