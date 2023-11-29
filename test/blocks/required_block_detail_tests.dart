import '../required_test_class.dart';

class RequiredBlockDetailTests extends RequiredTest {
  Future<void> Function(TestScreenSizes testScreenSize) navigateToBlockDetails;

  RequiredBlockDetailTests({
    required this.navigateToBlockDetails,
    required super.testScreenSize,
  });

  Future<void> runTests() async {
    await navigateToBlockDetails(testScreenSize);
  }
}
