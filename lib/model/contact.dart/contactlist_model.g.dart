// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactListAdapter extends TypeAdapter<ContactList> {
  @override
  final int typeId = 1;

  @override
  ContactList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactList(
      description: fields[0] as String,
      amount: fields[1] as String,
      isDone: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ContactList obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
