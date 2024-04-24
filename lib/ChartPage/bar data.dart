import 'individual_bar.dart';

class BarData{
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

BarData({
  required this.sunAmount,
  required this.monAmount,
  required this.tueAmount,
  required this.wedAmount,
  required this.thurAmount,
  required this.friAmount,
  required this.satAmount,

});
List<Individual> barData= [];

void initializeBarData(){
  barData = [
  Individual(x: 1,y: sunAmount),
  Individual(x: 2,y: monAmount),
  Individual(x: 3,y: tueAmount),
  Individual(x: 4,y: wedAmount),
  Individual(x: 5,y: thurAmount),
  Individual(x: 6,y: friAmount),
  Individual(x: 7,y: satAmount),
  ];

}
}