import 'dart:core';

import 'package:fl_chart/fl_chart.dart';

class StatsModel {
  final int open;
  final int close;
  final int inProgress;
  final int reOpen;

  final PriorityStats priorityStats;
  final OpenByClients fetchOpenByClients;
  final ReOpenedTicketRate reOpenedTicketRate;
  final ResolvedTicketRate resolvedTicketRate;
  final SlaCompliance slaCompliance;
  final ResolvedAvg resolvedAvg;
  final TicketBacklogs ticketBacklogs;
  final SlaBreachTickets slaBreachTickets;
  final TicketClosingTrend ticketClosingTrend;
  final TicketByStatus ticketByStatus;
  final OpenTickets ticketOpen;

  StatsModel({
    required this.open,
    required this.close,
    required this.inProgress,
    required this.reOpen,
    required this.priorityStats,
    required this.fetchOpenByClients,
    required this.reOpenedTicketRate,
    required this.resolvedTicketRate,
    required this.slaCompliance,
    required this.resolvedAvg,
    required this.ticketBacklogs,
    required this.slaBreachTickets,
    required this.ticketClosingTrend,
    required this.ticketByStatus,
    required this.ticketOpen,
  });
}

class OpenTickets {
  final int high;
  final int medium;
  final int low;
  final int totalTickets;

  OpenTickets({
    required this.high,
    required this.medium,
    required this.low,
    required this.totalTickets,
  });
}

class TicketClosingTrend {
  final int perDayList;
  final int weekList;
  final int monthList;

  TicketClosingTrend({
    required this.perDayList,
    required this.weekList,
    required this.monthList,
  });
}

class PriorityStats {
  final double maxX;
  final double maxY;
  final List<LineChartBarData> data;

  PriorityStats({required this.maxX, required this.maxY, required this.data});
}

class OpenByClients {
  final double maxY;
  final List<BarChartGroupData> data;

  OpenByClients({
    required this.maxY,
    required this.data,
  });
}

class SlaCompliance {
  final double maxY;
  final List<BarChartGroupData> data;
  final double avgSlaCompliance;

  SlaCompliance({
    required this.maxY,
    required this.data,
    required this.avgSlaCompliance,
  });
}

class ResolvedAvg {
  final double maxY;
  final List<BarChartGroupData> data;
  final String resAvgTime;

  ResolvedAvg({
    required this.maxY,
    required this.data,
    required this.resAvgTime,
  });
}

class ReOpenedTicketRate {
  final double reOpenWeekPercent;
  final double reOpenMonthPercent;
  final double reOpenHalfYrPercent;
  final int totalReopen;
  final double totalReopenedPercentage;

  ReOpenedTicketRate({
    required this.reOpenWeekPercent,
    required this.reOpenMonthPercent,
    required this.reOpenHalfYrPercent,
    required this.totalReopen,
    required this.totalReopenedPercentage,
  });
}

class SlaMonthStats {
  final int janList;
  final int febList;
  final int marchList;
  final int aprilList;
  final int mayList;
  final int junList;
  final int julyList;
  final int augList;
  final int sepList;
  final int octList;
  final int novList;
  final int decList;

  SlaMonthStats({
    required this.janList,
    required this.febList,
    required this.marchList,
    required this.aprilList,
    required this.mayList,
    required this.junList,
    required this.julyList,
    required this.augList,
    required this.sepList,
    required this.octList,
    required this.novList,
    required this.decList,
  });
}

class ResolvedTicketRate {
  final double resolveWeekPercent;
  final double resolveMonthPercent;
  final double resolveHalfYrPercent;
  final double totalResolvedPercentage;
  final int totalResolved;

  ResolvedTicketRate({
    required this.resolveWeekPercent,
    required this.resolveMonthPercent,
    required this.resolveHalfYrPercent,
    required this.totalResolvedPercentage,
    required this.totalResolved,
  });
}

class TicketBacklogs {
  // final int openBefOnehr;
  final int low;
  final int med;
  final int high;
  final int totalBacklogs;

  TicketBacklogs({
    // required this.openBefOnehr,
    required this.low,
    required this.med,
    required this.high,
    required this.totalBacklogs,
  });
}

class SlaBreachTickets {
  final int amberListLength;
  final int redListLength;
  final int totalSlaListLenth;

  SlaBreachTickets({
    required this.amberListLength,
    required this.redListLength,
    required this.totalSlaListLenth,
  });
}

class TicketByStatus {
  final double openTicketPercentage;
  final double closeTicketPercentage;
  final double inprogressTicketPercentage;

  TicketByStatus({
    required this.openTicketPercentage,
    required this.closeTicketPercentage,
    required this.inprogressTicketPercentage,
  });
}
