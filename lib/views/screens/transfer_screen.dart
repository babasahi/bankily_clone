import 'package:demo_project/views/screens/send_money_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.28,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 188, 213, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.transparent,
                      ),

                      Text(
                        'تحويل الأموال',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      TransferOption(
                        title: 'طلب المال',
                        imageAsset:
                            'assets/icons/fundtransfer_requestmoney.png',
                        color: Color.fromRGBO(254, 193, 11, 1),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SendMoneyScreen(),
                            ),
                          );
                        },
                        child: TransferOption(
                          title: 'ارسل المال',
                          imageAsset: 'assets/icons/fundtransfer_sendmoney.png',
                          color: Color.fromRGBO(3, 133, 150, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              child: Center(
                child: Text(
                  'التحويل السريع',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 22,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/ic_qr.png',
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.1,
                      color: Color.fromRGBO(0, 188, 213, 1),
                    ),
                    Text('رمز QR'),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              child: Center(
                child: Text(
                  'اللوحة',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Text(
              'قم بإنشاء مجموعة جديدة أو حدد مجموعة حالية لتقسيم المبلغ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.height * 0.13,
              child: DottedBorder(
                options: RectDottedBorderOptions(
                  color: Color.fromRGBO(0, 188, 213, 1),
                  strokeWidth: 2,
                  dashPattern: [2, 2],
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Color.fromRGBO(0, 188, 213, 1),
                    size: 38,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransferOption extends StatelessWidget {
  const TransferOption({
    super.key,
    required this.title,
    required this.imageAsset,
    required this.color,
  });

  final String title;
  final String imageAsset;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: RotatedBox(
              quarterTurns: 2,
              child: Image.asset(
                imageAsset,
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
