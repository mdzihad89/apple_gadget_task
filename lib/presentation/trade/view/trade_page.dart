import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/trade_bloc.dart';

class TradePage extends StatefulWidget {
  const TradePage({super.key});

  @override
  State<TradePage> createState() => _TradePageState();
}



class _TradePageState extends State<TradePage> {
  @override
  void initState() {
    BlocProvider.of<TradeBloc>(context).add(TradeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
         onRefresh: () async {
            BlocProvider.of<TradeBloc>(context).add(TradeEvent());
          },
        child: BlocBuilder<TradeBloc, TradeState>(
          builder: (context, state) {
            if (state is TradeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if (state is TradeSuccess) {
              return Column(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Total Profit", style: TextStyle(fontSize: 18,),),
                        Text("\$ ${state.totalProfit.toString()}", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      ],
                    ),

                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.trades.length,
                      itemBuilder: (context, index){
                        final trade = state.trades[index];
                        return Card(
                          child: ListTile(
                            title: Text(trade.symbol, style: const TextStyle(fontSize: 18,),),
                            subtitle: Text(DateFormat.yMMMMEEEEd().format( trade.openTime!), style: const TextStyle(fontSize: 14,),),
                            trailing: Column(
                              children: [
                                Text("\$ ${trade.currentPrice.toString()}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                Text("${trade.profit.toString()} %", style:  TextStyle(fontSize: 14,color:  trade.profit>0?Colors.green:Colors.red),),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );

            }else if(state is TradeFailure){
              return Center(child: Text(state.message));

            }

            else{
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
