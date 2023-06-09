# u_maryland

Demo project for the University of Maryland's Google Developer Student Club meeting on Friday April 28, 2023. Associated [1-hour video](https://youtu.be/OJ2wkLPyQZM), [event link](https://gdsc.community.dev/events/details/developer-student-clubs-university-of-maryland-presents-introduction-to-flutter-with-google-developer-expert-john-manning/).

<img align="right" src="demo.gif" width="250"/>

## Getting Started

If you've never used Flutter before, check out these resources to get started:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Fish and Flutter

One simple way to get started with Flutter on macOS is to use the Fish and Flutter method described in this [blog post](https://mayjuun.com/blog/06-fish-and-flutter/). Essentially, this will allow you to just use Homebrew to get everything loaded (either via Flutter directly or fvm, if you need to use different Flutter packages).

## VS Code Settings

You are welcome to use VS Code, Android Studio, vim, or really any IDE to develop in Flutter. I use VS Code exclusively. These are the settings that make my life easy when developing:

### CodeActionsOnSave

Enable [CodeActionsOnSave](https://code.visualstudio.com/docs/getstarted/settings), by editing `settings.json` with

```json
    ...
    "editor.codeActionsOnSave": {
        
        "source.fixAll": true,
    },
    ...
```

This will allow all of Dart's opinionated linting to happen automatically, saving you A LOT of time.

### Extensions

Add the following extensions in VS Code

- Awesome Flutter Snippets
- Better Comments
- Build Runner
- Colonize
- Dart
- Error Lens (optional)
- Flutter
- Flutter Intl
- Flutter Riverpod Snippets
- Flutter Snippets
- Flutter Widget Snippets
- Freezed (still relevant?)
- JSON tools (optional)
- markdownlint (optional)
- Material Icon Theme (optional)
- Sort lines

NOTE: This is my opinionated suggestion for extensions that match most of my daily development workflow. Your mileage may vary based on package.

## Intermediate

If you are serious about building a production-level app, you'll want a set architecture. Pick something that works for you, and remember to be consistent. Other people will likely be reading your code in the future, so you're building for them as well.

### Architecture

We originally followed [GSkinner's MVC+S](https://blog.gskinner.com/archives/2020/09/flutter-state-management-with-mvcs.html) approach exclusively. Over time, however, we found it was internally preferable to sort by feature. Nowadays, we separate reusable code into individual repos...which is WAY out of the scope of beginner / intermediate Flutter development. Instead, consider having this inside your `lib/src` folder:

  | **Folder**   | **Subfolder**                          | **Description**                                                                                        |
  | ------------ | -------------------------------------- | ------------------------------------------------------------------------------------------------------ |
  | /features   |                                   | whenever possible, prioritize sorting by function   |
  |              | /shared                     | reusable files or classes, but only within this feature  |
  |              | &lt;feature>.dart                      | export file for this folder           |
  |              | &lt;feature>_view.dart                 | main UI / view for this feature              |
  |              | &lt;feature>_providers.dart            | state management for this feature              |
  | /models      |                                        | classes / objects created specifically for this app that *are reused throughout the app*  |
  |              | &lt;custom>_data.dart                  | custom data class       |
  |              | &lt;custom>_model.dart                 | data model that typically modifies or shapes a data class   |
  | /routes      |                                        | all routing from one screen to the next     |
  | /services    |                                        | interaction with the outside world (REST, http, file storage, etc)   |
  | /ui          |                                        | essentially all things a user sees in the app that *are reused throughout the app* |
  |              | /styled_components                     | shared widgets that use a common design system / theme so that the app seems consistent across screens   |
  |              | ../styled_&lt;widget_name>.dart        |                |
  |              | /theme                                 | where all theme data exists, as well as the providers that swap theme  |
  | /util        |                                      | local functions that do things like formatting |
  | /widgetbook  |                                     | single location for a 'mockup' with fake data |
  |              | app.dart                             | where we set the widgetbook generator files    |
  |              | app.widgetbook.dart                      | auto-generated widgetbook classes, but *may need to be manually updated to include things like ProviderScope()  |
  | main.dart    |                                        | the first file a Dart app runs             |

## Widgetbook

Some of the items shown in this demo harness Widgetbook version 3, which thus far has limited documentation and examples. Given how useful these packages are, we are including these packages in this 'getting started' template.

For Widgetbook, in current state, you need to install the beta versions of `widgetbook`, `widgetbook_annotations` as dependencies and `widgetbook_generator` as a dev dependency. You should also create a file for the generator (for this repo, this is in `src/widgetbook/app.dart`).

```dart
@WidgetbookApp.material(
  devices: [
    Apple.iPhone13,
    Apple.iPad9Inch,
    Desktop.desktop1080p,
    Apple.iPadMini,
    Apple.iPhone13Mini
  ],
  textScaleFactors: [1.0, 1.25, 1.5, 2],
  foldersExpanded: true,
  widgetsExpanded: true,
)
@WidgetbookTheme(name: 'Light', isDefault: true)
ThemeData getLightTheme() => appTheme();

@WidgetbookTheme(name: 'Dark')
ThemeData getDarkTheme() => appTheme(darkMode: true);
```

In current state, you don't need to bother adding `part <filename>.widgetbook.dart` to the top of the file. Also, be sure that you are importing @WidgetbookTheme annotations from `widgetbook_annotations` over `widgetbook`, since they require different inputs right now. Eventually, I anticipate Widgetbook 3 will follow the same naming conventions as `riverpod`, `freezed`, `go_router`, and the like. Once that's live, you will be very happy that you have this system in place at the outset.

Essentially, within each class, you simply need to lead with a `widgetbook_annotations` reference that has the class name and an unique string identifier. Later, the concept of `knobs` will allow you to have variable data that you can change dynamically (e.g. sliders, booleans) within the mockup. This is already active in `widgetbook`, if you want to test that now.

With the new generator, put this in front of each class that you want to have a mockup, then run `build_runner`:

```dart
@WidgetbookUseCase(name: 'Home', type: HomeView)
Widget homeView(BuildContext context) => const HomeView();
```

Also (assuming you're following the same folder structure as this project), be sure to add this to your `launch.json` file:

```json
{
    "name": "widgetbook",
    "request": "launch",
    "type": "dart",
    "deviceId": "macos",
    "program": "lib/src/widgetbook/app.widgetbook.dart",
    "flutterMode": "debug",
},
```

## Images

Images used in this example app were created using MidJourney and are available in the Creative Commons space.
