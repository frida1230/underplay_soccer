import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soccer/model/Meeting.dart';

class MeetList extends StatelessWidget {
  const MeetList({
    Key? key,
    required this.day,
    required this.meetList
  }) : super(key: key);

  final List<Meeting> meetList;
  final String day;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            scrollDirection: Axis.vertical,
            itemCount: meetList.length,
            itemBuilder: (context, index) {
              return  day == DateFormat('yyyy-MM-dd')
                  .format(meetList[index].to)
                  .toString() ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('일정 제목: ${meetList[index].eventName.toString()}'),
                  meetList[index].isAllDay ?
                  Text('하루종일 이 일정이 예정되어 있습니다.') :
                  Text('시작 시간: ${meetList[index].from.toString()}'),
                  Text('종료 시간: ${meetList[index].to.toString()}'),
                ],
              ) : SizedBox();
            },
            separatorBuilder: (_, index) => const SizedBox(
              height: 20,
            ),
          ),
        );
  }
}