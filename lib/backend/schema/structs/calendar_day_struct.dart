// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalendarDayStruct extends FFFirebaseStruct {
  CalendarDayStruct({
    Color? color,
    int? number,
    bool? isSelected,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _color = color,
        _number = number,
        _isSelected = isSelected,
        super(firestoreUtilData);

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;
  bool hasColor() => _color != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;
  void incrementNumber(int amount) => _number = number + amount;
  bool hasNumber() => _number != null;

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  set isSelected(bool? val) => _isSelected = val;
  bool hasIsSelected() => _isSelected != null;

  static CalendarDayStruct fromMap(Map<String, dynamic> data) =>
      CalendarDayStruct(
        color: getSchemaColor(data['color']),
        number: castToType<int>(data['number']),
        isSelected: data['isSelected'] as bool?,
      );

  static CalendarDayStruct? maybeFromMap(dynamic data) => data is Map
      ? CalendarDayStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'color': _color,
        'number': _number,
        'isSelected': _isSelected,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'isSelected': serializeParam(
          _isSelected,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CalendarDayStruct fromSerializableMap(Map<String, dynamic> data) =>
      CalendarDayStruct(
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        isSelected: deserializeParam(
          data['isSelected'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CalendarDayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CalendarDayStruct &&
        color == other.color &&
        number == other.number &&
        isSelected == other.isSelected;
  }

  @override
  int get hashCode => const ListEquality().hash([color, number, isSelected]);
}

CalendarDayStruct createCalendarDayStruct({
  Color? color,
  int? number,
  bool? isSelected,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CalendarDayStruct(
      color: color,
      number: number,
      isSelected: isSelected,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CalendarDayStruct? updateCalendarDayStruct(
  CalendarDayStruct? calendarDay, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    calendarDay
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCalendarDayStructData(
  Map<String, dynamic> firestoreData,
  CalendarDayStruct? calendarDay,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (calendarDay == null) {
    return;
  }
  if (calendarDay.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && calendarDay.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final calendarDayData =
      getCalendarDayFirestoreData(calendarDay, forFieldValue);
  final nestedData =
      calendarDayData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = calendarDay.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCalendarDayFirestoreData(
  CalendarDayStruct? calendarDay, [
  bool forFieldValue = false,
]) {
  if (calendarDay == null) {
    return {};
  }
  final firestoreData = mapToFirestore(calendarDay.toMap());

  // Add any Firestore field values
  calendarDay.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCalendarDayListFirestoreData(
  List<CalendarDayStruct>? calendarDays,
) =>
    calendarDays?.map((e) => getCalendarDayFirestoreData(e, true)).toList() ??
    [];
