import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/trade.dart';
import '../../../domain/repository/repository.dart';

part 'trade_event.dart';

part 'trade_state.dart';

class TradeBloc extends Bloc<TradeEvent, TradeState> {
  final Repository repository;

  TradeBloc({required this.repository}) : super(TradeInitial()) {
    on<TradeEvent>((event, emit) async {
      emit(TradeLoading());
      final result = await repository.getOpenTrades();
      result.fold((failure) {
        emit(TradeFailure(failure.message));
      }, (trades) {
        double totalProfit = 0;
        for (var trade in trades) {
          totalProfit += trade.profit;
        }
        emit(TradeSuccess(trades: trades, totalProfit: totalProfit.toStringAsFixed(2)));
      });
    });
  }
}
