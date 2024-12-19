import 'package:flutter/material.dart';
import '../widgets/app_menu.dart';

class IncomeExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Gelir/Gider Ekle"),
        elevation: 4.0,
      ),
      drawer: AppMenu(),  // Sol menü
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Başlık
            Text(
              'Gelir/Gider Bilgilerini Girin',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),

            // Miktar Giriş Alanı
            _buildInputField('Miktar', TextInputType.number),

            SizedBox(height: 16),

            // Kategori Giriş Alanı
            _buildInputField('Kategori (örneğin, Yiyecek)', TextInputType.text),

            SizedBox(height: 40),

            // Ekle Butonu
            _buildAddButton(context),
          ],
        ),
      ),
    );
  }

  // Giriş alanı (Miktar veya Kategori)
  Widget _buildInputField(String label, TextInputType inputType) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          keyboardType: inputType,
          decoration: InputDecoration(
            labelText: label,
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

  // Ekle Butonu
  Widget _buildAddButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Ekleme işlemi yapılacak
      },
      child: Text(
        'Ekle',
        style: TextStyle(fontSize: 18),
      ),
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
