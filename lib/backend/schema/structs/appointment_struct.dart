// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentStruct extends FFFirebaseStruct {
  AppointmentStruct({
    String? eventId,
    String? title,
    String? description,
    DateTime? date,
    DateTime? startTime,
    Color? color,
    DateTime? endDate,
    DateTime? endTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _eventId = eventId,
        _title = title,
        _description = description,
        _date = date,
        _startTime = startTime,
        _color = color,
        _endDate = endDate,
        _endTime = endTime,
        super(firestoreUtilData);

  // "eventId" field.
  String? _eventId;
  String get eventId => _eventId ?? '';
  set eventId(String? val) => _eventId = val;
  bool hasEventId() => _eventId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;
  bool hasStartTime() => _startTime != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;
  bool hasColor() => _color != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? val) => _endDate = val;
  bool hasEndDate() => _endDate != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? val) => _endTime = val;
  bool hasEndTime() => _endTime != null;

  static AppointmentStruct fromMap(Map<String, dynamic> data) =>
      AppointmentStruct(
        eventId: data['eventId'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        date: data['date'] as DateTime?,
        startTime: data['startTime'] as DateTime?,
        color: getSchemaColor(data['color']),
        endDate: data['endDate'] as DateTime?,
        endTime: data['endTime'] as DateTime?,
      );

  static AppointmentStruct? maybeFromMap(dynamic data) => data is Map
      ? AppointmentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'eventId': _eventId,
        'title': _title,
        'description': _description,
        'date': _date,
        'startTime': _startTime,
        'color': _color,
        'endDate': _endDate,
        'endTime': _endTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'eventId': serializeParam(
          _eventId,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'startTime': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'endDate': serializeParam(
          _endDate,
          ParamType.DateTime,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static AppointmentStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppointmentStruct(
        eventId: deserializeParam(
          data['eventId'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        startTime: deserializeParam(
          data['startTime'],
          ParamType.DateTime,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        endDate: deserializeParam(
          data['endDate'],
          ParamType.DateTime,
          false,
        ),
        endTime: deserializeParam(
          data['endTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'AppointmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppointmentStruct &&
        eventId == other.eventId &&
        title == other.title &&
        description == other.description &&
        date == other.date &&
        startTime == other.startTime &&
        color == other.color &&
        endDate == other.endDate &&
        endTime == other.endTime;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [eventId, title, description, date, startTime, color, endDate, endTime]);
}

AppointmentStruct createAppointmentStruct({
  String? eventId,
  String? title,
  String? description,
  DateTime? date,
  DateTime? startTime,
  Color? color,
  DateTime? endDate,
  DateTime? endTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppointmentStruct(
      eventId: eventId,
      title: title,
      description: description,
      date: date,
      startTime: startTime,
      color: color,
      endDate: endDate,
      endTime: endTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppointmentStruct? updateAppointmentStruct(
  AppointmentStruct? appointment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    appointment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppointmentStructData(
  Map<String, dynamic> firestoreData,
  AppointmentStruct? appointment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (appointment == null) {
    return;
  }
  if (appointment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && appointment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appointmentData =
      getAppointmentFirestoreData(appointment, forFieldValue);
  final nestedData =
      appointmentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = appointment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppointmentFirestoreData(
  AppointmentStruct? appointment, [
  bool forFieldValue = false,
]) {
  if (appointment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(appointment.toMap());

  // Add any Firestore field values
  appointment.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppointmentListFirestoreData(
  List<AppointmentStruct>? appointments,
) =>
    appointments?.map((e) => getAppointmentFirestoreData(e, true)).toList() ??
    [];
