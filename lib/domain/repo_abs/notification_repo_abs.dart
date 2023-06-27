abstract class NotificationRepo {
  void cancelAll();
  void show(String title, String desc);
  void createNoti(int id, String title, String desc, DateTime time);
}
