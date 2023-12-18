import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/sections/block_slider.dart';
import 'package:flutter_annulus/blocks/sections/details/block_details_page.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/utils/decode_id.dart';
import 'package:flutter_annulus/shared/widgets/copy_to_clipboard.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:topl_common/proto/consensus/models/block_header.pb.dart';
import 'package:topl_common/proto/consensus/models/block_id.pb.dart';
import 'package:topl_common/proto/consensus/models/eligibility_certificate.pb.dart';
import 'package:topl_common/proto/consensus/models/operational_certificate.pb.dart';
import 'package:topl_common/proto/consensus/models/staking.pb.dart';
import 'package:topl_common/proto/genus/genus_rpc.pb.dart';
import 'package:topl_common/proto/node/models/block.pb.dart';
import 'package:vrouter/vrouter.dart';

import '../../shared/utils/transaction_utils.dart';

confirmBlockDetailsRoute({
  required WidgetTester tester,
  required String blockId,
}) {
  final BuildContext context = tester.element(find.byKey(HomeScreen.homeScreenKey));
  final vRouter = VRouter.of(context);

  final pathParams = vRouter.pathParameters;

  // Expect the chainId is the only path parameter
  expect(pathParams.length == 2, true);

  // Expect the pathParams to contain chainId
  expect(pathParams.containsKey(HomeScreen.chainIdParam), true);

  // Expect the chainId to be the mock chain
  expect(pathParams[HomeScreen.chainIdParam] == const Chains.dev_network().urlName, true);

  // Expect the pathParams to contain blockId
  expect(pathParams.containsKey(BlockDetailsPage.blockIdParam), true);

  // Expect the blockId to be the mock block
  expect(pathParams[BlockDetailsPage.blockIdParam] == blockId, true);
}

swipeBlocks(WidgetTester tester, int itemCount) async {
  int i = 1;
  while (i != itemCount) {
    await tester.tap(find.byKey(BlockPlaceHolder.rightButtonKey), warnIfMissed: false);
    await tester.pumpAndSettle();
    i++;
  }
}

validateBlockDetails(WidgetTester tester, String blockId) async {
  await tester.ensureVisible(find.text('Block Details'));

  expect(find.text(Strings.blockId), findsOneWidget);

  expect(find.text(Strings.status), findsOneWidget);

  expect(find.text(Strings.statusConfirmed), findsOneWidget);
}

validateBlockDetailsTabletMobile(WidgetTester tester, String blockId) async {
  await tester.ensureVisible(find.text('Block Details'));

  expect(find.text(Strings.blockId), findsAtLeastNWidgets(2));

  expect(find.text(Strings.status), findsOneWidget);

  expect(find.text(Strings.statusConfirmed), findsOneWidget);

  expect(find.byKey(CopyToClipboard.copyIconKey), findsAtLeastNWidgets(2));

  await tester.tap(find.byKey(CopyToClipboard.copyIconKey).first, warnIfMissed: false);

  await tester.pumpAndSettle();

  expect(find.text('Copied to Clipboard'), findsAtLeastNWidgets(2));
}

BlockResponse getBlockResponse({
  String? blockId,
  String? transactionId,
}) {
  blockId ??= createId();
  transactionId ??= createId();
  return BlockResponse(
    block: FullBlock(
      header: BlockHeader(
        address: StakingAddress(value: [1, 2, 3, 4, 5, 6, 7, 8]),
        height: Int64(1),
        bloomFilter: [],
        eligibilityCertificate: EligibilityCertificate(),
        headerId: BlockId(value: encodeId(blockId)),
        metadata: [],
        operationalCertificate: OperationalCertificate(),
        parentHeaderId: BlockId(value: [1, 2, 3, 4, 5, 6, 7, 8]),
        parentSlot: Int64(1),
        slot: Int64(1),
        timestamp: Int64(DateTime.now().millisecondsSinceEpoch),
        txRoot: [],
      ),
      fullBody: FullBlockBody(
        transactions: List.generate(
          10,
          (index) => getMockIoTransaction(
            id: '$transactionId',
          ),
        ),
      ),
    ),
  );
}
