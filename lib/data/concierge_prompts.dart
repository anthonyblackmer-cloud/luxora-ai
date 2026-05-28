/// Quick concierge chips — full prompt sent to AI when tapped.
class ConciergePromptChip {
  const ConciergePromptChip(this.label, this.prompt);

  final String label;
  final String prompt;
}

const conciergePromptChips = [
  ConciergePromptChip(
    'Romantic getaway',
    'Plan a romantic Florida getaway with rooftop sunsets, intimate dining, and slow mornings — emotionally warm, not rushed.',
  ),
  ConciergePromptChip(
    'Wellness reset',
    'I need a wellness reset: spas, springs, quiet nature, and restorative pacing across Orlando and nearby.',
  ),
  ConciergePromptChip(
    'Family magic',
    'Create family magic with theme parks balanced by springs and easy dinners — low stress for parents, wonder for kids.',
  ),
  ConciergePromptChip(
    'Hidden luxury',
    'Surprise me with hidden luxury — local-only gems, insider tables, and places tourists rarely find.',
  ),
  ConciergePromptChip(
    'Foodie adventure',
    'Build a foodie adventure: rooftops, local chefs, seasonal Florida ingredients, and one unforgettable splurge night.',
  ),
  ConciergePromptChip(
    'Soft luxury escape',
    'Design a soft luxury escape — premium but unhurried, ocean or springs, no packed schedule.',
  ),
  ConciergePromptChip(
    'Adventure mode',
    'Turn on adventure mode: eco paddles, island energy, and one bold day trip — still elegant, not backpacker.',
  ),
  ConciergePromptChip(
    'Disney after-dark',
    'Focus on Disney after-dark magic with fewer crowds, emotional pacing, and a rainy-day backup plan.',
  ),
];
