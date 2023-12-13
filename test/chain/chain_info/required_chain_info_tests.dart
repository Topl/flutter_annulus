import '../../required_test_class.dart';

class RequiredChainInfoTests extends RequiredTest {
  Future<void> Function(TestScreenSizes testScreenSize) loadChainInfoSection;

  RequiredChainInfoTests({
    required this.loadChainInfoSection,
    required super.testScreenSize,
  });

  Future<void> runTests() async {
    await loadChainInfoSection(testScreenSize);
  }
}
