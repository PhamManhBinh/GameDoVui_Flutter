class Score {
  final int id;
  final String name;
  final int score;

  const Score({required this.id,required this.name,required this.score});

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
        id: int.parse(json['id']),
        name: json['name'] as String,
        score: int.parse(json['score'])
    );
  }
}
