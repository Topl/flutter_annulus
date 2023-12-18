import '../required_test_class.dart';

class RequiredBlockDetailSliderTests extends RequiredTest {
  Future<void> Function(TestScreenSizes testScreenSize) navigateToBlockDetails;

  RequiredBlockDetailSliderTests({
    required this.navigateToBlockDetails,
    required super.testScreenSize,
  });

  Future<void> runTests() async {
    await navigateToBlockDetails(testScreenSize);
  }
}
