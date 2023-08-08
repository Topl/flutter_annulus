import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/models/utxo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result.freezed.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult.transaction(
    Transaction transaction,
    String id,
  ) = TransactionResult;
  const factory SearchResult.block(
    Block block,
    String id,
  ) = BlockResult;

  // TODO: Implement later
  const factory SearchResult.uTxO(
    UTxO utxo,
    String id,
  ) = UTxOResult;
}
