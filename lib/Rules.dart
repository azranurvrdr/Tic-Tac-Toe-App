import 'package:flutter/material.dart';

class RulesPage extends StatefulWidget {
  const RulesPage({super.key});

  @override
  State<RulesPage> createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: const Text(
          "Rules",
          style: TextStyle(
            color: Colors.white, //AppBarın yazısı beyaz
          ),
        ),

        iconTheme: const IconThemeData(
            color: Colors.white  //AppBardaki tüm ikonların rengi beyaz
        ),
      ),
      body: Center(


        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Expanded(
        child: ListView(
            children: const [
              ListTile(
                title: Text(
                    '1) Oyunu kazanmak için oyuncunun kendi üç taşının dikey, yatay veya çapraz olarak dizmesi gerekir.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                ),
              ),
              ListTile(
                title: Text(
                    '2) Her oyuncu sırası gelidiğinde sadece bir hamle yapabilir.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                ),
              ),
              ListTile(
                title: Text(
                    '3) Oynanan taşlar geri alınmaz.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                ),
              ),
              ListTile(
                title: Text(
                    '4) Oyunda süre sınırlaması yoktur.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                ),
              ),
              ListTile(
                title: Text(
                    '5) Oyunculardan birisi kazandığında kendisine ayit scor tablosunda 1 puan alır.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                ),
              ),
              ListTile(
                title: Text(
                    '6) Sıfırlama düğmesine basıldığında oyun tahtası sıfırlanır ama scor biilgileri kayıtlı kalır.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                ),
              ),
              ListTile(
                title: Text(
                    '7) Oyun sayfasından çıkıldığı an scorlarla birlikte tüm oyun sıfırlanır',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                ),
              ),


            ],
          ),
        ),

    ],
        ),
      ),
    );
  }
}
