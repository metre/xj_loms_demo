
class TaskDetailModel {
  int _taskItemStatus;
  int _taskItemId;
  TaskItemProcessBo _taskItemProcessBo;
  String _taskItemStatusName;
  String _taskTypeName;
  String _templateId;
  String _patrollerName;
  int _taskType;
  String _siteNo;
  String _taskContent;
  String _sendMateriel;
  String _areaNo;
  String _areaName;
  String _createTime;
  String _taskName;
  int _patrollerScore;
  String _expectFinishedTime;

  TaskDetailModel(
      {int taskItemStatus,
        int taskItemId,
        TaskItemProcessBo taskItemProcessBo,
        String taskItemStatusName,
        String taskTypeName,
        Null templateId,
        String patrollerName,
        int taskType,
        String siteNo,
        String taskContent,
        String sendMateriel,
        Null areaNo,
        String areaName,
        String createTime,
        Null taskName,
        Null patrollerScore,
        String expectFinishedTime}) {
    this._taskItemStatus = taskItemStatus;
    this._taskItemId = taskItemId;
    this._taskItemProcessBo = taskItemProcessBo;
    this._taskItemStatusName = taskItemStatusName;
    this._taskTypeName = taskTypeName;
    this._templateId = templateId;
    this._patrollerName = patrollerName;
    this._taskType = taskType;
    this._siteNo = siteNo;
    this._taskContent = taskContent;
    this._sendMateriel = sendMateriel;
    this._areaNo = areaNo;
    this._areaName = areaName;
    this._createTime = createTime;
    this._taskName = taskName;
    this._patrollerScore = patrollerScore;
    this._expectFinishedTime = expectFinishedTime;
  }

  int get taskItemStatus => _taskItemStatus;
  set taskItemStatus(int taskItemStatus) => _taskItemStatus = taskItemStatus;
  int get taskItemId => _taskItemId;
  set taskItemId(int taskItemId) => _taskItemId = taskItemId;
  TaskItemProcessBo get taskItemProcessBo => _taskItemProcessBo;
  set taskItemProcessBo(TaskItemProcessBo taskItemProcessBo) =>
      _taskItemProcessBo = taskItemProcessBo;
  String get taskItemStatusName => _taskItemStatusName;
  set taskItemStatusName(String taskItemStatusName) =>
      _taskItemStatusName = taskItemStatusName;
  String get taskTypeName => _taskTypeName;
  set taskTypeName(String taskTypeName) => _taskTypeName = taskTypeName;
  Null get templateId => _templateId;
  set templateId(Null templateId) => _templateId = templateId;
  String get patrollerName => _patrollerName;
  set patrollerName(String patrollerName) => _patrollerName = patrollerName;
  int get taskType => _taskType;
  set taskType(int taskType) => _taskType = taskType;
  String get siteNo => _siteNo;
  set siteNo(String siteNo) => _siteNo = siteNo;
  String get taskContent => _taskContent;
  set taskContent(String taskContent) => _taskContent = taskContent;
  String get sendMateriel => _sendMateriel;
  set sendMateriel(String sendMateriel) => _sendMateriel = sendMateriel;
  Null get areaNo => _areaNo;
  set areaNo(Null areaNo) => _areaNo = areaNo;
  String get areaName => _areaName;
  set areaName(String areaName) => _areaName = areaName;
  String get createTime => _createTime;
  set createTime(String createTime) => _createTime = createTime;
  Null get taskName => _taskName;
  set taskName(Null taskName) => _taskName = taskName;
  Null get patrollerScore => _patrollerScore;
  set patrollerScore(Null patrollerScore) => _patrollerScore = patrollerScore;
  String get expectFinishedTime => _expectFinishedTime;
  set expectFinishedTime(String expectFinishedTime) =>
      _expectFinishedTime = expectFinishedTime;

  TaskDetailModel.fromJson(Map<String, dynamic> json) {
    _taskItemStatus = json['taskItemStatus'];
    _taskItemId = json['taskItemId'];
    _taskItemProcessBo = json['taskItemProcessBo'] != null
        ? new TaskItemProcessBo.fromJson(json['taskItemProcessBo'])
        : null;
    _taskItemStatusName = json['taskItemStatusName'];
    _taskTypeName = json['taskTypeName'];
    _templateId = json['templateId'];
    _patrollerName = json['patrollerName'];
    _taskType = json['taskType'];
    _siteNo = json['siteNo'];
    _taskContent = json['taskContent'];
    _sendMateriel = json['sendMateriel'];
    _areaNo = json['areaNo'];
    _areaName = json['areaName'];
    _createTime = json['createTime'];
    _taskName = json['taskName'];
    _patrollerScore = json['patrollerScore'];
    _expectFinishedTime = json['expectFinishedTime'];
  }


  static List<TaskDetailModel> fromListJson(List<dynamic> listJson){
    List<TaskDetailModel> list = [];

    listJson?.forEach((json){
      list.add(TaskDetailModel.fromJson(json));
    });

    return list;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskItemStatus'] = this._taskItemStatus;
    data['taskItemId'] = this._taskItemId;
    if (this._taskItemProcessBo != null) {
      data['taskItemProcessBo'] = this._taskItemProcessBo.toJson();
    }
    data['taskItemStatusName'] = this._taskItemStatusName;
    data['taskTypeName'] = this._taskTypeName;
    data['templateId'] = this._templateId;
    data['patrollerName'] = this._patrollerName;
    data['taskType'] = this._taskType;
    data['siteNo'] = this._siteNo;
    data['taskContent'] = this._taskContent;
    data['sendMateriel'] = this._sendMateriel;
    data['areaNo'] = this._areaNo;
    data['areaName'] = this._areaName;
    data['createTime'] = this._createTime;
    data['taskName'] = this._taskName;
    data['patrollerScore'] = this._patrollerScore;
    data['expectFinishedTime'] = this._expectFinishedTime;
    return data;
  }
}

class TaskItemProcessBo {
  Null _confirmContent;

  TaskItemProcessBo({Null confirmContent}) {
    this._confirmContent = confirmContent;
  }

  Null get confirmContent => _confirmContent;
  set confirmContent(Null confirmContent) => _confirmContent = confirmContent;

  TaskItemProcessBo.fromJson(Map<String, dynamic> json) {
    _confirmContent = json['confirmContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmContent'] = this._confirmContent;
    return data;
  }
}