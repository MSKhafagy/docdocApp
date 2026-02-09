import 'package:dio/dio.dart';
import 'package:doctorapp/features/auth/login/data/login_model.dart';
import 'package:doctorapp/features/auth/login/logic/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../const/api_const.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(): super(LoginInitialState());
  Dio dio = Dio();

  Future register(LoginModel user) async {
    emit(LoginLoadingState());
    try {
      final response = await dio.post(APIConst.register, data: user.toJson());
      if (response.statusCode == 200) {
        emit(LoginSuccessState());
      }
    } catch (e) {
      print("==========register error $e");
      emit(LoginErrorState(errorMessage: e.toString()));
    }
  }

}