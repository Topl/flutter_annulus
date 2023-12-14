import 'package:flutter_annulus/chain/widgets/chain_info/top_chain_info_section.dart';
import 'package:flutter_annulus/shared/providers/node_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../essential_test_provider_widget.dart';
import '../../../required_test_class.dart';
import '../../../shared/mocks/node_config_mocks.dart';
import '../../../shared/utils/chain_info_utils.dart';

void main() {
  testWidgets('Avg Transaction Fee shows 0 instead of Nan', (tester) async {
    final chainInfo = getModifiedMockChainInfo(
      dataBytes: 200,
      startTimestamp: DateTime.now().millisecondsSinceEpoch,
      transactionCount: 0,
      endHeight: 100,
      eon: 600,
      era: 500,
      epoch: 400,
    );
    await tester.pumpWidget(
      await essentialTestProviderWidget(
        tester: tester,
        testScreenSize: TestScreenSizes.desktop,
        overrides: [
          nodeProvider.overrideWith(
            (ref, arg) => getMockNodeGRPCService(
              chainInfo: chainInfo,
            ),
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();

    final avgTransactionFeeKey = TopChainInfoSection.averageTransactionFeeKey(0.0);

    expect(find.byKey(avgTransactionFeeKey), findsOneWidget);
  });
}
