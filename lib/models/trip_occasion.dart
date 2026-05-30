/// Why the traveler is here — reshapes recommendations (couple vs family).
enum TripOccasion {
  general,
  coupleAnniversary,
  coupleHoneymoon,
  coupleDateNight,
  coupleProposal,
  familyWithKids,
}

extension TripOccasionX on TripOccasion {
  bool get isCouple =>
      this == TripOccasion.coupleAnniversary ||
      this == TripOccasion.coupleHoneymoon ||
      this == TripOccasion.coupleDateNight ||
      this == TripOccasion.coupleProposal;

  bool get isFamily => this == TripOccasion.familyWithKids;
}
