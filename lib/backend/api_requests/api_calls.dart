import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GenerateTokenCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? clientId = 'SmartGrinderBO_App',
    String? clientSecret = '1q2w3E*',
    String? grantType = 'password',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GenerateToken',
      apiUrl: 'http://34.171.147.109:80/connect/token',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/x-www-form-urlencoded',
      },
      params: {
        'username': username,
        'password': password,
        'client_id': clientId,
        'client_secret': clientSecret,
        'grant_type': grantType,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
    );
  }

  static dynamic accessToken(dynamic response) => getJsonField(
        response,
        r'''$.access_token''',
      );
}

class ForgotPasswordCall {
  static Future<ApiCallResponse> call({
    String? emailAddress = '\"\"',
    String? returnUrl = '\"\"',
  }) {
    final body = '''
{
  "emailAddress": "${emailAddress}",
  "returnUrl": "${returnUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Forgot Password',
      apiUrl: 'http://34.171.147.109:80/api/account/reset-password-request',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer token',
      },
      params: {
        'emailAddress': emailAddress,
        'returnUrl': returnUrl,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$.userId''',
      );
}

class CustomerServiceCurrentCustomerIdCall {
  static Future<ApiCallResponse> call({
    String? emailID = '',
    String? token = '',
  }) {
    final body = '''
{
"email": "${emailID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CustomerServiceCurrentCustomerId',
      apiUrl:
          'http://34.171.147.109:80/api/app/customer-detail/or-fetch-current-customer-id',
      callType: ApiCallType.PUT,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'emailID': emailID,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class SignupServiceCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? email = '',
    String? password = '',
    String? appName = 'SmartGrinderApp',
  }) {
    final body = '''
{
        "username": "${username}",
        "emailAddress": "${email}",
        "password":"${password}",
        "appName": "${appName}"
      }''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignupService',
      apiUrl: 'http://34.171.147.109/api/account/register',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'username': username,
        'email': email,
        'password': password,
        'appName': appName,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class NotificationServicesCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? customerId = '',
    String? skipCount = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'NotificationServices',
      apiUrl:
          'http://34.171.147.109:80/api/app/notification-and-alarm/notification-and-alarm-of-customer?customerID=${customerId}&SkipCount=${skipCount}&MaxResultCount=10',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'text/plain',
        'authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
    );
  }
}

class CreateNewPasswordCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'CreateNewPassword',
      apiUrl: '/api/account/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class SetNewPasswordCall {
  static Future<ApiCallResponse> call({
    String? userId = '3fa85f64-5717-4562-b3fc-2c963f66afa6',
    String? token = '\" \"',
    String? newPassword = '\" \"',
  }) {
    final body = '''
{
  "userId": "${userId}",
  "token": "${token}",
  "newPassword": "${newPassword}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SetNewPassword',
      apiUrl: 'http://34.171.147.109:80/api/account/reset-password-request',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'userId': userId,
        'token': token,
        'newPassword': newPassword,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
