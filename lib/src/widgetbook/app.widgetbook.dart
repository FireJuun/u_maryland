// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:u_maryland/src/src.dart';
import 'package:u_maryland/src/widgetbook/app.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const ProviderScope(child: HotReload()));
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        CustomThemeAddon<ThemeData>(
          setting: ThemeSetting<ThemeData>(
            themes: [
              WidgetbookTheme(
                name: 'Light',
                data: getLightTheme(),
              ),
              WidgetbookTheme(
                name: 'Dark',
                data: getDarkTheme(),
              ),
            ],
            activeTheme: WidgetbookTheme(
              name: 'Light',
              data: getLightTheme(),
            ),
          ),
        ),
        TextScaleAddon(
          setting: TextScaleSetting(
            textScales: [
              1.0,
              1.25,
              1.5,
              2.0,
            ],
            activeTextScale: 1.0,
          ),
        ),
        FrameAddon(
          setting: FrameSetting(
            frames: [
              NoFrame(),
              DefaultDeviceFrame(
                setting: DeviceSetting(
                  devices: [
                    const Device(
                      name: 'iPhone 13',
                      resolution: Resolution(
                        nativeSize: DeviceSize(
                          height: 2532.0,
                          width: 1170.0,
                        ),
                        scaleFactor: 3.0,
                      ),
                      type: DeviceType.mobile,
                    ),
                    const Device(
                      name: '9.7" iPad',
                      resolution: Resolution(
                        nativeSize: DeviceSize(
                          height: 2048.0,
                          width: 1536.0,
                        ),
                        scaleFactor: 2.0,
                      ),
                      type: DeviceType.tablet,
                    ),
                    const Device(
                      name: 'Desktop 1080p',
                      resolution: Resolution(
                        nativeSize: DeviceSize(
                          height: 1080.0,
                          width: 1920.0,
                        ),
                        scaleFactor: 2.0,
                      ),
                      type: DeviceType.desktop,
                    ),
                    const Device(
                      name: '7.9" iPad mini',
                      resolution: Resolution(
                        nativeSize: DeviceSize(
                          height: 1024.0,
                          width: 768.0,
                        ),
                        scaleFactor: 2.0,
                      ),
                      type: DeviceType.tablet,
                    ),
                    const Device(
                      name: 'iPhone 13 Mini',
                      resolution: Resolution(
                        nativeSize: DeviceSize(
                          height: 2436.0,
                          width: 1125.0,
                        ),
                        scaleFactor: 3.0,
                      ),
                      type: DeviceType.mobile,
                    ),
                  ],
                  activeDevice: const Device(
                    name: 'iPhone 13',
                    resolution: Resolution(
                      nativeSize: DeviceSize(
                        height: 2532.0,
                        width: 1170.0,
                      ),
                      scaleFactor: 3.0,
                    ),
                    type: DeviceType.mobile,
                  ),
                ),
              ),
              WidgetbookFrame(
                setting: DeviceSetting(
                  devices: [
                    const Device(
                      name: 'iPhone 13',
                      resolution: Resolution(
                        nativeSize: DeviceSize(
                          height: 2532.0,
                          width: 1170.0,
                        ),
                        scaleFactor: 3.0,
                      ),
                      type: DeviceType.mobile,
                    ),
                    const Device(
                      name: '9.7" iPad',
                      resolution: Resolution(
                        nativeSize: DeviceSize(
                          height: 2048.0,
                          width: 1536.0,
                        ),
                        scaleFactor: 2.0,
                      ),
                      type: DeviceType.tablet,
                    ),
                    const Device(
                      name: 'Desktop 1080p',
                      resolution: Resolution(
                        nativeSize: DeviceSize(
                          height: 1080.0,
                          width: 1920.0,
                        ),
                        scaleFactor: 2.0,
                      ),
                      type: DeviceType.desktop,
                    ),
                    const Device(
                      name: '7.9" iPad mini',
                      resolution: Resolution(
                        nativeSize: DeviceSize(
                          height: 1024.0,
                          width: 768.0,
                        ),
                        scaleFactor: 2.0,
                      ),
                      type: DeviceType.tablet,
                    ),
                    const Device(
                      name: 'iPhone 13 Mini',
                      resolution: Resolution(
                        nativeSize: DeviceSize(
                          height: 2436.0,
                          width: 1125.0,
                        ),
                        scaleFactor: 3.0,
                      ),
                      type: DeviceType.mobile,
                    ),
                  ],
                  activeDevice: const Device(
                    name: 'iPhone 13',
                    resolution: Resolution(
                      nativeSize: DeviceSize(
                        height: 2532.0,
                        width: 1170.0,
                      ),
                      scaleFactor: 3.0,
                    ),
                    type: DeviceType.mobile,
                  ),
                ),
              ),
            ],
            activeFrame: NoFrame(),
          ),
        ),
      ],
      directories: [
        WidgetbookFolder(
          name: 'features',
          children: [
            WidgetbookFolder(
              name: 'counter',
              children: [
                WidgetbookComponent(
                  name: 'CounterView',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Counter',
                      builder: (context) => counterView(context),
                    ),
                  ],
                  isInitiallyExpanded: true,
                ),
              ],
              isInitiallyExpanded: true,
            ),
            WidgetbookFolder(
              name: 'home',
              children: [
                WidgetbookComponent(
                  name: 'HomeView',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Home',
                      builder: (context) => homeView(context),
                    ),
                  ],
                  isInitiallyExpanded: true,
                ),
              ],
              isInitiallyExpanded: true,
            ),
          ],
          isInitiallyExpanded: true,
        ),
      ],
    );
  }
}
