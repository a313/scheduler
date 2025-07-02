// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatMessage {

 ChatUser get author; int get createAtTs;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&const DeepCollectionEquality().equals(other.author, author)&&(identical(other.createAtTs, createAtTs) || other.createAtTs == createAtTs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(author),createAtTs);

@override
String toString() {
  return 'ChatMessage(author: $author, createAtTs: $createAtTs)';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 InvalidType author, int createAtTs
});




}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? author = freezed,Object? createAtTs = null,}) {
  return _then(_self.copyWith(
author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as InvalidType,createAtTs: null == createAtTs ? _self.createAtTs : createAtTs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class FileMessage implements ChatMessage {
  const FileMessage({required this.author, required this.createAtTs, required this.uri, this.roomId});
  

@override final  ChatUser author;
@override final  int createAtTs;
 final  Uri uri;
 final  String? roomId;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileMessageCopyWith<FileMessage> get copyWith => _$FileMessageCopyWithImpl<FileMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileMessage&&const DeepCollectionEquality().equals(other.author, author)&&(identical(other.createAtTs, createAtTs) || other.createAtTs == createAtTs)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.roomId, roomId) || other.roomId == roomId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(author),createAtTs,uri,roomId);

@override
String toString() {
  return 'ChatMessage.file(author: $author, createAtTs: $createAtTs, uri: $uri, roomId: $roomId)';
}


}

/// @nodoc
abstract mixin class $FileMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory $FileMessageCopyWith(FileMessage value, $Res Function(FileMessage) _then) = _$FileMessageCopyWithImpl;
@override @useResult
$Res call({
 ChatUser author, int createAtTs, Uri uri, String? roomId
});




}
/// @nodoc
class _$FileMessageCopyWithImpl<$Res>
    implements $FileMessageCopyWith<$Res> {
  _$FileMessageCopyWithImpl(this._self, this._then);

  final FileMessage _self;
  final $Res Function(FileMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? author = freezed,Object? createAtTs = null,Object? uri = null,Object? roomId = freezed,}) {
  return _then(FileMessage(
author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as ChatUser,createAtTs: null == createAtTs ? _self.createAtTs : createAtTs // ignore: cast_nullable_to_non_nullable
as int,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class DataMessage implements ChatMessage {
  const DataMessage({required this.author, required this.createAtTs, required this.data, required this.mimeType, this.roomId, this.fileName});
  

@override final  ChatUser author;
@override final  int createAtTs;
 final  Uint8List data;
 final  String mimeType;
 final  String? roomId;
 final  String? fileName;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataMessageCopyWith<DataMessage> get copyWith => _$DataMessageCopyWithImpl<DataMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataMessage&&const DeepCollectionEquality().equals(other.author, author)&&(identical(other.createAtTs, createAtTs) || other.createAtTs == createAtTs)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.fileName, fileName) || other.fileName == fileName));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(author),createAtTs,const DeepCollectionEquality().hash(data),mimeType,roomId,fileName);

@override
String toString() {
  return 'ChatMessage.data(author: $author, createAtTs: $createAtTs, data: $data, mimeType: $mimeType, roomId: $roomId, fileName: $fileName)';
}


}

/// @nodoc
abstract mixin class $DataMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory $DataMessageCopyWith(DataMessage value, $Res Function(DataMessage) _then) = _$DataMessageCopyWithImpl;
@override @useResult
$Res call({
 ChatUser author, int createAtTs, Uint8List data, String mimeType, String? roomId, String? fileName
});




}
/// @nodoc
class _$DataMessageCopyWithImpl<$Res>
    implements $DataMessageCopyWith<$Res> {
  _$DataMessageCopyWithImpl(this._self, this._then);

  final DataMessage _self;
  final $Res Function(DataMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? author = freezed,Object? createAtTs = null,Object? data = null,Object? mimeType = null,Object? roomId = freezed,Object? fileName = freezed,}) {
  return _then(DataMessage(
author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as ChatUser,createAtTs: null == createAtTs ? _self.createAtTs : createAtTs // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Uint8List,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TextMessage implements ChatMessage {
  const TextMessage({required this.author, required this.createAtTs, required this.message, this.roomId});
  

@override final  ChatUser author;
@override final  int createAtTs;
 final  String message;
 final  String? roomId;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextMessageCopyWith<TextMessage> get copyWith => _$TextMessageCopyWithImpl<TextMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextMessage&&const DeepCollectionEquality().equals(other.author, author)&&(identical(other.createAtTs, createAtTs) || other.createAtTs == createAtTs)&&(identical(other.message, message) || other.message == message)&&(identical(other.roomId, roomId) || other.roomId == roomId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(author),createAtTs,message,roomId);

@override
String toString() {
  return 'ChatMessage.text(author: $author, createAtTs: $createAtTs, message: $message, roomId: $roomId)';
}


}

/// @nodoc
abstract mixin class $TextMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory $TextMessageCopyWith(TextMessage value, $Res Function(TextMessage) _then) = _$TextMessageCopyWithImpl;
@override @useResult
$Res call({
 ChatUser author, int createAtTs, String message, String? roomId
});




}
/// @nodoc
class _$TextMessageCopyWithImpl<$Res>
    implements $TextMessageCopyWith<$Res> {
  _$TextMessageCopyWithImpl(this._self, this._then);

  final TextMessage _self;
  final $Res Function(TextMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? author = freezed,Object? createAtTs = null,Object? message = null,Object? roomId = freezed,}) {
  return _then(TextMessage(
author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as ChatUser,createAtTs: null == createAtTs ? _self.createAtTs : createAtTs // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TypingMessage implements ChatMessage {
  const TypingMessage({required this.author, required this.createAtTs});
  

@override final  ChatUser author;
@override final  int createAtTs;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypingMessageCopyWith<TypingMessage> get copyWith => _$TypingMessageCopyWithImpl<TypingMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypingMessage&&const DeepCollectionEquality().equals(other.author, author)&&(identical(other.createAtTs, createAtTs) || other.createAtTs == createAtTs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(author),createAtTs);

@override
String toString() {
  return 'ChatMessage.typing(author: $author, createAtTs: $createAtTs)';
}


}

/// @nodoc
abstract mixin class $TypingMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory $TypingMessageCopyWith(TypingMessage value, $Res Function(TypingMessage) _then) = _$TypingMessageCopyWithImpl;
@override @useResult
$Res call({
 ChatUser author, int createAtTs
});




}
/// @nodoc
class _$TypingMessageCopyWithImpl<$Res>
    implements $TypingMessageCopyWith<$Res> {
  _$TypingMessageCopyWithImpl(this._self, this._then);

  final TypingMessage _self;
  final $Res Function(TypingMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? author = freezed,Object? createAtTs = null,}) {
  return _then(TypingMessage(
author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as ChatUser,createAtTs: null == createAtTs ? _self.createAtTs : createAtTs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
