# proypet
# proypet Volviendo a github

## cambios en el main manejando el diseño

#api para obtener ciudad, país, etc


# revisar esto para mac
In addition, you need to add the Background Modes capability to your XCode project (Project > Signing and Capabilties > "+ Capability" button) and select Location Updates.

https://maps.googleapis.com/maps/api/geocode/json?latlng=-12.0166806,-77.09980399999999&key=AIzaSyAIU2POPaS1Lme5BXKIrHBm1Ohicmg9844

// SystemChrome.setPreferredOrientations([
//   DeviceOrientation.portraitUp,
//   DeviceOrientation.portraitDown,
// ]);





	<key>CFBundleDevelopmentRegion</key>
	<string>es</string>
	<!-- <string>$(DEVELOPMENT_LANGUAGE)</string> -->
	<key>CFBundleExecutable</key>
	<string>$(EXECUTABLE_NAME)</string>
	<key>CFBundleIdentifier</key>
	<string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>Proypet</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleShortVersionString</key>
	<string>$(MARKETING_VERSION)</string>
	<key>CFBundleSignature</key>
	<string>????</string>
	<key>CFBundleVersion</key>
	<string>$(CURRENT_PROJECT_VERSION)</string>
	<key>FirebaseAppDelegateProxyEnabled</key>
	<false/>
	<key>LSApplicationQueriesSchemes</key>
	<array>
		<string>comgooglemaps</string>
		<string>iosamap</string>
		<string>waze</string>
	</array>
	<key>LSRequiresIPhoneOS</key>
	<true/>

	<!-- <key>NSCameraUsageDescription</key>
	<string>$(PRODUCT_NAME) would like to use your camera</string>
	<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
	<string>This app needs access to location when open and in the background.</string>
	<key>NSLocationAlwaysUsageDescription</key>
	<string>This app needs access to location when in the background.</string>
	<key>NSLocationWhenInUseUsageDescription</key>
	<string>This app needs access to location when open.</string>
	<key>NSPhotoLibraryUsageDescription</key>
	<string>$(PRODUCT_NAME) would like access to your photo gallery</string> -->

	<key>NSCameraUsageDescription</key>
	<string>$(PRODUCT_NAME) necesita acceso a la cámara</string>
	<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
	<string>Esta aplicación necesita acceso a la ubicación cuando está abierta y en segundo plano.</string>
	<key>NSLocationAlwaysUsageDescription</key>
	<string>Esta aplicación necesita acceso a la ubicación cuando está en segundo plano.</string>
	<key>NSLocationWhenInUseUsageDescription</key>
	<string>Esta aplicación necesita acceso a la ubicación cuando está abierta.</string>
	<key>NSMicrophoneUsageDescription</key>
	<string>$(PRODUCT_NAME) necesita acceso al micrófono</string>
	<key>NSPhotoLibraryUsageDescription</key>
	<string>$(PRODUCT_NAME) necesita acceso al carrete</string>

	<key>UIBackgroundModes</key>
	<array>
		<string>fetch</string>
		<string>remote-notification</string>
	</array>
	<key>UILaunchStoryboardName</key>
	<string>LaunchScreen</string>
	<key>UIMainStoryboardFile</key>
	<string>Main</string>
	<key>UISupportedInterfaceOrientations</key>
	<array>
		<string>UIInterfaceOrientationPortrait</string>
	</array>
	<key>UISupportedInterfaceOrientations~ipad</key>
	<array>
		<string>UIInterfaceOrientationPortrait</string>
		<string>UIInterfaceOrientationPortraitUpsideDown</string>
		<string>UIInterfaceOrientationLandscapeLeft</string>
		<string>UIInterfaceOrientationLandscapeRight</string>
	</array>
	<key>UIViewControllerBasedStatusBarAppearance</key>
	<false/>
	<key>io.flutter.embedded_views_preview</key>
	<true/>

