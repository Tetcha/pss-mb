import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/add_wallet.controller.dart';
import 'package:pss_m/core/form/text_field.dart';
import 'package:pss_m/widgets/title/title.dart';

class AddBalanceScreen extends StatelessWidget {
  const AddBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add wallet"),
      ),
      body: GetBuilder<AddWalletController>(
        init: AddWalletController(),
        builder: (_) => Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(
                    color: Theme.of(context).primaryColor,
                    child: const SectionTitle(label: 'Payment method: '),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.network(
                            _.momoLogoUrl,
                            width: 100,
                            height: 100,
                          ),
                          Text(
                            "MoMo",
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(
                    color: Theme.of(context).primaryColor,
                    child: const SectionTitle(label: 'Payment information: '),
                  ),
                  TextFieldC(
                    name: "amount",
                    label: "Amount",
                    keyBoardType: TextInputType.number,
                    controller: _.amountController,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40), // NEW
                    ),
                    onPressed: _.onHandleSubmit,
                    child: const Text('Add wallet'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
