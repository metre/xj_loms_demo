
class ApplyDetailModel{



  BizObject _bizObject;
  Json _json;

  ApplyDetailModel({BizObject bizObject, Json json}) {
    this._bizObject = bizObject;
    this._json = json;
  }

  BizObject get bizObject => _bizObject;
  set bizObject(BizObject bizObject) => _bizObject = bizObject;
  Json get json => _json;
  set json(Json json) => _json = json;

  ApplyDetailModel.fromJson(Map<String, dynamic> json) {
    _bizObject = json['bizObject'] != null
        ? new BizObject.fromJson(json['bizObject'])
        : null;
    _json = json['json'] != null ? new Json.fromJson(json['json']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._bizObject != null) {
      data['bizObject'] = this._bizObject.toJson();
    }
    if (this._json != null) {
      data['json'] = this._json.toJson();
    }
    return data;
  }
}

class BizObject {
  String _stationCode;
  String _reason;
  String _createByName;
  String _address;
  String _idCard;
  String _mobile;
  String _title;
  bool _isFinished;
  Type _type;
  String _extInfo;
  String _principal;
  int _createBy;
  String _lastUpdate;
  int _id;
  String _createDate;

  BizObject(
      {String stationCode,
        String reason,
        String createByName,
        String address,
        String idCard,
        String mobile,
        String title,
        bool isFinished,
        Type type,
        String extInfo,
        String principal,
        int createBy,
        String lastUpdate,
        int id,
        String createDate}) {
    this._stationCode = stationCode;
    this._reason = reason;
    this._createByName = createByName;
    this._address = address;
    this._idCard = idCard;
    this._mobile = mobile;
    this._title = title;
    this._isFinished = isFinished;
    this._type = type;
    this._extInfo = extInfo;
    this._principal = principal;
    this._createBy = createBy;
    this._lastUpdate = lastUpdate;
    this._id = id;
    this._createDate = createDate;
  }

  String get stationCode => _stationCode;
  set stationCode(String stationCode) => _stationCode = stationCode;
  String get reason => _reason;
  set reason(String reason) => _reason = reason;
  String get createByName => _createByName;
  set createByName(String createByName) => _createByName = createByName;
  String get address => _address;
  set address(String address) => _address = address;
  String get idCard => _idCard;
  set idCard(String idCard) => _idCard = idCard;
  String get mobile => _mobile;
  set mobile(String mobile) => _mobile = mobile;
  String get title => _title;
  set title(String title) => _title = title;
  bool get isFinished => _isFinished;
  set isFinished(bool isFinished) => _isFinished = isFinished;
  Type get type => _type;
  set type(Type type) => _type = type;
  String get extInfo => _extInfo;
  set extInfo(String extInfo) => _extInfo = extInfo;
  String get principal => _principal;
  set principal(String principal) => _principal = principal;
  int get createBy => _createBy;
  set createBy(int createBy) => _createBy = createBy;
  String get lastUpdate => _lastUpdate;
  set lastUpdate(String lastUpdate) => _lastUpdate = lastUpdate;
  int get id => _id;
  set id(int id) => _id = id;
  String get createDate => _createDate;
  set createDate(String createDate) => _createDate = createDate;

  BizObject.fromJson(Map<String, dynamic> json) {
    _stationCode = json['stationCode'];
    _reason = json['reason'];
    _createByName = json['createByName'];
    _address = json['address'];
    _idCard = json['idCard'];
    _mobile = json['mobile'];
    _title = json['title'];
    _isFinished = json['isFinished'];
    _type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    _extInfo = json['extInfo'];
    _principal = json['principal'];
    _createBy = json['createBy'];
    _lastUpdate = json['lastUpdate'];
    _id = json['id'];
    _createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stationCode'] = this._stationCode;
    data['reason'] = this._reason;
    data['createByName'] = this._createByName;
    data['address'] = this._address;
    data['idCard'] = this._idCard;
    data['mobile'] = this._mobile;
    data['title'] = this._title;
    data['isFinished'] = this._isFinished;
    if (this._type != null) {
      data['type'] = this._type.toJson();
    }
    data['extInfo'] = this._extInfo;
    data['principal'] = this._principal;
    data['createBy'] = this._createBy;
    data['lastUpdate'] = this._lastUpdate;
    data['id'] = this._id;
    data['createDate'] = this._createDate;
    return data;
  }
}

class Type {
  String _hotCode;
  String _text;
  String _value;

  Type({String hotCode, String text, String value}) {
    this._hotCode = hotCode;
    this._text = text;
    this._value = value;
  }

  String get hotCode => _hotCode;
  set hotCode(String hotCode) => _hotCode = hotCode;
  String get text => _text;
  set text(String text) => _text = text;
  String get value => _value;
  set value(String value) => _value = value;

  Type.fromJson(Map<String, dynamic> json) {
    _hotCode = json['hotCode'];
    _text = json['text'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotCode'] = this._hotCode;
    data['text'] = this._text;
    data['value'] = this._value;
    return data;
  }
}

class Json {
  List<FinishList> _finishList;

  Json({List<FinishList> finishList}) {
    this._finishList = finishList;
  }

  List<FinishList> get finishList => _finishList;
  set finishList(List<FinishList> finishList) => _finishList = finishList;

  Json.fromJson(Map<String, dynamic> json) {
    if (json['finishList'] != null) {
      _finishList = new List<FinishList>();
      json['finishList'].forEach((v) {
        _finishList.add(new FinishList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._finishList != null) {
      data['finishList'] = this._finishList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FinishList {
  int _id;
  int _instanceId;
  int _acceptBy;
  String _acceptByName;
  String _changeThing;
  bool _agreed;
  String _content;
  int _doSeq;
  bool _doWith;
  String _finishDate;
  bool _timedOut;
  String _toNodeName;
  String _firstHandleDate;
  String _transferTime;
  String _transferHandleDate;
  int _transfer;
  String _transferName;
  TaskType _taskType;
  String _nodeCode;
  String _nodeName;
  String _createDate;
  ProcessMode _processMode;
  bool _notify;
  String _notifyDate;

  FinishList(
      {int id,
        int instanceId,
        int acceptBy,
        String acceptByName,
        String changeThing,
        bool agreed,
        String content,
        int doSeq,
        bool doWith,
        String finishDate,
        bool timedOut,
        String toNodeName,
        String firstHandleDate,
        String transferTime,
        String transferHandleDate,
        int transfer,
        String transferName,
        TaskType taskType,
        String nodeCode,
        String nodeName,
        String createDate,
        ProcessMode processMode,
        bool notify,
        String notifyDate}) {
    this._id = id;
    this._instanceId = instanceId;
    this._acceptBy = acceptBy;
    this._acceptByName = acceptByName;
    this._changeThing = changeThing;
    this._agreed = agreed;
    this._content = content;
    this._doSeq = doSeq;
    this._doWith = doWith;
    this._finishDate = finishDate;
    this._timedOut = timedOut;
    this._toNodeName = toNodeName;
    this._firstHandleDate = firstHandleDate;
    this._transferTime = transferTime;
    this._transferHandleDate = transferHandleDate;
    this._transfer = transfer;
    this._transferName = transferName;
    this._taskType = taskType;
    this._nodeCode = nodeCode;
    this._nodeName = nodeName;
    this._createDate = createDate;
    this._processMode = processMode;
    this._notify = notify;
    this._notifyDate = notifyDate;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get instanceId => _instanceId;
  set instanceId(int instanceId) => _instanceId = instanceId;
  int get acceptBy => _acceptBy;
  set acceptBy(int acceptBy) => _acceptBy = acceptBy;
  String get acceptByName => _acceptByName;
  set acceptByName(String acceptByName) => _acceptByName = acceptByName;
  String get changeThing => _changeThing;
  set changeThing(String changeThing) => _changeThing = changeThing;
  bool get agreed => _agreed;
  set agreed(bool agreed) => _agreed = agreed;
  String get content => _content;
  set content(String content) => _content = content;
  int get doSeq => _doSeq;
  set doSeq(int doSeq) => _doSeq = doSeq;
  bool get doWith => _doWith;
  set doWith(bool doWith) => _doWith = doWith;
  String get finishDate => _finishDate;
  set finishDate(String finishDate) => _finishDate = finishDate;
  bool get timedOut => _timedOut;
  set timedOut(bool timedOut) => _timedOut = timedOut;
  String get toNodeName => _toNodeName;
  set toNodeName(String toNodeName) => _toNodeName = toNodeName;
  String get firstHandleDate => _firstHandleDate;
  set firstHandleDate(String firstHandleDate) =>
      _firstHandleDate = firstHandleDate;
  String get transferTime => _transferTime;
  set transferTime(String transferTime) => _transferTime = transferTime;
  String get transferHandleDate => _transferHandleDate;
  set transferHandleDate(String transferHandleDate) =>
      _transferHandleDate = transferHandleDate;
  int get transfer => _transfer;
  set transfer(int transfer) => _transfer = transfer;
  String get transferName => _transferName;
  set transferName(String transferName) => _transferName = transferName;
  TaskType get taskType => _taskType;
  set taskType(TaskType taskType) => _taskType = taskType;
  String get nodeCode => _nodeCode;
  set nodeCode(String nodeCode) => _nodeCode = nodeCode;
  String get nodeName => _nodeName;
  set nodeName(String nodeName) => _nodeName = nodeName;
  String get createDate => _createDate;
  set createDate(String createDate) => _createDate = createDate;
  ProcessMode get processMode => _processMode;
  set processMode(ProcessMode processMode) => _processMode = processMode;
  bool get notify => _notify;
  set notify(bool notify) => _notify = notify;
  String get notifyDate => _notifyDate;
  set notifyDate(String notifyDate) => _notifyDate = notifyDate;

  FinishList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _instanceId = json['instanceId'];
    _acceptBy = json['acceptBy'];
    _acceptByName = json['acceptByName'];
    _changeThing = json['changeThing'];
    _agreed = json['agreed'];
    _content = json['content'];
    _doSeq = json['doSeq'];
    _doWith = json['doWith'];
    _finishDate = json['finishDate'];
    _timedOut = json['timedOut'];
    _toNodeName = json['toNodeName'];
    _firstHandleDate = json['firstHandleDate'];
    _transferTime = json['transferTime'];
    _transferHandleDate = json['transferHandleDate'];
    _transfer = json['transfer'];
    _transferName = json['transferName'];
    _taskType = json['taskType'] != null
        ? new TaskType.fromJson(json['taskType'])
        : null;
    _nodeCode = json['nodeCode'];
    _nodeName = json['nodeName'];
    _createDate = json['createDate'];
    _processMode = json['processMode'] != null
        ? new ProcessMode.fromJson(json['processMode'])
        : null;
    _notify = json['notify'];
    _notifyDate = json['notifyDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['instanceId'] = this._instanceId;
    data['acceptBy'] = this._acceptBy;
    data['acceptByName'] = this._acceptByName;
    data['changeThing'] = this._changeThing;
    data['agreed'] = this._agreed;
    data['content'] = this._content;
    data['doSeq'] = this._doSeq;
    data['doWith'] = this._doWith;
    data['finishDate'] = this._finishDate;
    data['timedOut'] = this._timedOut;
    data['toNodeName'] = this._toNodeName;
    data['firstHandleDate'] = this._firstHandleDate;
    data['transferTime'] = this._transferTime;
    data['transferHandleDate'] = this._transferHandleDate;
    data['transfer'] = this._transfer;
    data['transferName'] = this._transferName;
    if (this._taskType != null) {
      data['taskType'] = this._taskType.toJson();
    }
    data['nodeCode'] = this._nodeCode;
    data['nodeName'] = this._nodeName;
    data['createDate'] = this._createDate;
    if (this._processMode != null) {
      data['processMode'] = this._processMode.toJson();
    }
    data['notify'] = this._notify;
    data['notifyDate'] = this._notifyDate;
    return data;
  }
}

class TaskType {
  String _text;
  String _value;

  TaskType({String text, String value}) {
    this._text = text;
    this._value = value;
  }

  String get text => _text;
  set text(String text) => _text = text;
  String get value => _value;
  set value(String value) => _value = value;

  TaskType.fromJson(Map<String, dynamic> json) {
    _text = json['text'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this._text;
    data['value'] = this._value;
    return data;
  }
}

class ProcessMode {
  String _text;
  String _value;

  ProcessMode({String text, String value}) {
    this._text = text;
    this._value = value;
  }

  String get text => _text;
  set text(String text) => _text = text;
  String get value => _value;
  set value(String value) => _value = value;

  ProcessMode.fromJson(Map<String, dynamic> json) {
    _text = json['text'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this._text;
    data['value'] = this._value;
    return data;
  }
}