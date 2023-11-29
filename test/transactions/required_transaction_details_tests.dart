import '../required_test_class.dart';

class RequiredTransactionDetailTests extends RequiredTest {
  Future<void> Function(TestScreenSizes testScreenSize) navigateToTransactionDetails;

  RequiredTransactionDetailTests({
    required this.navigateToTransactionDetails,
    required super.testScreenSize,
  });

  Future<void> runTests() async {
    await navigateToTransactionDetails(testScreenSize);
  }
}
