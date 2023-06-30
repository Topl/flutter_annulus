import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';

class TransactionDrawer extends StatefulWidget {
  const TransactionDrawer({super.key, this.show = false});
  final bool show;
  @override
  _TransactionDrawerState createState() => _TransactionDrawerState();
}

class _TransactionDrawerState extends State<TransactionDrawer> {
  @override
  Widget build(BuildContext context) {
    return BodyWithSideSheet(
      show: true,
      body: Container(
        color: const Color(0xffececec),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(Strings.modalSideSheetDemo),
            ElevatedButton(
                onPressed: () {
                  // setState(() {
                  //   show = !show;
                  // });
                },
                child: const Text(Strings.standardSideSheet)),
            ElevatedButton(
                onPressed: () {
                  showModalSideSheet(
                      // width: 700,
                      context: context,
                      ignoreAppBar: false,
                      body: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.face),
                            title: Text("I am on $index index"),
                            trailing: const Icon(Icons.safety_divider),
                          );
                        },
                      ));
                },
                child: const Text("Show Modal Side Sheet")),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.face),
                    title: Text("I am on $index index"),
                    trailing: const Icon(Icons.safety_divider),
                  );
                },
              ),
            )
          ],
        ),
      ),
      sheetWidth: MediaQuery.of(context).size.width / 4,
      sheetBody: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.face),
            title: Text("I am on $index index"),
            trailing: const Icon(Icons.safety_divider),
          );
        },
      ),
    );
  }
}
