import 'dart:math';

class Token{
  static String now()=> DateTime.now().toString();
  static String id(){
    String symbols="1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM_";
    String string='';
    for(int i=0;i<25;i++){
      Random random=Random();
      string+=symbols[random.nextInt(symbols.length)];
    }
    return string;
  }
}