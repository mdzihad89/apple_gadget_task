part of 'trade_bloc.dart';

@immutable
abstract class TradeState {}

class TradeInitial extends TradeState {}

class TradeLoading extends TradeState {}



class TradeSuccess extends TradeState {
  final List<Trade> trades;
  final String totalProfit;
  TradeSuccess({required this.trades,required this.totalProfit});
}

class TradeFailure extends TradeState {
  final String message;
  TradeFailure(this.message);
}