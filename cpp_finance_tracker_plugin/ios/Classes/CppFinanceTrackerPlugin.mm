#import "CppFinanceTrackerPlugin.m"
#import "calculator.h"

@implementation CppFinanceTrackerPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"cpp_finance_tracker_plugin"
            binaryMessenger:[registrar messenger]];
  CppFinanceTrackerPlugin* instance = [[CppFinanceTrackerPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } 
  else if ([@"addNumbers" isEqualToString:call.method]) {
    int a = [call.arguments[@"a"] intValue];
    int b = [call.arguments[@"b"] intValue];
    int sum = addLee(a, b);
    result(@(sum));
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
