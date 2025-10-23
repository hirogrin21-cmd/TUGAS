import 'package:flutter/material.dart';

// Jalankan aplikasi
void main() {
  runApp(MyApp());
}

// Ini adalah root aplikasi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profil Diri (Kombinasi Widget)'),
          backgroundColor: Colors.deepPurple, // Ganti warna biar beda
        ),
        // Kita beri background abu-abu biar Kartu-nya terlihat jelas
        backgroundColor: Colors.grey[100],
        body: Center(
          // Kita panggil widget utamanya di sini
          child: MyProfilePage(),
        ),
      ),
    );
  }
}

// --- Ini Desain Widget Kombinasi (Sesuai Tugas Reza) ---
// Membuat Halaman Profil menggunakan Column, Row, Image, Text, Icon, dan Button
class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Bungkus dalam container agar bisa diatur
      padding: const EdgeInsets.all(24.0),
      margin: const EdgeInsets.all(16.0),
      width: double.infinity, // Lebar penuh
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      
      // --- LAYOUT COLUMN UTAMA (Vertikal) ---
      // Menumpuk Foto, Teks, Tombol, dan Info Kontak
      child: Column(
        mainAxisSize: MainAxisSize.min, // Bikin Column sependek mungkin
        children: [
          
          // 1. WIDGET IMAGE (Pakai CircleAvatar)
          // Pakai NetworkImage biar Reza tidak pusing soal pubspec.yaml
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey[200],
            // --- KODE DIGANTI DI SINI ---
            // Yg lama: backgroundImage: NetworkImage(
            //   'https://placehold.co/150x150/663399/FFFFFF?text=RA' // Placeholder inisial
            // ),
            // Yg baru: Pakai aset lokal
            backgroundImage: AssetImage('assets/images/pasfoto.jpg'),
            // --- SELESAI GANTI ---
          ),
          
          SizedBox(height: 16),
          
          // 2. WIDGET TEXT (Nama)
          Text(
            'Reza Albar', // Nama Reza
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          
          SizedBox(height: 8),
          
          // 3. WIDGET TEXT (Deskripsi)
          Text(
            'Mahasiswa Teknik Informatika | Flutter Developer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          
          SizedBox(height: 24),
          
          // --- LAYOUT ROW DIMULAI DI SINI (Horizontal) ---
          // Menggabungkan Button + Icon untuk link media sosial
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Posisikan di tengah
            children: [
              // 4. WIDGET BUTTON (Kombinasi Icon + Text)
              ElevatedButton.icon(
                icon: Icon(Icons.code, size: 18), // 5. WIDGET ICON
                label: Text('GitHub'),
                onPressed: () { print('Tombol GitHub ditekan'); },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white, // Warna teks dan ikon
                ),
              ),
              
              SizedBox(width: 12),
              
              // 6. WIDGET BUTTON LAINNYA
              ElevatedButton.icon(
                icon: Icon(Icons.link, size: 18), // 7. WIDGET ICON
                label: Text('LinkedIn'),
                onPressed: () { print('Tombol LinkedIn ditekan'); },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
          
          SizedBox(height: 24),
          
          // Garis pemisah
          Divider(color: Colors.grey[300]),
          
          SizedBox(height: 16),
          
          // --- LAYOUT ROW LAINNYA ---
          // Menggabungkan Icon dan Text untuk Info Kontak
          // Ini adalah 'Column' di dalam 'Column', tapi tiap item adalah 'Row'
          
          // 8. KOMBINASI ROW (Icon + Text)
          InfoRow(
            icon: Icons.email_outlined,
            text: 'rezalbar@gmail.com',
            color: Colors.deepPurple,
          ),
          
          SizedBox(height: 12),
          
          // 9. KOMBINASI ROW (Icon + Text)
          InfoRow(
            icon: Icons.phone_android_outlined,
            text: '+62 812 3456 7890',
            color: Colors.green[700]!,
          ),
          
          SizedBox(height: 12),
          
          // 10. KOMBINASI ROW (Icon + Text)
          InfoRow(
            icon: Icons.location_on_outlined,
            text: 'Sidoarjo, Indonesia',
            color: Colors.red[600]!,
          ),
        ],
      ),
    );
  }
}


// --- Widget Kustom (Biar Rapi) ---
// Ini adalah widget untuk membuat baris (Icon + Text)
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const InfoRow({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // --- LAYOUT ROW ---
    return Row(
      children: [
        // WIDGET ICON
        Icon(icon, color: color, size: 22),
        SizedBox(width: 16),
        // WIDGET TEXT
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}


