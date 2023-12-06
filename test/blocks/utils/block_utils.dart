import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/sections/details/block_details_page.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:topl_common/proto/genus/genus_rpc.pb.dart';
import 'package:vrouter/vrouter.dart';

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

BlockResponse getBlockResponse() {
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
