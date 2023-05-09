import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/transactions/sections/transactions.dart';

class TransactionTabBarView extends StatelessWidget {
  const TransactionTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Spacing(),
                  SizedBox(
                      width: 172, child: CustomTextLeft(desc: 'Txn Hash/ID')),
                  SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: '0x5be9d701Byd24neQfY1vXa987a'),
                ],
              ),
              Row(
                children: const [
                  Spacing(),
                  SizedBox(
                      width: 172, child: CustomTextLeft(desc: 'Proposition')),
                  SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: '0x736e345d784cf4c')
                ],
              ),
              Row(
                children: const [
                  Spacing(),
                  SizedBox(width: 172, child: CustomTextLeft(desc: 'Status')),
                  SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: 'Confirmed')
                ],
              ),
              const SizedBox(
                // maximum width and draw line
                width: double.infinity,
                child: Divider(
                  color: Color(0xFFE7E8E8),
                  thickness: 2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    'Block',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Rational Display',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: const [
                  Spacing(),
                  SizedBox(width: 172, child: CustomTextLeft(desc: 'Height')),
                  SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: '17,321')
                ],
              ),
              Row(
                children: const [
                  Spacing(),
                  SizedBox(width: 172, child: CustomTextLeft(desc: 'Slot')),
                  SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: '1,091')
                ],
              ),
              const SizedBox(
                // maximum width and draw line
                width: double.infinity,
                child: Divider(
                  color: Color(0xFFE7E8E8),
                  thickness: 2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Spacing(),
                  SizedBox(width: 172, child: CustomTextLeft(desc: 'Type')),
                  SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: 'Transfer')
                ],
              ),
              Row(
                children: const [
                  Spacing(),
                  SizedBox(
                      width: 172, child: CustomTextLeft(desc: 'Payment Fee')),
                  SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: '3.7 LVL')
                ],
              ),
              Row(
                children: const [
                  Spacing(),
                  SizedBox(
                      width: 172,
                      child: CustomTextLeft(desc: 'Broadcast Timestamp')),
                  SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: '16:32:01')
                ],
              ),
              Row(
                children: const [
                  Spacing(),
                  SizedBox(
                      width: 172,
                      child: CustomTextLeft(desc: 'Confirmed Timestamp')),
                  SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: 'UTC 16:34:51')
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Spacing(),
                SizedBox(width: 172, child: CustomTextLeft(desc: 'Quantity')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: '413113 / 64.31'),
              ],
            ),
            Row(
              children: const [
                Spacing(),
                SizedBox(width: 172, child: CustomTextLeft(desc: 'Name')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: 'Topl / Allie'),
              ],
            ),
            Row(
              children: const [
                Spacing(),
                SizedBox(width: 172, child: CustomTextLeft(desc: 'From')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: '3m21ucZ0pFyvxa1by9dnE2q87e3P6ic'),
              ],
            ),
            Row(
              children: const [
                Spacing(),
                SizedBox(width: 172, child: CustomTextLeft(desc: 'To')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: '7bY6Dne54qMU12cz3oPF4yVx5aG6a'),
              ],
            )
          ]),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const Center(
            child: CustomTextLeft(desc: 'IO Txn Details'),
          ),
        )
      ],
    );
  }
}
