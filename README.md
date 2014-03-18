![Liferay Mobile SDK logo](https://github.com/liferay/liferay-mobile-sdk/raw/master/logo.png)

## Liferay iOS SDK Sample

This is the sample application for the [Liferay iOS SDK](https://github.com/liferay/liferay-mobile-sdk/tree/master/ios).

It's a simple app that displays users in a table view. By clicking on an user, it will display its contact details such as: name, email, birthday and phones. By default, it uses the following credentials to authenticate:

Email: `test@liferay.com`

Password: `test`

Server: `http://localhost:8080`

You can change these values in the [SettingsUtil.m](Util/SettingsUtil.m) class.

Most of the interesting code are in [MainViewController.m](Controller/MainViewController.m) and [DetailsViewController.m](Controller/DetailsViewController.m). In this classes you can see how to create sessions and call portal services.

If you want to make asynchronous requests, take a look on how [ContactCallback.m](Controller/ContactCallback.m) is used.

### Build

This projects uses CocoaPods to fetch dependencies and the Liferay iOS SDK, in order to build it, you have to:

1. Install CocoaPods.

2. Run `$ pod install`.

3. This will download the latest version of the SDK and create a .xcworkspace
file, use that file to open your project in XCode.

For more information on how CocoaPods works, read their
[documentation](http://guides.cocoapods.org/using/index.html).

If you don't really want to use CocoaPods, you can just download the iOS SDK zip, unzip into your project and add all files to you XCode project with `Add files to ...`.
