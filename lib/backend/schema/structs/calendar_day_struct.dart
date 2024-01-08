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
    DateTime? date,
    bool? isSelected,
    int? number,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _color = color,
        _date = date,
        _isSelected = isSelected,
        _number = number,
        super(firestoreUtilData);

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;
  bool hasColor() => _color != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  set isSelected(bool? val) => _isSelected = val;
  bool hasIsSelected() => _isSelected != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;
  void incrementNumber(int amount) => _number = number + amount;
  bool hasNumber() => _number != null;

  static CalendarDayStruct fromMap(Map<String, dynamic> data) =>
      CalendarDayStruct(
        color: getSchemaColor(data['color']),
        date: data['date'] as DateTime?,
        isSelected: data['isSelected'] as bool?,
        number: castToType<int>(data['number']),
      );

  static CalendarDayStruct? maybeFromMap(dynamic data) => data is Map
      ? CalendarDayStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'color': _color,
        'date': _date,
        'isSelected': _isSelected,
        'number': _number,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'isSelected': serializeParam(
          _isSelected,
          ParamType.bool,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
      }.withoutNulls;

  static CalendarDayStruct fromSerializableMap(Map<String, dynamic> data) =>
      CalendarDayStruct(
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        isSelected: deserializeParam(
          data['isSelected'],
          ParamType.bool,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CalendarDayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CalendarDayStruct &&
        color == other.color &&
        date == other.date &&
        isSelected == other.isSelected &&
        number == other.number;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([color, date, isSelected, number]);
}

CalendarDayStruct createCalendarDayStruct({
  Color? color,
  DateTime? date,
  bool? isSelected,
  int? number,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CalendarDayStruct(
      color: color,
      date: date,
      isSelected: isSelected,
      number: number,
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
