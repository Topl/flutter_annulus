import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';

class TransactionDrawer extends HookWidget {
  const TransactionDrawer({super.key});

  final bool show = false;

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
            const Text("Modal Side sheet Demo"),
            ElevatedButton(
                onPressed: () {
                  // setState(() {
                  //   show = !show;
                  // });
                },
                child: const Text("Show Standard Side Sheet")),
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
