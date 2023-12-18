import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/widgets/snackbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final snackbarProvider = Provider<Function(BuildContext)>((ref) {
  var isSnackBarVisible = false;

  return (BuildContext context) {
    if (!isSnackBarVisible) {
      CustomSnackBar.showSnackBarAndToast(context);
      isSnackBarVisible = true;
    }
  };
});
