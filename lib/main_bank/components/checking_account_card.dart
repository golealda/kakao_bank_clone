import 'package:flutter/material.dart';
import 'package:voice_bank/history/history.dart';
import 'package:voice_bank/transfer/recent_transfer.dart';

class CheckingAccountCard extends StatelessWidget {
  const CheckingAccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffFAE04B),
      ),
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '박시형의 통장 ★',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '0000-0000-0000',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.more_vert,
                  size: 25,
                  color: Colors.black.withOpacity(0.4),
                )
              ],
            ),
            Text(
              "0 원",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecentTransfer(),
                        ),
                      );
                    },
                    child: Text(
                      "이체",
                      style: TextStyle(
                        color: Color.fromARGB(255, 6, 6, 6),
                      ),
                    ),
                  ),
                ),
                Text(
                  "|",
                  style: TextStyle(
                    color: Color(0xffD8C441),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryPage(),
                        ),
                      );
                    },
                    child: Text(
                      "내역",
                      style: TextStyle(
                        color: Color.fromARGB(255, 6, 6, 6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
