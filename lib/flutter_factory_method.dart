import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformButton {
  Widget build({required Widget child, required VoidCallback onPressed});

  factory PlatformButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
        return IosButton();
      case TargetPlatform.android:
      default:
        return AndroidButton();
    }
  }
}

class AndroidButton implements PlatformButton {
  @override
  Widget build({required Widget child, required VoidCallback onPressed}) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

class IosButton implements PlatformButton {
  @override
  Widget build({required Widget child, required VoidCallback onPressed}) {
    return CupertinoButton(onPressed: onPressed, child: child);
  }
}
