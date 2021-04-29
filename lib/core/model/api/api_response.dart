///Class used to Wrap an HTTP response object value
///
///Can be used to know the success status and tshe response message
class ApiResponse<T> {
  final bool success;
  final String message;
  final T response;

  ApiResponse(this.success, this.message, this.response);
}
