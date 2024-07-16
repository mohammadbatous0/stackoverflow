class TimeAgo {
  /*
  ========================================

  CODING BY : MOHAMMAD MAHMOUD BATOUS
        ** FULLSTACK DEVELOPER ** 

  ========================================

*/
  String calctimeago(int timecalcMilli) {
    final DateTime timecalc =
        DateTime.fromMillisecondsSinceEpoch(timecalcMilli * 1000);
    Duration differnt = DateTime.now().difference(timecalc);
    int days = differnt.inDays,
        minutes = differnt.inMinutes,
        hour = differnt.inHours;

    if (days > 365) {
      return '${(days / 365).floor()} years ago';
    }
    if (days > 30) {
      return '${(days / 30).floor()} months ago';
    }
    if (days > 7) {
      return '${(days / 7).floor()} weeks ago';
    }
    if (hour >= 24) {
      return '${(hour / 7).floor()} days ago';
    }
    if (minutes >= 60) {
      return '${(minutes / 60).floor()} hours ago';
    }
    if (minutes > 0) {
      return '$minutes minutes ago';
    }

    return 'now';
  }
}
