import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  // String token = '';
  // // when login is successful, set the token and userId
  // // and save it to the app's preferences
  // static Future<String> setAccessToken(String token) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();

  //   await preferences.setString("access_token", token);

  //   return token;
  // }

  // Future<String> getAccessToken() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   token = preferences.getString("access_token").toString();
  //   return token;
  // }

  // static Future<ServerResponse> signUp(
  //     {required String fullName,
  //     required String email,
  //     required String phoneNumber,
  //     required String password,
  //     required String confirmPassword}) async {
  //   var response = await http.post(Uri.parse('${baseUrl}auth/register'), body: {
  //     'full_name': fullName,
  //     'mobile_phone': phoneNumber,
  //     'email': email,
  //     'password': password,
  //     'confirmed_password': confirmPassword,
  //   });

  //   print(jsonDecode(response.body));

  //   if (response.statusCode == 200) {
  //     return ServerResponse.fromJson(jsonDecode(response.body));
  //   }

  //   if (response.statusCode == 400 ||
  //       response.statusCode == 403 ||
  //       response.statusCode == 401) {
  //     return ServerResponse.fromJson(jsonDecode(response.body));
  //   }

  //   return ServerResponse.fromJson(jsonDecode(response.body));
  // }

  // Future<SignIn> signIn(
  //     {required String email, required String password}) async {
  //   var response = await http.post(Uri.parse('${baseUrl}auth/login'), body: {
  //     'email': email,
  //     'password': password,
  //   });

  //   print(jsonDecode(response.statusCode.toString()));
  //   print(jsonDecode(response.body));

  //   if (response.statusCode == 200) {
  //     return SignIn.fromJson(jsonDecode(response.body));
  //   }

  //   if (response.statusCode == 400 ||
  //       response.statusCode == 404 ||
  //       response.statusCode == 403 ||
  //       response.statusCode == 401) {
  //     return SignIn.fromJson(jsonDecode(response.body));
  //   }

  //   throw Exception('Failed to load data.');
  // }

  // static Future<ServerResponse> requestForgotPassword({
  //   required String email,
  // }) async {
  //   var response =
  //       await http.post(Uri.parse('${baseUrl}auth/send-reset-password'), body: {
  //     'email': email,
  //   });

  //   print(jsonDecode(response.body));

  //   if (response.statusCode == 200) {
  //     return ServerResponse.fromJson(jsonDecode(response.body));
  //   }

  //   if (response.statusCode == 400 ||
  //       response.statusCode == 403 ||
  //       response.statusCode == 401) {
  //     return ServerResponse.fromJson(jsonDecode(response.body));
  //   }

  //   return ServerResponse.fromJson(jsonDecode(response.body));
  // }

  // static Future<ServerResponse> forgotPasswordConfirm({
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  //   required String code,
  // }) async {
  //   var response = await http.post(
  //     Uri.parse('${baseUrl}auth/reset-password'),
  //     body: {
  //       'email': email,
  //       'password': password,
  //       'password_confirmation': confirmPassword,
  //       'code': code,
  //     },
  //   );

  //   print(jsonDecode(response.body));

  //   if (response.statusCode == 200) {
  //     return ServerResponse.fromJson(jsonDecode(response.body));
  //   }

  //   if (response.statusCode == 400 ||
  //       response.statusCode == 403 ||
  //       response.statusCode == 401) {
  //     return ServerResponse.fromJson(jsonDecode(response.body));
  //   }

  //   return ServerResponse.fromJson(jsonDecode(response.body));
  // }

  // static Future<TermsAndCondition> termsAndConditions() async {
  //   var response =
  //       await http.get(Uri.parse('${baseUrl}app/terms-and-conditions'));

  //   if (response.statusCode == 200) {
  //     return TermsAndCondition.fromJson(
  //         jsonDecode(response.body)['data']['terms_and_conditions']);
  //   }

  //   if (response.statusCode == 400 ||
  //       response.statusCode == 403 ||
  //       response.statusCode == 401) {
  //     return TermsAndCondition.fromJson(jsonDecode(response.body));
  //   }

  //   return TermsAndCondition.fromJson(jsonDecode(response.body));
  // }

  // static Future<PrivacyPolicy> privacyPolices() async {
  //   var response = await http.get(
  //     Uri.parse('${baseUrl}app/privacy-policy'),
  //   );

  //   if (response.statusCode == 200) {
  //     return PrivacyPolicy.fromJson(
  //       jsonDecode(response.body)['data']['privacy_policy'],
  //     );
  //   }

  //   if (response.statusCode == 400 ||
  //       response.statusCode == 403 ||
  //       response.statusCode == 401) {
  //     return PrivacyPolicy.fromJson(jsonDecode(response.body));
  //   }

  //   return PrivacyPolicy.fromJson(jsonDecode(response.body));
  // }
}
