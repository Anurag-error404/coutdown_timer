class CountDown {
  //? simple utility function that returns a string format of time left
  String timeLeft(
      DateTime due,
      String finishedText,
      String daysTextLong,
      String hoursTextLong,
      String minutesTextLong,
      String secondsTextLong,
      String daysTextShort,
      String hoursTextShort,
      String minutesTextShort,
      String secondsTextShort,
      {bool? longDateName,
      bool? showLabel}) {
    
    Duration _timeUntilDue = due.difference(DateTime.now());
    int _daysUntil = _timeUntilDue.inDays;
    int _hoursUntil = _timeUntilDue.inHours - (_daysUntil * 24);
    int _minUntil = _timeUntilDue.inMinutes - (_daysUntil * 24 * 60) - (_hoursUntil * 60);
    int _secUntil = _timeUntilDue.inSeconds - (_minUntil * 60);
    String s = _secUntil.toString().length <= 2
        ? _secUntil.toString()
        : _secUntil.toString().substring(_secUntil.toString().length - 2);

    String retVal = "";
    if (showLabel == false) {
      if (_daysUntil > 0) {
        retVal += _daysUntil.toString() + " : ";
      }
      if (_hoursUntil > 0) {
        retVal += _hoursUntil.toString() + " : ";
      }
      if (_minUntil > 0) {
        retVal += _minUntil.toString() + " : ";
      }
      if (_secUntil > 0) {
        retVal += s;
      }
    } else {
      if (longDateName == false) {
        if (_daysUntil > 0) {
          retVal += _daysUntil.toString() + daysTextShort;
        }
        if (_hoursUntil > 0) {
          retVal += _hoursUntil.toString() + hoursTextShort;
        }
        if (_minUntil > 0) {
          retVal += _minUntil.toString() + minutesTextShort;
        }
        if (_secUntil > 0) {
          retVal += s + secondsTextShort;
        }
      } else {
        if (_daysUntil > 0) {
          retVal += _daysUntil.toString() + daysTextLong;
        }
        if (_hoursUntil > 0) {
          retVal += _hoursUntil.toString() + hoursTextLong;
        }
        if (_minUntil > 0) {
          retVal += _minUntil.toString() + minutesTextLong;
        }
        if (_secUntil > 0) {
          retVal += s + secondsTextLong;
        }
      }
    }
    if (_secUntil < 1) {
      retVal = finishedText;
    }
    return retVal;
  }

  //? separate utlity function to return remaining time in more flexible format
  CountDownTimeLeft remainingTime(
      DateTime due,
      String finishedText,
      String daysTextLong,
      String hoursTextLong,
      String minutesTextLong,
      String secondsTextLong,
      String daysTextShort,
      String hoursTextShort,
      String minutesTextShort,
      String secondsTextShort,
      {bool? longDateName,
      bool? showLabel}) {
    Duration _timeUntilDue = due.difference(DateTime.now());

    int _daysUntil = _timeUntilDue.inDays;
    int _hoursUntil = _timeUntilDue.inHours - (_daysUntil * 24);
    int _minUntil = _timeUntilDue.inMinutes - (_daysUntil * 24 * 60) - (_hoursUntil * 60);
    int _secUntil = _timeUntilDue.inSeconds - (_minUntil * 60);
    String s = _secUntil.toString().length <= 2
        ? _secUntil.toString()
        : _secUntil.toString().substring(_secUntil.toString().length - 2);

    return CountDownTimeLeft(
      days: _daysUntil.toString(),
      hours: _hoursUntil.toString(),
      minutes: _minUntil.toString(),
      seconds: s,
    );
  }


}

//? remaining time class to access all the paramaters individually
class CountDownTimeLeft {
  final String? days;
  final String? hours;
  final String? minutes;
  final String? seconds;

  const CountDownTimeLeft({this.days, this.hours, this.minutes, this.seconds});
}
