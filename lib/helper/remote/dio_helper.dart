//
//
// import 'package:dio/dio.dart';
//
// import 'endpoints.dart';
//
// class DioHelper {
//   static late Dio dio;
//
//   static dioInit() async {
//     BaseOptions baseOptions = BaseOptions(
//       baseUrl: AppEndpoints.baseUrl,
//       receiveDataWhenStatusError: true,
//     );
//     dio = Dio(baseOptions);
//     // DioInterceptor.setupInterceptors(dio);
//   }
//
//   static Future<Response> postData({
//     required path,
//     required data,
//     sessionid,
//     token,
//   }) async {
//     if (sessionid != "") {
//       dio.options.headers['sessionid'] = sessionid;
//     }
//
//     if (token != "") {
//       dio.options.headers['Authorization'] = token;
//     }
//     return await dio.post(
//       path,
//       data: data,
//     );
//   }
//
//   static Future<Response> postDataWithFile({
//     required path,
//     required data,
//     sessionid,
//   }) async {
//     // dio.options.headers['Content-Type']= 'multipart/form-data';
//     if (sessionid != "") {
//       dio.options.headers['sessionid'] = sessionid;
//     }
//
//     return await dio.post(
//       path,
//       data: data,
//     );
//   }
//
//   static Future<Response> getData({
//     required String path,
//     data,
//     sessionid,
//     userId,
//     token,
//   }) async {
//     if (sessionid != "") {
//       dio.options.headers['sessionId'] = sessionid;
//     }
//     if (userId != "") {
//       dio.options.headers['userId'] = userId;
//     }
//     if (token != "") {
//       dio.options.headers['Authorization'] = token;
//     }
//     return await dio.get(
//       path,
//       data: data,
//     );
//   }
//
// }
//
// // class DioInterceptor {
// //   static Dio setupInterceptors(Dio dio) {
// //     dio.interceptors.add(
// //       InterceptorsWrapper(
// //         onError: (e, handler) {
// //           if (e.response?.statusCode == 401 ) {
// //             // Remove session  , contactId and user data
// //             CacheHelper.removeData(key: CacheHelperKeys.sessionId);
// //             CacheHelper.removeData(key: CacheHelperKeys.contactId);
// //             CacheHelper.removeData(key: CacheHelperKeys.userId);
// //
// //             // Navigate to sign-in screen
// //             Navigator.of(navigatorKey.currentState!.context).pushNamed(Routes.signInScreen);
// //
// //             // Show dialog for unauthorized access
// //             showDialog(
// //               context: navigatorKey.currentState!.context,
// //               builder: (BuildContext context) {
// //                 return myCustomShowDialogForUnAuth(
// //                   context: context,
// //                 );
// //               },
// //             );
// //
// //             // Return a non-error response to prevent further error propagation
// //             return handler.resolve(Response(data: {'message': 'Unauthorized'}, requestOptions: RequestOptions(path: '')));
// //           }
// //
// //           // For other error cases, continue with the error
// //           return handler.next(e);
// //         },
// //       ),
// //     );
// //
// //     return dio;
// //   }
// // }
