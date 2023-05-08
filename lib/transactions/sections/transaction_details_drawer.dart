import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/transactions/sections/transaction_tabbar_view.dart';

class TransactionDetailsDrawer extends StatelessWidget {
  const TransactionDetailsDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          centerTitle: false,
          titleSpacing: 10.0,
          title: const Padding(
            padding: EdgeInsets.all(40.0),
            child: Text(
              'Transaction Details',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Rational Display',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          toolbarHeight: 80,
          toolbarTextStyle: const TextStyle(color: Colors.black),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: const TabBar(
                  labelColor: Color(0xFF282A2C),
                  labelStyle: TextStyle(
                      fontFamily: 'Rational Display',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    color: Color(0xFFE7E8E8),
                  ),
                  padding: EdgeInsets.only(left: 30.0, top: 8.0),
                  tabs: [
                    SizedBox(
                      width: 100.0,
                      height: 40.0,
                      child: Tab(text: 'Overview'),
                    ),
                    SizedBox(
                      width: 100.0,
                      height: 40.0,
                      child: Tab(text: 'Summary'),
                    ),
                    SizedBox(
                      width: 140.0,
                      height: 40.0,
                      child: Tab(text: 'IO Txn Details'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TransactionTabBarView(),
      ),
    );
  }
}
