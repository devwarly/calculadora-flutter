enum OperationTypeEnum {
  addition(symbol: '+'),
  subtration(symbol: '-'),
  multiplication(symbol: 'x'),
  division(symbol: '\u00F7');

  final String symbol;
  const OperationTypeEnum({required this.symbol});
}