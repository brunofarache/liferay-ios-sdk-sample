![Liferay Mobile SDK logo](https://github.com/liferay/liferay-mobile-sdk/raw/master/logo.png)

## Liferay iOS SDK Sample

This is the sample application for the
[Liferay iOS SDK](https://github.com/liferay/liferay-mobile-sdk/tree/master/ios).

It's a simple app that displays users in a table view. By clicking on an user,
it will display its contact details such as: name, email, birthday and phones.
By default, it uses the following credentials to authenticate:

Email: `test@liferay.com`; password: `test`; server: `http://localhost:8080`.

You can change these values in the [SettingsUtil.m](Util/SettingsUtil.m) class.

Most of the interesting code are in
[MainViewController.m](Controller/MainViewController.m) and
[DetailsViewController.m](Controller/DetailsViewController.m). In these classes
you can see how to create sessions and call portal services.

If you want to make asynchronous requests, take a look on how
[ContactCallback.m](Callback/ContactCallback.m) is used.

### Build

This project uses CocoaPods to fetch dependencies and the Liferay iOS SDK
itself. If you don't want to use CocoaPods, you can just download the
[iOS SDK source code](https://github.com/liferay/liferay-mobile-sdk/releases),
unzip and add all files to your Xcode project.

In order to build with CocoaPods, you have to:

1. Install CocoaPods.

2. Run `$ pod install` from the project root folder.

3. This will download the latest version of the SDK and create a .xcworkspace
file, use it to open your project in Xcode.

For more information on how CocoaPods works, read their
[documentation](http://guides.cocoapods.org/using/index.html).
