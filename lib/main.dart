import 'package:flutter/material.dart';
import 'screens/alarm.dart';
import 'screens/bar_chart_sample.dart';
import 'screens/login_screen.dart';
import 'screens/notes_screen.dart';
import 'screens/blog_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/habits_screen.dart';

void main() {
  runApp(MaterialApp(
    title: '40 Günde Alışkanlık',
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('40 Günde Alışkanlık')),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          // Yüksekliğe bağlı olarak sayfayı aşağı kaydırma işlemini gerçekleştir
          if (details.delta.dy > 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NextPage()),
            );
          }
        },
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  HabitCard(
                    habitName: 'Abur Cubur Azaltmak',
                    habitIcon: Icons.fastfood,
                  ),
                  HabitCard(
                    habitName: 'Dil Öğrenme',
                    habitIcon: Icons.language,
                  ),
                  HabitCard(
                    habitName: 'Kahvaltı Yapma',
                    habitIcon: Icons.breakfast_dining,
                  ),
                  HabitCard(
                    habitName: 'Telefon Bağımlılığı',
                    habitIcon: Icons.phone_iphone,
                  ),
                  HabitCard(
                    habitName: 'Sigara Bırakma',
                    habitIcon: Icons.smoking_rooms,
                  ),
                  HabitCard(
                    habitName: 'Olumlama Yapma',
                    habitIcon: Icons.thumb_up,
                  ),
                  HabitCard(
                    habitName: 'Erken Uyanma',
                    habitIcon: Icons.access_time,
                  ),
                  HabitCard(
                    habitName: 'Ders Çalışma',
                    habitIcon: Icons.book,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                child: Text('Alışkanlık Ekle'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddHabitPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.note_sharp,
                semanticLabel: "Notlarım",
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.alarm,
                semanticLabel: "Alarm",
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlarmPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HabitCard extends StatefulWidget {
  final String habitName;
  final IconData habitIcon;

  HabitCard({required this.habitName, required this.habitIcon});

  @override
  _HabitCardState createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  bool isFavorite = false; // Kalbin durumu için bool değeri

  void _navigateToDetailPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HabitDetailPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: _navigateToDetailPage, // İki kez tıklama gesture'ı
        onDoubleTap: _navigateToDetailPage, // İki kez tıklama gesture'ı
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.habitIcon,
                    size: 48.0,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.habitName,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    // Kalp butonuna basıldığında kalbin durumunu değiştir
                    isFavorite = !isFavorite;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(isFavorite
                          ? 'Favorilere eklendi'
                          : 'Favorilerden kaldırıldı'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HabitDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alışkanlık Detayı')),
      body: Center(
        child: Text('Alışkanlık detay sayfası'),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Page')),
      body: Center(
        child: Text('Bu bir sonraki sayfadır.'),
      ),
    );
  }
}

class AddHabitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alışkanlık Ekle')),
      body: Center(
        child: Text('Alışkanlık ekleme sayfası'),
      ),
    );
  }
}
