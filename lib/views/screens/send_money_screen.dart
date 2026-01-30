import 'package:flutter/material.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 188, 213, 1),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "إرسال الأموال",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Header with Category Icons
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

          // Form Fields
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 20),

                  // Phone Number Field
                  const Text(
                    "رقم الهاتف",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.phone,
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

                  // Amount Field
                  const Text(
                    "المبلغ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
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

                  // Note Field
                  const Text(
                    "ملاحظة (اختياري)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    textAlign: TextAlign.right,
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

          // Send Button
          InkWell(
            onTap: () {
              // Handle Send Action
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
