import 'package:flutter/material.dart';
import 'package:voice_bank/history/history_appbar.dart';
import 'package:voice_bank/history/account_balance.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: const HistoryAppbar(
        title: '박시형의 통장',
      ),
      body: Column(
  children: [
    const AccountBalance(),
    Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 16),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(
                index % 2 == 0 ? Icons.arrow_downward : Icons.arrow_upward,
                color: index % 2 == 0 ? Colors.green : Colors.red,
              ),
              title: Text(
                index % 2 == 0 ? '입금 ${index + 1}' : '출금 ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('2024-02-09 · 12:00'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    index % 2 == 0 ? '+10,000원' : '-5,000원',
                    style: TextStyle(
                      color: index % 2 == 0 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('잔액: 1,000,000원', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    ),
  ],
)
    );
  }
}
