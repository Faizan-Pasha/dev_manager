class ApplicationListModel {
  bool status;
  bool error;
  String? errorMessage;
  ApplicationListModel(
      {required this.status, required this.error, this.errorMessage});
}
