import 'package:apple_gadget_task/core/app/app_prefs.dart';
import 'package:apple_gadget_task/data/repository/repository_impl.dart';
import 'package:apple_gadget_task/domain/repository/repository.dart';
import 'package:apple_gadget_task/presentation/auth/bloc/auth_bloc.dart';
import 'package:apple_gadget_task/presentation/auth/view/login_page.dart';
import 'package:apple_gadget_task/presentation/home/home_page.dart';
import 'package:apple_gadget_task/presentation/profile/bloc/profile_bloc.dart';
import 'package:apple_gadget_task/presentation/trade/bloc/trade_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_ovserver.dart';
import 'core/app/di.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context)=>AuthBloc(
            repository: instance<Repository>(),
          ),
        ),

        BlocProvider<ProfileBloc>(
          create: (context)=>ProfileBloc(
            repository: instance<Repository>(),
          ),
        ),

        BlocProvider<TradeBloc>(
          create: (context)=>TradeBloc(
            repository: instance<Repository>(),
          ),
        ),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: instance<AppPreferences>().getCredential() !=null?const HomePage(): const LoginPage(),
      ),
    );
  }
}
