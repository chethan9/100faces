// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPredictionListStruct extends FFFirebaseStruct {
  UserPredictionListStruct({
    String? name,
    String? image,
    String? goal,
    String? interestingFact,
    String? life,
    String? love,
    String? personalityType,
    String? statistics,
    String? work,
    String? whatsappClickableStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _image = image,
        _goal = goal,
        _interestingFact = interestingFact,
        _life = life,
        _love = love,
        _personalityType = personalityType,
        _statistics = statistics,
        _work = work,
        _whatsappClickableStatus = whatsappClickableStatus,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _id = id,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "goal" field.
  String? _goal;
  String get goal => _goal ?? '';
  set goal(String? val) => _goal = val;
  bool hasGoal() => _goal != null;

  // "interesting_fact" field.
  String? _interestingFact;
  String get interestingFact => _interestingFact ?? '';
  set interestingFact(String? val) => _interestingFact = val;
  bool hasInterestingFact() => _interestingFact != null;

  // "life" field.
  String? _life;
  String get life => _life ?? '';
  set life(String? val) => _life = val;
  bool hasLife() => _life != null;

  // "love" field.
  String? _love;
  String get love => _love ?? '';
  set love(String? val) => _love = val;
  bool hasLove() => _love != null;

  // "personality_type" field.
  String? _personalityType;
  String get personalityType => _personalityType ?? '';
  set personalityType(String? val) => _personalityType = val;
  bool hasPersonalityType() => _personalityType != null;

  // "statistics" field.
  String? _statistics;
  String get statistics => _statistics ?? '';
  set statistics(String? val) => _statistics = val;
  bool hasStatistics() => _statistics != null;

  // "work" field.
  String? _work;
  String get work => _work ?? '';
  set work(String? val) => _work = val;
  bool hasWork() => _work != null;

  // "whatsapp_clickable_status" field.
  String? _whatsappClickableStatus;
  String get whatsappClickableStatus => _whatsappClickableStatus ?? '';
  set whatsappClickableStatus(String? val) => _whatsappClickableStatus = val;
  bool hasWhatsappClickableStatus() => _whatsappClickableStatus != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;
  bool hasUpdatedAt() => _updatedAt != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  static UserPredictionListStruct fromMap(Map<String, dynamic> data) =>
      UserPredictionListStruct(
        name: data['name'] as String?,
        image: data['image'] as String?,
        goal: data['goal'] as String?,
        interestingFact: data['interesting_fact'] as String?,
        life: data['life'] as String?,
        love: data['love'] as String?,
        personalityType: data['personality_type'] as String?,
        statistics: data['statistics'] as String?,
        work: data['work'] as String?,
        whatsappClickableStatus: data['whatsapp_clickable_status'] as String?,
        createdAt: data['createdAt'] as DateTime?,
        updatedAt: data['updatedAt'] as DateTime?,
        id: castToType<int>(data['id']),
      );

  static UserPredictionListStruct? maybeFromMap(dynamic data) => data is Map
      ? UserPredictionListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'image': _image,
        'goal': _goal,
        'interesting_fact': _interestingFact,
        'life': _life,
        'love': _love,
        'personality_type': _personalityType,
        'statistics': _statistics,
        'work': _work,
        'whatsapp_clickable_status': _whatsappClickableStatus,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'goal': serializeParam(
          _goal,
          ParamType.String,
        ),
        'interesting_fact': serializeParam(
          _interestingFact,
          ParamType.String,
        ),
        'life': serializeParam(
          _life,
          ParamType.String,
        ),
        'love': serializeParam(
          _love,
          ParamType.String,
        ),
        'personality_type': serializeParam(
          _personalityType,
          ParamType.String,
        ),
        'statistics': serializeParam(
          _statistics,
          ParamType.String,
        ),
        'work': serializeParam(
          _work,
          ParamType.String,
        ),
        'whatsapp_clickable_status': serializeParam(
          _whatsappClickableStatus,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserPredictionListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserPredictionListStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        goal: deserializeParam(
          data['goal'],
          ParamType.String,
          false,
        ),
        interestingFact: deserializeParam(
          data['interesting_fact'],
          ParamType.String,
          false,
        ),
        life: deserializeParam(
          data['life'],
          ParamType.String,
          false,
        ),
        love: deserializeParam(
          data['love'],
          ParamType.String,
          false,
        ),
        personalityType: deserializeParam(
          data['personality_type'],
          ParamType.String,
          false,
        ),
        statistics: deserializeParam(
          data['statistics'],
          ParamType.String,
          false,
        ),
        work: deserializeParam(
          data['work'],
          ParamType.String,
          false,
        ),
        whatsappClickableStatus: deserializeParam(
          data['whatsapp_clickable_status'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: deserializeParam(
          data['updatedAt'],
          ParamType.DateTime,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserPredictionListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserPredictionListStruct &&
        name == other.name &&
        image == other.image &&
        goal == other.goal &&
        interestingFact == other.interestingFact &&
        life == other.life &&
        love == other.love &&
        personalityType == other.personalityType &&
        statistics == other.statistics &&
        work == other.work &&
        whatsappClickableStatus == other.whatsappClickableStatus &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        image,
        goal,
        interestingFact,
        life,
        love,
        personalityType,
        statistics,
        work,
        whatsappClickableStatus,
        createdAt,
        updatedAt,
        id
      ]);
}

UserPredictionListStruct createUserPredictionListStruct({
  String? name,
  String? image,
  String? goal,
  String? interestingFact,
  String? life,
  String? love,
  String? personalityType,
  String? statistics,
  String? work,
  String? whatsappClickableStatus,
  DateTime? createdAt,
  DateTime? updatedAt,
  int? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserPredictionListStruct(
      name: name,
      image: image,
      goal: goal,
      interestingFact: interestingFact,
      life: life,
      love: love,
      personalityType: personalityType,
      statistics: statistics,
      work: work,
      whatsappClickableStatus: whatsappClickableStatus,
      createdAt: createdAt,
      updatedAt: updatedAt,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserPredictionListStruct? updateUserPredictionListStruct(
  UserPredictionListStruct? userPredictionList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userPredictionList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserPredictionListStructData(
  Map<String, dynamic> firestoreData,
  UserPredictionListStruct? userPredictionList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userPredictionList == null) {
    return;
  }
  if (userPredictionList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userPredictionList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userPredictionListData =
      getUserPredictionListFirestoreData(userPredictionList, forFieldValue);
  final nestedData =
      userPredictionListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userPredictionList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserPredictionListFirestoreData(
  UserPredictionListStruct? userPredictionList, [
  bool forFieldValue = false,
]) {
  if (userPredictionList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userPredictionList.toMap());

  // Add any Firestore field values
  userPredictionList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserPredictionListListFirestoreData(
  List<UserPredictionListStruct>? userPredictionLists,
) =>
    userPredictionLists
        ?.map((e) => getUserPredictionListFirestoreData(e, true))
        .toList() ??
    [];
