import 'package:flutter/material.dart';
import 'Rules.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<String> boxes = List.filled(9, '');  //Her kutunun başlangıç durumu boş
  String currentPlayer = 'X';  //oyun X ile başlar
  String winner = '';  //kazanma durumu için
  int playerXWins = 0; // X in kazanma sayısı
  int playerOWins = 0; // O nun kazanma sayısı


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget> [
            //Drawerın içeriği
            DrawerHeader(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Tic Tac Toe',
                  style:
                  TextStyle(
                      fontSize: 40,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),

            TextButton(
              child: Text(
                'Back to Login Page',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: (){
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
              ),
            ),

            TextButton(
              child: Text(
                'Rules Page',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RulesPage()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
              ),
            ),

          ],
        ),
      ),


      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Text(
          "Tic Tac Toe",
          style: TextStyle(
            color: Colors.white, //AppBarın yazısı beyaz
          ),
        ),

        iconTheme: IconThemeData(
            color: Colors.white  //AppBardaki tüm ikonların rengi beyaz
        ),
      ),




      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Scor bilgileri
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Player X: $playerXWins',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Player O: $playerOWins',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),



            //Oyun tahtası
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //3x3 boyutunda
                crossAxisSpacing: 8.0, //yatay boşluk
                mainAxisSpacing: 8.0, //dikey boşluk
              ),
              itemCount: 9, //toplam kutu sayısı
              shrinkWrap: true,  //?
              itemBuilder: (BuildContext context, int index) {
                //Her kutu için widget oluşturuluyor
                return GestureDetector(
                  onTap: () {  //kutulara tıklanabilme özelliği ekledim
                    print('Tapped on box $index');  //tıklanan kutunun indexi komut ekranında yazılacak

                    if(boxes[index] == '' && winner == '') { //kutu boşsa ve kazananı yoksa
                      setState(() {
                        boxes[index] = currentPlayer;
                        checkWinner(); //kazananı kontrol et
                        currentPlayer = (currentPlayer == 'X') ? 'O' : 'X'; //sıradaki oyuncunun simgesini değiştirttim
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,  //kutu rengi
                      border: Border.all(color: Colors.white), //kutu kenarlarının rengi
                    ),
                    child: Center(
                      child: Text(
                        boxes[index], //kutu içeriği (X veya O)
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 20),
            Text(
              (winner.isNotEmpty) ? '$winner wins!' : (boxes.every((element) => element.isNotEmpty)) ? 'It\'s a draw!' : 'Next Player: $currentPlayer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //oyunu sıfırlama
                setState(() {
                  boxes = List.filled(9, '');
                  winner = '';
                  currentPlayer = 'X';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade400,
              ),

              child: Text(
                'Restrart Game',
                style: TextStyle(color: Colors.white), //Butonun yazısı beyaz
              ),
            ),

          ],
        ),
      ),
    );
  }

  void checkWinner() {
    List<List<int>> winConditions = [  //kazanma durumları
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6],
    ];

    for (var condition in winConditions) {
      if(boxes[condition[0]] == boxes[condition[1]] && boxes[condition[1]] == boxes[condition[2]] && boxes[condition[0]].isNotEmpty) {
        //kazanan varsa
        setState(() {
          winner = boxes[condition[0]];
          updateScore(); //Kazanan oyuncunun skorunu güncelle
        });
        break;
      }
    }
  }

  void updateScore() {
    //Oyuncuların skorunu güncelle
    if (winner == 'X') {
      playerXWins++;
    } else if (winner == 'O'){
      playerOWins++;
    }
  }
}
