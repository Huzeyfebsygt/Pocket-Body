import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [];  // Kullanıcı ve bot mesajlarını saklayacak

  // Kullanıcıdan alınan mesajı işleyip yanıt ekleyelim
  void _sendMessage() {
    if (_controller.text.isEmpty) return;

    setState(() {
      _messages.add({
        'sender': 'user',
        'message': _controller.text,
      });

      // Yapay zeka yanıtı (örnek yanıtlar)
      _messages.add({
        'sender': 'bot',
        'message': 'Bu bir test yanıtı: ${_controller.text}',
      });

      _controller.clear();  // Mesaj kutusunu temizle
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Chatbot'),
        elevation: 4.0,
      ),
      body: Column(
        children: [
          // Mesajların görselleştirilmesi
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          
          // Mesaj yazma alanı
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Mesaj yazma kutusu
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Mesajınızı yazın...',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                
                // Gönder butonu
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blueAccent),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Mesajların nasıl görüneceğini belirleyelim
  Widget _buildMessage(Map<String, String> message) {
    bool isUserMessage = message['sender'] == 'user';
    
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message['message']!,
          style: TextStyle(
            color: isUserMessage ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
