
class TaskModel {
  int _id;
  String _type;
  String _site;
  String _time;
  String _content;
  String _status;
  int _scloreId;
  int _assessStatus;
  String _createTime;
  int _taskId;

  TaskModel(
      {int id,
      String type,
      String site,
      String time,
      String content,
      String status,
      int scloreId,
      int assessStatus,
      String createTime,
      int taskId}) {
    this._id = id;
    this._type = type;
    this._site = site;
    this._time = time;
    this._content = content;
    this._status = status;
    this._scloreId = scloreId;
    this._assessStatus = assessStatus;
    this._createTime = createTime;
    this._taskId = taskId;
  }

  int get id => _id;

  set id(int id) => _id = id;

  String get type => _type;

  set type(String type) => _type = type;

  String get site => _site;

  set site(String site) => _site = site;

  String get time => _time;

  set time(String time) => _time = time;

  String get content => _content;

  set content(String content) => _content = content;


  String get status => _status;

  set status(String status) => _status = status;

  int get scloreId => _scloreId;

  set scloreId(int scloreId) => _scloreId = scloreId;

  int get assessStatus => _assessStatus;

  set assessStatus(int assessStatus) => _assessStatus = assessStatus;

  String get createTime => _createTime;

  set createTime(String createTime) => _createTime = createTime;

  int get taskId => _taskId;

  set taskId(int taskId) => _taskId = taskId;


  static List<TaskModel> fromListJson(List<dynamic> listJson){
    List<TaskModel> list = [];

    listJson?.forEach((json){
      list.add(TaskModel.fromJson(json));
    });

    return list;
  }

  TaskModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _type = json['type'];
    _site = json['site'];
    _time = json['time'];
    _content = json['content'];
    _status = json['status'];
    _scloreId = json['scloreId'];
    _assessStatus = json['assessStatus'];
    _createTime = json['createTime'];
    _taskId = json['taskId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['type'] = this._type;
    data['site'] = this._site;
    data['time'] = this._time;
    data['content'] = this._content;
    data['status'] = this._status;
    data['scloreId'] = this._scloreId;
    data['assessStatus'] = this._assessStatus;
    data['createTime'] = this._createTime;
    data['taskId'] = this._taskId;
    return data;
  }
}
