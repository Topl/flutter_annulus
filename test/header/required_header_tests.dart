import '../required_test_class.dart';

class RequiredHeaderTests extends RequiredTest {
  Future<void> Function(TestScreenSizes testScreenSize) clickFaucetLink;

  RequiredHeaderTests({
    required this.clickFaucetLink,
    required super.testScreenSize,
  });

  Future<void> runTests() async {
    await clickFaucetLink(testScreenSize);
  }
}
