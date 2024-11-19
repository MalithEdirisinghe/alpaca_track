import Flutter
import UIKit
import GoogleMaps // Import the Google Maps module

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Provide your Google Maps API key
    GMSServices.provideAPIKey("AIzaSyDVylj9N1itdrwcLQ4eWOAm4odHVIGxZGU") // Replace YOUR_API_KEY with your actual Google Maps API key
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
