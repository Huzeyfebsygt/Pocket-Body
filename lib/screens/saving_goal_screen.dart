import 'package:flutter/material.dart';
import '../widgets/app_menu.dart';

class SavingsGoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Tasarruf Hedefi'),
        elevation: 4.0,
      ),
      drawer: AppMenu(),  // Sol menü
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Başlık
            Text(
              'Tasarruf Hedefi Takibi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),

            // Tasarruf Hedefi Girişi
            _buildGoalInputField(),

            SizedBox(height: 40),

            // Tasarruf Durumu
            _buildSavingStatus(),

            SizedBox(height: 40),

            // Hedef Tamamlama Butonu
            _buildCompleteGoalButton(context),
          ],
        ),
      ),
    );
  }

  // Tasarruf Hedefi Giriş Alanı
  Widget _buildGoalInputField() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Tasarruf Hedefinizin Miktarı (₺)',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
          ),
        ),
      ),
    );
  }

  // Tasarruf Durumu Gösterimi
  Widget _buildSavingStatus() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mevcut Tasarruf Durumunuz:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            // Mevcut tasarruf durumu
            LinearProgressIndicator(
              value: 0.4,  // Bu değeri dinamik hale getirebilirsiniz
              backgroundColor: Colors.grey[300],
              color: Colors.green,
            ),
            SizedBox(height: 10),
            Text(
              '₺400 / ₺1000',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hedef Tamamlama Butonu
  Widget _buildCompleteGoalButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Hedef tamamlama işlemi yapılacak
      },
      child: Text(
        'Hedefi Tamamla',
        style: TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        iconColor: Colors.green, // Hedef tamamlandığında yeşil renk
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
