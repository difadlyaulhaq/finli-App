import 'package:finli_app/theme/color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final balance = "Rp. 1.000.000";
  final income = "Rp. 500.000";
  final expense = "Rp. 300.000";

  final transactions = const [
    {"title": "Gaji", "subtitle": "Pekerjaan", "amount": "2.000.000", "isIncome": true},
    {"title": "Belanja", "subtitle": "Mall", "amount": "500.000", "isIncome": false},
  ];

  final tips = const [
    {"title": "Cara mengatur keuangan", "image": "assets/gambar_carousel.png"},
    {"title": "Tips menabung cerdas", "image": "assets/gambar_carousel.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Row(
          children: const [
            Text("Halo, ", style: TextStyle(fontSize: 22, color: Colors.black)),
            Text("Riyan", style: TextStyle(fontSize: 22, color: Colors.blue)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: CircleAvatar(backgroundImage: AssetImage('assets/profile.png')),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Balance Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Riyan", style: TextStyle(color: Colors.white, fontSize: 18)),
                const SizedBox(height: 10),
                const Text("Total Balance:", style: TextStyle(color: Colors.white, fontSize: 18)),
                Text(balance, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Icon(Icons.arrow_downward, color: Colors.white, size: 20),
                    SizedBox(width: 5),
                    Text("Income", style: TextStyle(color: Colors.white)),
                    Spacer(),
                    Icon(Icons.arrow_upward, color: Colors.white, size: 20),
                    SizedBox(width: 5),
                    Text("Expense", style: TextStyle(color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(income, style: const TextStyle(color: Colors.white)),
                    const Spacer(),
                    Text(expense, style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Transaction List
          const Text("Latest Transactions", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...transactions.map((tx) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: (tx['isIncome'] as bool) ? Colors.blue[100] : Colors.red[100],
                child: Icon(
                  (tx['isIncome'] as bool) ? Icons.arrow_downward : Icons.arrow_upward,
                  color: (tx['isIncome'] as bool) ? Colors.blue : Colors.red,
                ),
              ),
              title: Text(tx['title'] as String),
              subtitle: Text(tx['subtitle'] as String),
              trailing: Text(
                "${(tx['isIncome'] as bool) ? '+' : '-'}Rp ${(tx['amount'] as String)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: (tx['isIncome'] as bool) ? Colors.green : Colors.red,
                ),
              ),
            );
          }),

          const SizedBox(height: 25),

          // Tips Carousel
          SizedBox(
            height: 180,
            child: PageView.builder(
              itemCount: tips.length,
              controller: PageController(viewportFraction: 0.8),
              itemBuilder: (context, index) {
                final tip = tips[index];
                return Container(
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(tip['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.black45,
                      child: Text(
                        tip['title']!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
