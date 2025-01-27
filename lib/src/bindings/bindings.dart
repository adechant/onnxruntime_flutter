import 'dart:ffi';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:onnxruntime/src/bindings/onnxruntime_bindings_generated.dart';

final DynamicLibrary _dylib = () {
  if (Platform.isAndroid) {
    return DynamicLibrary.open('libonnxruntime.so');
  }

  if (Platform.isIOS) {
    return DynamicLibrary.process();
  }

  if (Platform.isMacOS) {
    return DynamicLibrary.open('libonnxruntime.1.20.1.dylib');
  }

  if (Platform.isWindows) {
    return DynamicLibrary.open('onnxruntime.dll');
  }

  if (Platform.isLinux) {
    return DynamicLibrary.open('libonnxruntime.so.1.20.1');
  }

  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// OnnxRuntime Bindings
final onnxRuntimeBinding = OnnxRuntimeBindings(_dylib);

final DynamicLibrary extDylib = () {
  if (Platform.isAndroid) {
    throw UnsupportedError('Unsupported platform: ${Platform.operatingSystem}');
  }

  if (Platform.isIOS) {
    throw UnsupportedError('Unsupported platform: ${Platform.operatingSystem}');
  }

  if (Platform.isMacOS) {
    throw UnsupportedError('Unsupported platform: ${Platform.operatingSystem}');
  }

  if (Platform.isWindows) {
    return DynamicLibrary.open('ortextensions.dll');
  }

  if (Platform.isLinux) {
    throw UnsupportedError('Unsupported platform: ${Platform.operatingSystem}');
  }

  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

String get ortExtensionsDylibPath {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      throw UnimplementedError();
    case TargetPlatform.fuchsia:
      throw UnimplementedError();
    case TargetPlatform.iOS:
      throw UnimplementedError();
    case TargetPlatform.linux:
      throw UnimplementedError();
    case TargetPlatform.macOS:
      throw UnimplementedError();
    case TargetPlatform.windows:
      return 'ortextensions.dll';
  }
}
