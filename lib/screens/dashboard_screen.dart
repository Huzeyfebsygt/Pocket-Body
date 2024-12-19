import 'package:flutter/material.dart';
import '../widgets/app_menu.dart';  // Menü için widget
import 'income_expense_screen.dart';  // Gelir/Gider Ekranı
import 'graph_screen.dart';  // Grafik Ekranı
import 'saving_goal_screen.dart';  // Tasarruf Hedefi Ekranı
import 'chatbot_screen.dart';  // Chatbot Ekranı

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Pocket Buddy'),
        elevation: 4.0,
      ),
      drawer: AppMenu(),  // Sol menü
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Başlık
            Text(
              'Gelir ve Gider Özetiniz',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),

            // Gelir Kartı
            _buildFinancialCard('Gelir', '5000 ₺', Colors.green),
            SizedBox(height: 16),

            // Gider Kartı
            _buildFinancialCard('Gider', '3000 ₺', Colors.red),
            SizedBox(height: 16),

            // Tasarruf Hedefi Kartı
            _buildFinancialCard('Tasarruf Hedefi', '1000 ₺', Colors.orange),
            SizedBox(height: 30),

            // Aksiyon Butonları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton('Gelir/Gider Ekle', Icons.add, context, IncomeExpenseScreen()),
                _buildActionButton('Grafikler', Icons.bar_chart, context, GraphScreen()),
                _buildActionButton('Hedefler', Icons.trending_up, context, SavingsGoalScreen()),
              ],
            ),
          ],
        ),
      ),

      // Chatbot Erişimi İçin Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatbotScreen()),
          );
        },
        child: Icon(Icons.chat),
        backgroundColor: Colors.blueAccent,
        tooltip: 'Chatbot',
      ),
    );
  }

  // Finansal Kart Yapıcı Fonksiyon
  Widget _buildFinancialCard(String title, String amount, Color color) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        leading: Icon(
          Icons.account_balance_wallet,
          color: color,
          size: 40,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          amount,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }

  // Aksiyon Butonları Yapıcı Fonksiyon
  Widget _buildActionButton(String label, IconData icon, BuildContext context, Widget screen) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        iconColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
