part of 'youtube_player_cubit.dart';

class YoutubePlayerState extends Equatable {
  final LoadStatus loadDataStatus;
  final double volume;
  final bool isMute;
  final bool isPlayerReady;

  const YoutubePlayerState({
    this.loadDataStatus = LoadStatus.initial,
    this.volume = 100,
    this.isMute = false,
    this.isPlayerReady = false,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
    volume,
    isMute,
    isPlayerReady,
      ];

  YoutubePlayerState copyWith({
    LoadStatus? loadDataStatus,
    double? volume,
    bool? isMute,
    bool? isPlayerReady,
  }) {
    return YoutubePlayerState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      volume: volume ?? this.volume,
      isMute: isMute ?? this.isMute,
      isPlayerReady: isPlayerReady ?? this.isPlayerReady,
    );
  }
}
