import 'package:apple_gadget_task/core/network/failure.dart';
import 'package:apple_gadget_task/data/model/account_info.dart';
import 'package:apple_gadget_task/data/model/login_request_dto.dart';
import 'package:apple_gadget_task/data/model/login_response_dto.dart';
import 'package:apple_gadget_task/data/model/shared_pref_dto.dart';
import 'package:apple_gadget_task/data/model/trade.dart';
import 'package:dartz/dartz.dart';
import '../../core/app/app_prefs.dart';
import '../../core/network/api_service.dart';
import '../../core/network/error_handle.dart';
import '../../core/network/network_info.dart';
import '../../domain/repository/repository.dart';

class RepositoryImpl extends Repository {

final NetworkInfo _networkInfo;
final ApiService _apiService;
final AppPreferences _appPref;

RepositoryImpl(this._networkInfo, this._apiService, this._appPref);

  @override
  Future<Either<Failure, LoginResponseDto>> login(LoginRequestDto loginRequestDto) async{
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.post(endPoint: "/IsAccountCredentialsCorrect", data: loginRequestDto.toJson());
        final data = LoginResponseDto.fromJson(response.data);
        if(data.result){
          _appPref.saveCredential(SharedPrefDto(
            login: loginRequestDto.login,
            token: data.token,
          ));
        }
        return Right(data);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AccountInfo>> getAccountInformation()async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.post(endPoint: "/GetAccountInformation", data:  _appPref.getCredential()!.toJson());

        final data = AccountInfo.fromJson(response.data);
        return Right(data);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }

  @override
  Future<Either<Failure, String>> getLastFourNumbersPhone() async{
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.post(endPoint: "/GetLastFourNumbersPhone", data:  _appPref.getCredential()!.toJson());
        return Right(response.data);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }

  @override
  Future<Either<Failure, List<Trade>>> getOpenTrades() async{
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.post(endPoint: "/GetOpenTrades", data:  _appPref.getCredential()!.toJson());
        final List<dynamic> list = response.data;
        final List<Trade> data = list.map((element) => Trade.fromJson(element)).toList();
        return Right(data);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> logOut() async{

    try {

       await _appPref.removeCredential();
       return const Right(true);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

}