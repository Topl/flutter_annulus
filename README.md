# Annulus Event Explorer

A Flutter web app for navigating different levels of the Topl blockchain. This Event Explorer is designed to visualize the main events of the Tetra version of the protocol: epochs, blocks and transactions.

## Starting the app

1. Install flutter on your local machine: https://docs.flutter.dev/get-started/install
2. Clone down the repo locally: https://github.com/Topl/flutter_annulus.git
3. Change into the `flutter_annulus` directory
4. Run `flutter packages pub run build_runner build --delete-conflicting-outputs` to build auto generated files
5. Run the `flutter run -d chrome` to start the app in a Chrome window

Optional:
6. If running a local node, run the envoy proxy server using the command `envoy -c envoy.yaml`