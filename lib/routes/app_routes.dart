import 'package:get/get.dart';

import 'package:tabibak/presentation/chatbot_screens/chatbot_screens.dart';


import '../presentation/articles-screen/all_articles_screen.dart';


import '../presentation/splash_screen/splash_screen.dart';


import '../presentation/splash_screen/binding/splash_binding.dart';


import '../presentation/onboarding_one_screen/onboarding_one_screen.dart';


import '../presentation/onboarding_one_screen/binding/onboarding_one_binding.dart';


import '../presentation/onboarding_two_screen/onboarding_two_screen.dart';


import '../presentation/onboarding_two_screen/binding/onboarding_two_binding.dart';


import '../presentation/onboarding_three_screen/onboarding_three_screen.dart';


import '../presentation/onboarding_three_screen/binding/onboarding_three_binding.dart';


import '../presentation/onboarding_three1_screen/onboarding_three1_screen.dart';


import '../presentation/onboarding_three1_screen/binding/onboarding_three1_binding.dart';


import '../presentation/login_screen/login_screen.dart';


import '../presentation/login_screen/binding/login_binding.dart';


import '../presentation/sign_up_screen/sign_up_screen.dart';


import '../presentation/sign_up_screen/binding/sign_up_binding.dart';


import '../presentation/sign_up_one_screen/sign_up_one_screen.dart';


import '../presentation/sign_up_one_screen/binding/sign_up_one_binding.dart';


import '../presentation/choose_age_screen/choose_age_screen.dart';


import '../presentation/choose_age_screen/binding/choose_age_binding.dart';


import '../presentation/choose_gender_age_screen/choose_gender_age_screen.dart';


import '../presentation/choose_gender_age_screen/binding/choose_gender_age_binding.dart';


import '../presentation/choose_height_weight_screen/choose_height_weight_screen.dart';


import '../presentation/choose_height_weight_screen/binding/choose_height_weight_binding.dart';


import '../presentation/special_questions_screen/special_questions_screen.dart';


import '../presentation/special_questions_screen/binding/special_questions_binding.dart';


import '../presentation/done_screen/done_screen.dart';


import '../presentation/done_screen/binding/done_binding.dart';


import '../presentation/reset_password_email_tab_container_screen/reset_password_email_tab_container_screen.dart';


import '../presentation/reset_password_email_tab_container_screen/binding/reset_password_email_tab_container_binding.dart';


import '../presentation/reset_password_verify_code_screen/reset_password_verify_code_screen.dart';


import '../presentation/reset_password_verify_code_screen/binding/reset_password_verify_code_binding.dart';


import '../presentation/create_new_password_screen/create_new_password_screen.dart';


import '../presentation/create_new_password_screen/binding/create_new_password_binding.dart';


import '../presentation/popup_screen/popup_screen.dart';


import '../presentation/popup_screen/binding/popup_binding.dart';


import '../presentation/popup_screen/popup_logout.dart';


import '../presentation/popup_screen/binding/popupL_binding.dart';


import '../presentation/home_screen/home_screen.dart';


import '../presentation/home_screen/binding/home_binding.dart';


import '../presentation/top_doctor_screen/top_doctor_screen.dart';


import '../presentation/top_doctor_screen/binding/top_doctor_binding.dart';


import '../presentation/chat_with_bot_screen/chat_with_bot_screen.dart';


import '../presentation/chat_with_bot_screen/binding/chat_with_bot_binding.dart';


import '../presentation/suggestions_screen/suggestions_screen.dart';


import '../presentation/suggestions_screen/binding/suggestions_binding.dart';


import '../presentation/location_screen/location_screen.dart';


import '../presentation/location_screen/binding/location_binding.dart';


import '../presentation/find_doctors_screen/find_doctors_screen.dart';


import '../presentation/find_doctors_screen/binding/find_doctors_binding.dart';


import '../presentation/doctor_detail_screen/doctor_detail_screen.dart';


import '../presentation/doctor_detail_screen/binding/doctor_detail_binding.dart';


import '../presentation/all_specialties_screen/all_specialties_screen.dart';


import '../presentation/all_specialties_screen/binding/all_specialties_binding.dart';


import '../presentation/all_doctors_screen/all_doctors_screen.dart';


import '../presentation/all_doctors_screen/binding/all_doctors_binding.dart';


import '../presentation/profile_screen/profile_screen.dart';


import '../presentation/profile_screen/binding/profile_binding.dart';


import '../presentation/edit_profile_screen/edit_profile_screen.dart';


import '../presentation/edit_profile_screen/binding/edit_profile_binding.dart';


import '../presentation/app_navigation_screen/app_navigation_screen.dart';


import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';


import '../presentation/articles-screen/binding/all_articles_binding.dart';


import '../presentation/symptomes_specialist_screen/symptomes_specialist_screen.dart';


class AppRoutes {

  static const String splashScreen = '/splash_screen';


  static const String onboardingOneScreen = '/onboarding_one_screen';


  static const String onboardingTwoScreen = '/onboarding_two_screen';


  static const String onboardingThreeScreen = '/onboarding_three_screen';


  static const String onboardingThree1Screen = '/onboarding_three1_screen';


  static const String loginScreen = '/login_screen';


  static const String signUpScreen = '/sign_up_screen';


  static const String signUpOneScreen = '/sign_up_one_screen';


  static const String chooseAgeScreen = '/choose_age_screen';


  static const String chooseGenderAgeScreen = '/choose_gender_age_screen';


  static const String chooseHeightWeightScreen = '/choose_height_weight_screen';


  static const String specialQuestionsScreen = '/special_questions_screen';


  static const String doneScreen = '/done_screen';


  static const String resetPasswordEmailPage = '/reset_password_email_page';


  static const String resetPasswordEmailTabContainerScreen =

      '/reset_password_email_tab_container_screen';


  static const String resetPasswordVerifyCodeScreen =

      '/reset_password_verify_code_screen';


  static const String createNewPasswordScreen = '/create_new_password_screen';


  static const String popupScreen = '/popup_screen';


  static const String popupLogout = '/popup_logout';


  static const String homeScreen = '/home_screen';


  static const String topDoctorScreen = '/top_doctor_screen';


  static const String chatWithBotScreen = '/chat_with_bot_screen';


  static const String suggestionsScreen = '/suggestions_screen';


  static const String locationScreen = '/location_screen';


  static const String findDoctorsScreen = '/find_doctors_screen';


  static const String doctorDetailScreen = '/doctor_detail_screen';


  static const String allSpecialtiesScreen = '/all_specialties_screen';


  static const String allDoctorsScreen = '/all_doctors_screen';


  static const String profileScreen = '/profile_screen';


  static const String editProfileScreen = '/edit_profile_screen';


  static const String appNavigationScreen = '/app_navigation_screen';


  static const String initialRoute = '/initialRoute';


  static const String articlesScreen = '/all_articles_screen';


  static const String SymptomSelector = '/symptom_selector_screen';


  static const String chatbotScreens = '/chatbot_screens';


  static List<GetPage> pages = [

    GetPage(

      name: splashScreen,

      page: () => SplashScreen(),

      bindings: [

        SplashBinding(),

      ],

    ),

    GetPage(

      name: onboardingOneScreen,

      page: () => OnboardingOneScreen(),

      bindings: [

        OnboardingOneBinding(),

      ],

    ),

    GetPage(

      name: onboardingTwoScreen,

      page: () => OnboardingTwoScreen(),

      bindings: [

        OnboardingTwoBinding(),

      ],

    ),

    GetPage(

      name: onboardingThreeScreen,

      page: () => OnboardingThreeScreen(),

      bindings: [

        OnboardingThreeBinding(),

      ],

    ),

    GetPage(

      name: onboardingThree1Screen,

      page: () => OnboardingThree1Screen(),

      bindings: [

        OnboardingThree1Binding(),

      ],

    ),

    GetPage(

      name: loginScreen,

      page: () => LoginScreen(),

      bindings: [

        LoginBinding(),

      ],

    ),

    GetPage(

      name: signUpScreen,

      page: () => SignUpScreen(),

      bindings: [

        SignUpBinding(),

      ],

    ),

    GetPage(

      name: signUpOneScreen,

      page: () => SignUpOneScreen(),

      bindings: [

        SignUpOneBinding(),

      ],

    ),

    GetPage(

      name: chooseAgeScreen,

      page: () => ChooseAgeScreen(),

      bindings: [

        ChooseAgeBinding(),

      ],

    ),

    GetPage(

      name: chooseGenderAgeScreen,

      page: () => ChooseGenderAgeScreen(),

      bindings: [

        ChooseGenderAgeBinding(),

      ],

    ),

    GetPage(

      name: chooseHeightWeightScreen,

      page: () => ChooseHeightWeightScreen(),

      bindings: [

        ChooseHeightWeightBinding(),

      ],

    ),

    GetPage(

      name: specialQuestionsScreen,

      page: () => SpecialQuestionsScreen(),

      bindings: [

        SpecialQuestionsBinding(),

      ],

    ),

    GetPage(

      name: doneScreen,

      page: () => DoneScreen(),

      bindings: [

        DoneBinding(),

      ],

    ),

    GetPage(

      name: resetPasswordEmailTabContainerScreen,

      page: () => ResetPasswordEmailTabContainerScreen(),

      bindings: [

        ResetPasswordEmailTabContainerBinding(),

      ],

    ),

    GetPage(

      name: resetPasswordVerifyCodeScreen,

      page: () => ResetPasswordVerifyCodeScreen(),

      bindings: [

        ResetPasswordVerifyCodeBinding(),

      ],

    ),

    GetPage(

      name: createNewPasswordScreen,

      page: () => CreateNewPasswordScreen(),

      bindings: [

        CreateNewPasswordBinding(),

      ],

    ),

    GetPage(

      name: popupScreen,

      page: () => PopupScreen(),

      bindings: [

        PopupBinding(),

      ],

    ),

    GetPage(

      name: popupLogout,

      page: () => PopupLogout(),

      bindings: [

        PopupLBinding(),

      ],

    ),

    GetPage(

      name: homeScreen,

      page: () => HomeScreen(),

      bindings: [

        HomeBinding(),

      ],

    ),

    GetPage(

      name: topDoctorScreen,

      page: () => TopDoctorScreen(),

      bindings: [

        TopDoctorBinding(),

      ],

    ),

    GetPage(

      name: chatWithBotScreen,

      page: () => ChatWithBotScreen(),

      bindings: [

        ChatWithBotBinding(),

      ],

    ),

    GetPage(

      name: suggestionsScreen,

      page: () => SuggestionsScreen(),

      bindings: [

        SuggestionsBinding(),

      ],

    ),

    GetPage(

      name: locationScreen,

      page: () => LocationScreen(),

      bindings: [

        LocationBinding(),

      ],

    ),

    GetPage(

      name: findDoctorsScreen,

      page: () => FindDoctorsScreen(),

      bindings: [

        FindDoctorsBinding(),

      ],

    ),

    GetPage(

      name: doctorDetailScreen,

      page: () => DoctorDetailScreen(),

      bindings: [

        DoctorDetailBinding(),

      ],

    ),

    GetPage(

      name: allSpecialtiesScreen,

      page: () => AllSpecialtiesScreen(),

      bindings: [

        AllSpecialtiesBinding(),

      ],

    ),

    GetPage(

      name: allDoctorsScreen,

      page: () => AllDoctorsScreen(),

      bindings: [

        AllDoctorsBinding(),

      ],

    ),

    GetPage(

      name: profileScreen,

      page: () => ProfileScreen(),

      bindings: [

        ProfileBinding(),

      ],

    ),

    GetPage(

      name: editProfileScreen,

      page: () => EditProfileScreen(),

      bindings: [

        EditProfileBinding(),

      ],

    ),

    GetPage(

      name: appNavigationScreen,

      page: () => AppNavigationScreen(),

      bindings: [

        AppNavigationBinding(),

      ],

    ),

    GetPage(

      name: initialRoute,

      page: () => SplashScreen(),

      bindings: [

        SplashBinding(),

      ],

    ),

    GetPage(

      name: articlesScreen,

      page: () => AllArticlesScreen(),

      bindings: [

        AllArticlesBinding(),

      ],

    ),

    GetPage(

      name: SymptomSelector,

      page: () => SymptomSelectorScreen(),

    ),

    GetPage(
      name: chatbotScreens,
      page: () => ChatBotScreen(),
    )

  ];

}

