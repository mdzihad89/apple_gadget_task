
import 'package:apple_gadget_task/data/model/account_info.dart';
import 'package:apple_gadget_task/data/model/login_request_dto.dart';
import 'package:apple_gadget_task/data/model/login_response_dto.dart';
import 'package:apple_gadget_task/data/model/shared_pref_dto.dart';
import 'package:apple_gadget_task/data/model/trade.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, LoginResponseDto>> login( LoginRequestDto loginRequestDto);
  Future<Either<Failure, AccountInfo>> getAccountInformation();
  Future<Either<Failure, String>> getLastFourNumbersPhone();
  Future<Either<Failure, List<Trade>>> getOpenTrades();
  Future<Either<Failure, bool>> logOut();
}
