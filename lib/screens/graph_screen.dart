import 'package:flutter/material.dart';
import '../widgets/app_menu.dart';

class GraphScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Grafikler ve Görselleştirme'),
        elevation: 4.0,
      ),
      drawer: AppMenu(),  // Sol menü
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Başlık
            Text(
              'Aylık Harcamalar Grafiği',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),

            // Grafik Alanı (Şu an metin ile simüle ediliyor)
            _buildChartContainer(),

            SizedBox(height: 40),

            // Aksiyon Butonları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton('Gelir/Gider Ekle', Icons.add, context),
                _buildActionButton('Dashboard', Icons.home, context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Grafik Alanı Kartı
  Widget _buildChartContainer() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 300,
        width: double.infinity,
        color: Colors.grey[200],
        child: Center(
          child: Text(
            'Grafik Burada Olacak',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Aksiyon Butonları Yapıcı Fonksiyon
  Widget _buildActionButton(String label, IconData icon, BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        if (label == 'Gelir/Gider Ekle') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GraphScreen()), // Bu ekrandan gelir gider ekranına yönlendirme yapılabilir
          );
        } else if (label == 'Dashboard') {
          Navigator.pop(context); // Dashboard'a geri git
        }
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
