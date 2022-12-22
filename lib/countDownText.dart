import 'dart:async';
import 'package:flutter/material.dart';

import 'countdown.dart';

///CountDownText : A simple text widget that display the countdown timer
///based on the dateTime given e.g DateTime.utc(2050)
class CountDownText extends StatefulWidget {
  const CountDownText({
    Key? key,
    required this.due,
    required this.finishedText,
    this.longDateName = false,
    this.style,
    this.showLabel = false,
    this.isHorizontal = true,
    this.daysTextLong = " Days ",
    this.hoursTextLong = " Hr ",
    this.minutesTextLong = " Min ",
    this.secondsTextLong = " S ",
    this.daysTextShort = " d ",
    this.hoursTextShort = " h ",
    this.minutesTextShort = " m ",
    this.secondsTextShort = " s ",
  }) : super(key: key);

  final DateTime? due;
  final String? finishedText;
  final bool? longDateName;
  final bool? showLabel;
  final TextStyle? style;
  final bool? isHorizontal;
  final String daysTextLong;
  final String hoursTextLong;
  final String minutesTextLong;
  final String secondsTextLong;
  final String daysTextShort;
  final String hoursTextShort;
  final String minutesTextShort;
  final String secondsTextShort;

  @override
  _CountDownTextState createState() => _CountDownTextState();
}

class _CountDownTextState extends State<CountDownText> {
  Timer? timer;
  CountDownTimeLeft _countDownTimeLeft = const CountDownTimeLeft();

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _countDownTimeLeft = CountDown().remainingTime(
            widget.due!,
            widget.finishedText!,
            widget.daysTextLong,
            widget.hoursTextLong,
            widget.minutesTextLong,
            widget.secondsTextLong,
            widget.daysTextShort,
            widget.hoursTextShort,
            widget.minutesTextShort,
            widget.secondsTextShort,
            longDateName: widget.longDateName,
            showLabel: widget.showLabel);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isHorizontal == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    widget.longDateName == false ? widget.daysTextShort : widget.daysTextLong,
                    style: widget.style,
                  ),
                  Text(
                    _countDownTimeLeft.days ?? "0",
                    style: widget.style,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    widget.longDateName == false ? widget.hoursTextShort : widget.hoursTextLong,
                    style: widget.style,
                  ),
                  Text(
                    _countDownTimeLeft.hours ?? "0",
                    style: widget.style,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    widget.longDateName == false ? widget.minutesTextShort : widget.minutesTextLong,
                    style: widget.style,
                  ),
                  Text(
                    _countDownTimeLeft.minutes ?? "0",
                    style: widget.style,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    widget.longDateName == false ? widget.secondsTextShort : widget.secondsTextLong,
                    style: widget.style,
                  ),
                  Text(
                    _countDownTimeLeft.seconds ?? "0",
                    style: widget.style,
                  ),
                ],
              ),
            ],
          )
        : Text(
            CountDown().timeLeft(
                widget.due!,
                widget.finishedText!,
                widget.daysTextLong,
                widget.hoursTextLong,
                widget.minutesTextLong,
                widget.secondsTextLong,
                widget.daysTextShort,
                widget.hoursTextShort,
                widget.minutesTextShort,
                widget.secondsTextShort,
                longDateName: widget.longDateName,
                showLabel: widget.showLabel),
            style: widget.style,
          );
  }
}
