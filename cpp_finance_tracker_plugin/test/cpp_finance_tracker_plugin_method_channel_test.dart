import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cpp_finance_tracker_plugin/cpp_finance_tracker_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelCppFinanceTrackerPlugin platform = MethodChannelCppFinanceTrackerPlugin();
  const MethodChannel channel = MethodChannel('cpp_finance_tracker_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
