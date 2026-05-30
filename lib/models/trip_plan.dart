class TripPlan {
  const TripPlan({
    required this.id,
    required this.title,
    required this.days,
  });

  final String id;
  final String title;
  final List<TripDay> days;
}

class TripDay {
  const TripDay({
    required this.dayNumber,
    required this.label,
    required this.items,
  });

  final int dayNumber;
  final String label;
  final List<TripItem> items;
}

class TripItem {
  const TripItem({
    required this.id,
    required this.time,
    required this.title,
    required this.emotionalLine,
    required this.location,
    required this.category,
    this.placeId,
    this.ticketDealId,
  });

  final String id;
  final String time;
  final String title;
  final String emotionalLine;
  final String location;
  final String category;
  final String? placeId;

  /// Smart Ticket Savings deal attached by Concierge — opens reseller link.
  final String? ticketDealId;

  TripItem copyWith({
    String? ticketDealId,
  }) {
    return TripItem(
      id: id,
      time: time,
      title: title,
      emotionalLine: emotionalLine,
      location: location,
      category: category,
      placeId: placeId,
      ticketDealId: ticketDealId ?? this.ticketDealId,
    );
  }
}
