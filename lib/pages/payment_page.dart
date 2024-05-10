import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:projekutslagi/components/my_button.dart';

import 'delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //user ingin konfirmasi bayar
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      //hanya tampilkan dialog jika form nya valid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Konfirmasi Pembayaran"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Nomer Kartu:$cardNumber"),
                Text("Tanggal Kadaluarsa:$expiryDate"),
                Text("Nama Pemilik:$cardHolderName"),
                Text("CVV:$cvvCode"),
              ],
            ),
          ),
          actions: [
            //button batalkan
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batalkan"),
            ),

            //lanjutkan
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryProgressPage(),
                  ),
                );
              },
              child: const Text("Lanjutkan"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Bayar"),
      ),
      body: Column(
        children: [
          //kartu kredit
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),

          // form kartu kredit
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            },
            formKey: formKey,
          ),

          const Spacer(),

          MyButton(
            onTap: userTappedPay,
            text: "Bayar",
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
