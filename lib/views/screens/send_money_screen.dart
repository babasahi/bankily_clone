import 'dart:math';
import 'package:demo_project/services/database/send_money.dart';
import 'package:flutter/material.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  void _openOtpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("إدخال رمز التحقق"),
        content: TextField(
          textAlign: TextAlign.right,
          keyboardType: TextInputType.number,
          controller: _otpController,
          decoration: const InputDecoration(
            hintText: "أدخل رمز التحقق",
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(0, 188, 213, 1),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("إلغاء"),
          ),
          TextButton(
            onPressed: () async {
              await sendMoney(
                _phoneController.text,
                double.parse(_amountController.text),
                _noteController.text,
              ).then((value) {
                if (value == 'success') {
                  Navigator.pop(context);
                  _openMoneySentDialog(
                    context,
                    _phoneController.text,
                    double.parse(_amountController.text),
                  );
                }
              });
            },
            child: const Text("تأكيد"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 188, 213, 1),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "إرسال الأموال",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromRGBO(0, 188, 213, 1),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryIcon(
                  icon: Icons.facebook,
                  label: "فيسبوك",
                  isSelected: false,
                ),
                _buildCategoryIcon(
                  icon: Icons.account_balance,
                  label: "بنك",
                  isSelected: false,
                ),
                _buildCategoryIcon(
                  icon: Icons.person,
                  label: "اسم المستخدم",
                  isSelected: false,
                ),
                _buildCategoryIcon(
                  icon: Icons.phone_android,
                  label: "رقم الهاتف",
                  isSelected: true,
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 20),

                  const Text(
                    "رقم الهاتف",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                    decoration: InputDecoration(
                      hintText: "أدخل رقم الهاتف",
                      prefixIcon: const Icon(
                        Icons.contact_phone,
                        color: Colors.orangeAccent,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 188, 213, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  const Text(
                    "المبلغ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                    decoration: const InputDecoration(
                      hintText: "أدخل المبلغ",
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 188, 213, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  const Text(
                    "ملاحظة (اختياري)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    textAlign: TextAlign.right,
                    controller: _noteController,
                    decoration: const InputDecoration(
                      hintText: "أدخل ملاحظة",
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 188, 213, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () {
              _openOtpDialog();
            },
            child: Container(
              width: double.infinity,
              height: 60,
              color: const Color(0xFFFFC107), // Amber/Yellow color
              alignment: Alignment.center,
              child: const Text(
                "إرسال",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        if (isSelected)
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 3,
            width: 40,
            color: const Color(0xFFFFC107), // Indicator color
          ),
      ],
    );
  }
}

void _openMoneySentDialog(
  BuildContext context,
  String receiverPhone,
  double amount,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      // Generate random transaction ID
      String transactionId = (100000000000 + Random().nextInt(900000000))
          .toString();
      // Get current date time
      DateTime now = DateTime.now();
      String formattedDate =
          "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";

      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              const Text(
                "النقل ناجح!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF37474F), // Dark grey
                ),
              ),
              const SizedBox(height: 20),
              // Success Icon
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.green, width: 3),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 40,
                ),
              ),
              const SizedBox(height: 20),
              // Details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      "المستفيد: $receiverPhone المبلغ المرسل: $amount MRU",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF37474F),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "معرف المعامله : $transactionId",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF37474F),
                      ),
                    ),
                    Text(
                      "التاريخ والوقت: $formattedDate",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF37474F),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Favorite
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "تعيين كمفضل",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.grey, size: 28),
                ],
              ),
              const SizedBox(height: 30),
              // Done Button
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Close SendMoneyScreen
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 188, 213, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "فعله!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
