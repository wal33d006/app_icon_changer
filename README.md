# app_icon_changer

Change your app icon right from your Flutter code! **[iOS only]**

*Runs on iOS 10.3 and above*

## Usage

### Settings for iOS
- Navigate to iOS folder in your Flutter app.
- Right click on Runner folder and add a new directory named *App Icons*
- Add your icons in the folder
- Right click on the folder you just added and open it in Finder
- Now open your iOS module in XCode
- You won't find your folder inside XCode
- Drag the folder from Finder under the Runner folder (Now XCode knows you 
added a folder)
- Open Info.plist as source code and add the following code

```
<key>CFBundleIcons</key>
    <dict>
        <key>CFBundleAlternateIcons</key>
        <dict>
            <key>icon-white</key>
            <dict>
                <key>UIPrerenderedIcon</key>
                <string>NO</string>
                <key>CFBundleIconFiles</key>
                <array>
                    <string>icon-white</string>
                </array>
            </dict>
            <key>icon-black</key>
            <dict>
                <key>UIPrerenderedIcon</key>
                <string>NO</string>
                <key>CFBundleIconFiles</key>
                <array>
                    <string>icon-black</string>
                </array>
            </dict>
        </dict>
        <key>CFBundlePrimaryIcon</key>
        <dict>
            <key>CFBundleIconFiles</key>
            <array>
                <string>icon</string>
            </array>
        </dict>
        <key>UINewsstandIcon</key>
        <dict>
            <key>CFBundleIconFiles</key>
            <array>
                <string></string>
            </array>
            <key>UINewsstandBindingEdge</key>
            <string>UINewsstandBindingEdgeLeft</string>
            <key>UINewsstandBindingType</key>
            <string>UINewsstandBindingTypeMagazine</string>
        </dict>
    </dict>
```

Replace *icon-white* and *icon-black* with your icon names. You can also add more
keys depending on the number of icons you want to keep.

### Dart side
Add the dependency in pubspec.yaml and call the package through code like this:
```
Future<void> setAppIcon(String name) async {
    try {
      await AppIconChanger.changeIcon(name);
    } on PlatformException {
      print('Failed to change app icon');
    }
    if (!mounted) return;
  }
```