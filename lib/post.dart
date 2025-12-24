/// 데이터 담는 클래스
///
/// AKA
///
/// Model 클래스
///
/// Data 클래스
class Post {
  int userId;
  int id;
  String title;
  String body;
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
}
