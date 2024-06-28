import 'individual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
  });

  List<Individual> barData = [];

  void initializeBarData() {
    barData = [
      Individual(x: 1, y: sunAmount),
      Individual(x: 2, y: monAmount),
      Individual(x: 3, y: tueAmount),
      Individual(x: 4, y: wedAmount),
    ];
  }
}
