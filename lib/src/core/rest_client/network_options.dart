/// Class to add to API call in order to get `progress` results
class NetworkOptions {
  NetworkOptions({this.onReceiveProgress, this.onSendProgress});
  void Function(int progress, int total)? onReceiveProgress;
  void Function(int progress, int total)? onSendProgress;
}
