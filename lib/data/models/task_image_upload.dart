// image_task.dart
class ImageTask {
  final String name;
  final String imageType;
  bool isCompleted;
  DateTime? uploadTime;
  String? imagePath;

  ImageTask({
    required this.name,
    required this.imageType,
    this.isCompleted = false,
    this.uploadTime,
    this.imagePath,
  });
}
