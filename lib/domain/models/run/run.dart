class Run {
  final int? id;
  final String description;
  final int duration; // in seconds
  final double distance; // in km
  final int calories;
  final int heartRate; // BPM
  final String type; // 'Caminhada' or 'Corrida'
  final DateTime createdAt;

  Run({
    this.id,
    required this.description,
    required this.duration,
    required this.distance,
    required this.calories,
    required this.heartRate,
    required this.type,
    required this.createdAt,
  });

  String get formattedDuration {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  factory Run.fromMap(Map<String, dynamic> map) {
    return Run(
      id: map['id'] as int?,
      description: map['description'] as String,
      duration: map['duration'] as int,
      distance: (map['distance'] as num).toDouble(),
      calories: map['calories'] as int,
      heartRate: map['heart_rate'] as int,
      type: map['type'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }
}
