import 'package:doctorapp/core/utils/colors_manager.dart';
import 'package:doctorapp/core/widgets/app_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, BlocProvider, ReadContext;
import 'package:doctorapp/features/auth/register/data/user_model.dart';
import '../../../../../core/utils/txt_style.dart';
import '../../../../../core/widgets/app_txt_field.dart';
import '../../../../home/presentation/screens/home_screen.dart';
import '../../data/user_model.dart';
import '../../logic/cubit.dart';
import '../../logic/states.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  Future toggleLang(BuildContext context)async{
    Locale currentLang =context.locale;
    if(currentLang.languageCode == "en"){
      await context.setLocale(Locale("ar"));
    }else{
      context.setLocale(Locale("en"));
    }

  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return  BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(userName: state.userName)));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Account created successfully",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: ColorsManager.primaryColor,
                // duration: Duration(seconds: 3),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );

          } else if (state is RegisterErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: ColorsManager.primaryColor,
                //duration: Duration(seconds: 3),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: screenHeight * 0.032,
                      backgroundColor: ColorsManager.white,
                      child: IconButton(icon : Icon(Icons.language, color: ColorsManager.textBlack,size: screenHeight * 0.033),onPressed: (){
                        toggleLang(context);
                      },),
                    ),
                    Text("Create Account".tr(), style: TxtStyle.font700size24Blue),
                    Text(
                      "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!".tr(),
                      style: TxtStyle.font400size14Grey,
                    ),
                    AppTxtField(
                      hintTxt: "Email".tr(),
                      textEditingController: emailController,
                    ),
                    AppTxtField(
                        hintTxt: "name".tr(), textEditingController: nameController),
                    AppTxtField(
                      hintTxt: "Phone Number".tr(),
                      textEditingController: phoneNumberController,
                    ),
                    AppTxtField(
                      hintTxt: "Gender".tr(),
                      textEditingController: genderController,
                    ),
                    AppTxtField(
                      hintTxt: "Password".tr(),
                      textEditingController: passwordController,
                    ),
                    AppTxtField(
                      hintTxt: "Password Confirmation".tr(),
                      textEditingController: passwordConfirmationController,
                    ),

                    (state is RegisterLoadingState) ?Center(child: CircularProgressIndicator())  : AppButton(
                      buttonTxt: "Create Account".tr(),
                      function: () {
                        context.read<RegisterCubit>().register(
                          UserModel(
                            email: emailController.text,
                            name: nameController.text,
                            gender: genderController.text,
                            phone: phoneNumberController.text,
                            password: passwordController.text,
                            password_confirmation: passwordConfirmationController
                                .text,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}
