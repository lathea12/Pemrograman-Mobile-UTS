// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:projekutslagi/components/my_button.dart';
import 'delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phoneNumber = '';
  String _pinCode = '';

  void _userTappedPay() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showDialog();
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Center(
          child: Text("Konfirmasi Pembayaran",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Nama: $_name",
                style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            Text("Nomor HP: $_phoneNumber",
                style: TextStyle(fontSize: 16, color: Colors.grey[700])),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Colors.redAccent.withOpacity(0.1)),
                ),
                child: const Text("Batalkan",
                    style: TextStyle(fontSize: 16, color: Colors.redAccent)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeliveryProgressPage(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green.withOpacity(0.1)),
                ),
                child: const Text("Lanjutkan",
                    style: TextStyle(fontSize: 16, color: Colors.green)),
              ),
            ],
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        backgroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      body: Container(
        child: Column(
          children: [
            // logo e-wallet
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child:
                  Image.asset('lib/images/logo.png', width: 100, height: 100),
            ),

            // form e-wallet
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white, // change label text color
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color:
                                Colors.white), // change border color to white
                      ),
                      errorStyle: const TextStyle(
                          color:
                              Colors.white), // change error text color to white
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) => _name = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nomor HP',
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white, // change label text color
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color:
                                Colors.white), // change border color to white
                      ),
                      errorStyle: const TextStyle(
                          color:
                              Colors.white), // change error text color to white
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    onSaved: (value) => _phoneNumber = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'PIN Code',
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white, // change label text color
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color:
                                Colors.white), // change border color to white
                      ),
                      errorStyle: const TextStyle(
                          color:
                              Colors.white), // change error text color to white
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your PIN code';
                      }
                      return null;
                    },
                    onSaved: (value) => _pinCode = value!,
                  ),
                ],
              ),
            ),

            const Spacer(),

            MyButton(
              onTap: _userTappedPay,
              text: "BAYAR",
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
