import 'dart:math';

class BmiBrain{
  int weight ;
  int height ;
  BmiBrain({required this.weight, required this.height});

  double? bmi ;

  String getResult(){
    bmi = weight / pow(height/100, 2);
    return bmi!.toStringAsFixed(1);
  }

  String getStatus(){
    if(bmi! >= 25 ){
      return 'Over Weight';
    }else if (bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  String getStatics(){
    if (bmi! >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more';
    }
    else if(bmi! >18.5){
      return 'You have a normal body weight. Good Job!';
    }else{
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}