// import 'package:audio_service/audio_service.dart';
// import 'package:audio_session/audio_session.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:rxdart/rxdart.dart';

// mixin QueueHandler on BaseAudioHandler {
//   Stream<QueueState> get queueState;
//   Future<void> moveQueueItem(int currentIndex, int newIndex);
//   ValueStream<double> get volume;
//   Future<void> setVolume(double volume);
//   ValueStream<double> get speed;
// }

// class AudioHandlerImpl extends BaseAudioHandler
//     with SeekHandler, QueueHandler
//     implements AudioHandler {
//   final BehaviorSubject<List<MediaItem>> _recentSubject =
//       BehaviorSubject.seeded(<MediaItem>[]);

//   final _player = AudioPlayer();
//   final _playlist = ConcatenatingAudioSource(children: []);
//   @override
//   final BehaviorSubject<double> volume = BehaviorSubject.seeded(1.0);
//   @override
//   final BehaviorSubject<double> speed = BehaviorSubject.seeded(1.0);
//   final _mediaItemExpando = Expando<MediaItem>();

//   /// A stream of the current effective sequence from just_audio.
//   Stream<List<IndexedAudioSource>> get _effectiveSequence => Rx.combineLatest3<
//               List<IndexedAudioSource>?,
//               List<int>?,
//               bool,
//               List<IndexedAudioSource>?>(_player.sequenceStream,
//           _player.shuffleIndicesStream, _player.shuffleModeEnabledStream,
//           (sequence, shuffleIndices, shuffleModeEnabled) {
//         if (sequence == null) return [];
//         if (!shuffleModeEnabled) return sequence;
//         if (shuffleIndices == null) return null;
//         if (shuffleIndices.length != sequence.length) return null;
//         return shuffleIndices.map((i) => sequence[i]).toList();
//       }).whereType<List<IndexedAudioSource>>();

//   /// Computes the effective queue index taking shuffle mode into account.
//   int? getQueueIndex(
//       int? currentIndex, bool shuffleModeEnabled, List<int>? shuffleIndices) {
//     final effectiveIndices = _player.effectiveIndices ?? [];
//     final shuffleIndicesInv = List.filled(effectiveIndices.length, 0);
//     for (var i = 0; i < effectiveIndices.length; i++) {
//       shuffleIndicesInv[effectiveIndices[i]] = i;
//     }
//     return (shuffleModeEnabled &&
//             ((currentIndex ?? 0) < shuffleIndicesInv.length))
//         ? shuffleIndicesInv[currentIndex ?? 0]
//         : currentIndex;
//   }

//   /// A stream reporting the combined state of the current queue and the current
//   /// media item within that queue.
//   @override
//   Stream<QueueState> get queueState =>
//       Rx.combineLatest3<List<MediaItem>, PlaybackState, List<int>, QueueState>(
//           queue,
//           playbackState,
//           _player.shuffleIndicesStream.whereType<List<int>>(),
//           (queue, playbackState, shuffleIndices) => QueueState(
//                 queue,
//                 playbackState.queueIndex,
//                 playbackState.shuffleMode == AudioServiceShuffleMode.all
//                     ? shuffleIndices
//                     : null,
//                 playbackState.repeatMode,
//               )).where((state) =>
//           state.shuffleIndices == null ||
//           state.queue.length == state.shuffleIndices!.length);

//   @override
//   Future<void> setShuffleMode(AudioServiceShuffleMode shuffleMode) async {
//     final enabled = shuffleMode == AudioServiceShuffleMode.all;
//     if (enabled) {
//       await _player.shuffle();
//     }
//     playbackState.add(playbackState.value.copyWith(shuffleMode: shuffleMode));
//     await _player.setShuffleModeEnabled(enabled);
//   }

//   @override
//   Future<void> setRepeatMode(AudioServiceRepeatMode repeatMode) async {
//     playbackState.add(playbackState.value.copyWith(repeatMode: repeatMode));
//     await _player.setLoopMode(LoopMode.values[repeatMode.index]);
//   }

//   @override
//   Future<void> setSpeed(double speed) async {
//     this.speed.add(speed);
//     await _player.setSpeed(speed);
//   }

//   @override
//   Future<void> setVolume(double volume) async {
//     this.volume.add(volume);
//     await _player.setVolume(volume);
//   }

//   AudioHandlerImpl() {
//     _init();
//   }
//   Future<void> _init() async {
//     final session = await AudioSession.instance;
//     await session.configure(const AudioSessionConfiguration.speech());
//     // Broadcast speed changes. Debounce so that we don't flood the notification
//     // with updates.
//     speed.debounceTime(const Duration(milliseconds: 250)).listen((speed) {
//       playbackState.add(playbackState.value.copyWith(speed: speed));
//     });
//     // Load and broadcast the initial queue

//     // For Android 11, record the most recent item so it can be resumed.
//     mediaItem
//         .whereType<MediaItem>()
//         .listen((item) => _recentSubject.add([item]));
//     // Broadcast media item changes.
//     Rx.combineLatest4<int?, List<MediaItem>, bool, List<int>?, MediaItem?>(
//         _player.currentIndexStream,
//         queue,
//         _player.shuffleModeEnabledStream,
//         _player.shuffleIndicesStream,
//         (index, queue, shuffleModeEnabled, shuffleIndices) {
//       final queueIndex =
//           getQueueIndex(index, shuffleModeEnabled, shuffleIndices);
//       return (queueIndex != null && queueIndex < queue.length)
//           ? queue[queueIndex]
//           : null;
//     }).whereType<MediaItem>().distinct().listen(mediaItem.add);
//     // Propagate all events from the audio player to AudioService clients.
//     _player.playbackEventStream.listen(_broadcastState);
//     _player.shuffleModeEnabledStream
//         .listen((enabled) => _broadcastState(_player.playbackEvent));
//     // In this example, the service stops when reaching the end.
//     _player.processingStateStream.listen((state) {
//       if (state == ProcessingState.completed) {
//         stop();
//         _player.seek(Duration.zero, index: 0);
//       }
//     });
//     // Broadcast the current queue.
//     _effectiveSequence
//         .map((sequence) =>
//             sequence.map((source) => _mediaItemExpando[source]!).toList())
//         .pipe(queue);
//   }

//   AudioSource _itemToSource(MediaItem mediaItem) {
//     final extra = mediaItem.extras;
//     final uri = extra?['uri'];
//     final audioSource = AudioSource.uri(Uri.parse(uri));
//     _mediaItemExpando[audioSource] = mediaItem;
//     return audioSource;
//   }

//   List<AudioSource> _itemsToSources(List<MediaItem> mediaItems) =>
//       mediaItems.map(_itemToSource).toList();

//   @override
//   Future<List<MediaItem>> getChildren(String parentMediaId,
//       [Map<String, dynamic>? options]) async {
//     switch (parentMediaId) {
//       case AudioService.recentRootId:
//         // When the user resumes a media session, tell the system what the most
//         // recently played item was.
//         return _recentSubject.value;
//       default:
//         return []; // Allow client to browse the media library.
//     }
//   }

//   @override
//   ValueStream<Map<String, dynamic>> subscribeToChildren(String parentMediaId) {
//     // switch (parentMediaId) {
//     //   case AudioService.recentRootId:
//     final stream = _recentSubject.map((_) => <String, dynamic>{});
//     return _recentSubject.hasValue
//         ? stream.shareValueSeeded(<String, dynamic>{})
//         : stream.shareValue();
//     // default:
//     //   return Stream.value(_mediaLibrary.items[parentMediaId])
//     //       .map((_) => <String, dynamic>{})
//     //       .shareValue();
//     // }
//   }

//   @override
//   Future<void> addQueueItem(MediaItem mediaItem) async {
//     await _playlist.add(_itemToSource(mediaItem));
//   }

//   @override
//   Future<void> addQueueItems(List<MediaItem> mediaItems) async {
//     await _playlist.addAll(_itemsToSources(mediaItems));
//   }

//   @override
//   Future<void> insertQueueItem(int index, MediaItem mediaItem) async {
//     await _playlist.insert(index, _itemToSource(mediaItem));
//   }

//   @override
//   Future<void> updateQueue(List<MediaItem> queue) async {
//     await _playlist.clear();
//     await _playlist.addAll(_itemsToSources(queue)); // Load the playlist.
//     await _player.setAudioSource(_playlist);
//   }

//   @override
//   Future<void> updateMediaItem(MediaItem mediaItem) async {
//     final index = queue.value.indexWhere((item) => item.id == mediaItem.id);
//     _mediaItemExpando[_player.sequence![index]] = mediaItem;
//   }

//   @override
//   Future<void> removeQueueItem(MediaItem mediaItem) async {
//     final index = queue.value.indexOf(mediaItem);
//     await _playlist.removeAt(index);
//   }

//   @override
//   Future<void> moveQueueItem(int currentIndex, int newIndex) async {
//     await _playlist.move(currentIndex, newIndex);
//   }

//   @override
//   Future<void> skipToNext() => _player.seekToNext();

//   @override
//   Future<void> skipToPrevious() => _player.seekToPrevious();

//   @override
//   Future<void> skipToQueueItem(int index) async {
//     if (index < 0 || index >= _playlist.children.length) return;
//     // This jumps to the beginning of the queue item at [index].
//     _player.seek(Duration.zero,
//         index: _player.shuffleModeEnabled
//             ? _player.shuffleIndices![index]
//             : index);
//   }

//   @override
//   Future<void> play() => _player.play();

//   @override
//   Future<void> pause() => _player.pause();

//   @override
//   Future<void> seek(Duration position) => _player.seek(position);

//   @override
//   Future<void> stop() async {
//     await _player.stop();
//     await playbackState.firstWhere(
//         (state) => state.processingState == AudioProcessingState.idle);
//   }

//   /// Broadcasts the current state to all clients.
//   void _broadcastState(PlaybackEvent event) {
//     final playing = _player.playing;
//     final queueIndex = getQueueIndex(
//         event.currentIndex, _player.shuffleModeEnabled, _player.shuffleIndices);
//     playbackState.add(playbackState.value.copyWith(
//       controls: [
//         MediaControl.skipToPrevious,
//         if (playing) MediaControl.pause else MediaControl.play,
//         MediaControl.stop,
//         MediaControl.skipToNext,
//       ],
//       systemActions: const {
//         MediaAction.seek,
//         MediaAction.seekForward,
//         MediaAction.seekBackward,
//       },
//       androidCompactActionIndices: const [0, 1, 3],
//       processingState: const {
//         ProcessingState.idle: AudioProcessingState.idle,
//         ProcessingState.loading: AudioProcessingState.loading,
//         ProcessingState.buffering: AudioProcessingState.buffering,
//         ProcessingState.ready: AudioProcessingState.ready,
//         ProcessingState.completed: AudioProcessingState.completed,
//       }[_player.processingState]!,
//       playing: playing,
//       updatePosition: _player.position,
//       bufferedPosition: _player.bufferedPosition,
//       speed: _player.speed,
//       queueIndex: queueIndex,
//     ));
//   }
// }

// class QueueState {
//   static const QueueState empty =
//       QueueState([], 0, [], AudioServiceRepeatMode.none);

//   final List<MediaItem> queue;
//   final int? queueIndex;
//   final List<int>? shuffleIndices;
//   final AudioServiceRepeatMode repeatMode;

//   const QueueState(
//       this.queue, this.queueIndex, this.shuffleIndices, this.repeatMode);

//   bool get hasPrevious =>
//       repeatMode != AudioServiceRepeatMode.none || (queueIndex ?? 0) > 0;
//   bool get hasNext =>
//       repeatMode != AudioServiceRepeatMode.none ||
//       (queueIndex ?? 0) + 1 < queue.length;

//   List<int> get indices =>
//       shuffleIndices ?? List.generate(queue.length, (i) => i);
// }
