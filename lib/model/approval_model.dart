

class ApprovalModel {
  String _nodeName;
  String _acceptDate;
  String _createByName;
  String _bizTitle;
  String _nodeCode;
  String _flowName;
  String _sysModule;
  String _imgUrl;
  int _acceptBy;
  int _createBy;
  int _instanceId;
  String _flowCode;
  int _waitTaskId;
  String _archiveDate;
  String _bizId;
  String _archiveStatus;
  String _finishDate;
  int _finishTaskId;
  int _flowId;
  bool _agreed;
  String _createDate;
  String _stationId;
  String _status;

  ApprovalModel(
      {String nodeName,
        String acceptDate,
        String createByName,
        String bizTitle,
        String nodeCode,
        String flowName,
        String sysModule,
        String imgUrl,
        int acceptBy,
        int createBy,
        int instanceId,
        String flowCode,
        int waitTaskId,
        String archiveDate,
        String bizId,
        String archiveStatus,
        String finishDate,
        int finishTaskId,
        int flowId,
        bool agreed,
        String createDate,
        String stationId,
        String status}) {
    this._nodeName = nodeName;
    this._acceptDate = acceptDate;
    this._createByName = createByName;
    this._bizTitle = bizTitle;
    this._nodeCode = nodeCode;
    this._flowName = flowName;
    this._sysModule = sysModule;
    this._imgUrl = imgUrl;
    this._acceptBy = acceptBy;
    this._createBy = createBy;
    this._instanceId = instanceId;
    this._flowCode = flowCode;
    this._waitTaskId = waitTaskId;
    this._archiveDate = archiveDate;
    this._bizId = bizId;
    this._archiveStatus = archiveStatus;
    this._finishDate = finishDate;
    this._finishTaskId = finishTaskId;
    this._flowId = flowId;
    this._agreed = agreed;
    this._createDate = createDate;
    this._stationId = stationId;
    this._status = status;
  }

  String get nodeName => _nodeName;
  set nodeName(String nodeName) => _nodeName = nodeName;
  String get acceptDate => _acceptDate;
  set acceptDate(String acceptDate) => _acceptDate = acceptDate;
  String get createByName => _createByName;
  set createByName(String createByName) => _createByName = createByName;
  String get bizTitle => _bizTitle;
  set bizTitle(String bizTitle) => _bizTitle = bizTitle;
  String get nodeCode => _nodeCode;
  set nodeCode(String nodeCode) => _nodeCode = nodeCode;
  String get flowName => _flowName;
  set flowName(String flowName) => _flowName = flowName;
  String get sysModule => _sysModule;
  set sysModule(String sysModule) => _sysModule = sysModule;
  String get imgUrl => _imgUrl;
  set imgUrl(String imgUrl) => _imgUrl = imgUrl;
  int get acceptBy => _acceptBy;
  set acceptBy(int acceptBy) => _acceptBy = acceptBy;
  int get createBy => _createBy;
  set createBy(int createBy) => _createBy = createBy;
  int get instanceId => _instanceId;
  set instanceId(int instanceId) => _instanceId = instanceId;
  String get flowCode => _flowCode;
  set flowCode(String flowCode) => _flowCode = flowCode;
  int get waitTaskId => _waitTaskId;
  set waitTaskId(int waitTaskId) => _waitTaskId = waitTaskId;
  String get archiveDate => _archiveDate;
  set archiveDate(String archiveDate) => _archiveDate = archiveDate;
  String get bizId => _bizId;
  set bizId(String bizId) => _bizId = bizId;
  String get archiveStatus => _archiveStatus;
  set archiveStatus(String archiveStatus) => _archiveStatus = archiveStatus;
  String get finishDate => _finishDate;
  set finishDate(String finishDate) => _finishDate = finishDate;
  int get finishTaskId => _finishTaskId;
  set finishTaskId(int finishTaskId) => _finishTaskId = finishTaskId;
  int get flowId => _flowId;
  set flowId(int flowId) => _flowId = flowId;
  bool get agreed => _agreed;
  set agreed(bool agreed) => _agreed = agreed;
  String get createDate => _createDate;
  set createDate(String createDate) => _createDate = createDate;
  String get stationId => _stationId;
  set stationId(String stationId) => _stationId = stationId;
  String get status => _status;
  set status(String status) => _status = status;


  static List<ApprovalModel> fromListJson(List<dynamic> listJson){
    List<ApprovalModel> list = [];
    listJson?.forEach((json){
      list.add(ApprovalModel.fromJson(json));
    });
    return list;
  }

  ApprovalModel.fromJson(Map<String, dynamic> json) {
    _nodeName = json['nodeName'];
    _acceptDate = json['acceptDate'];
    _createByName = json['createByName'];
    _bizTitle = json['bizTitle'];
    _nodeCode = json['nodeCode'];
    _flowName = json['flowName'];
    _sysModule = json['sysModule'];
    _imgUrl = json['imgUrl'];
    _acceptBy = json['acceptBy'];
    _createBy = json['createBy'];
    _instanceId = json['instanceId'];
    _flowCode = json['flowCode'];
    _waitTaskId = json['waitTaskId'];
    _archiveDate = json['archiveDate'];
    _bizId = json['bizId'];
    _archiveStatus = json['archiveStatus'];
    _finishDate = json['finishDate'];
    _finishTaskId = json['finishTaskId'];
    _flowId = json['flowId'];
    _agreed = json['agreed'];
    _createDate = json['createDate'];
    _stationId = json['stationId'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nodeName'] = this._nodeName;
    data['acceptDate'] = this._acceptDate;
    data['createByName'] = this._createByName;
    data['bizTitle'] = this._bizTitle;
    data['nodeCode'] = this._nodeCode;
    data['flowName'] = this._flowName;
    data['sysModule'] = this._sysModule;
    data['imgUrl'] = this._imgUrl;
    data['acceptBy'] = this._acceptBy;
    data['createBy'] = this._createBy;
    data['instanceId'] = this._instanceId;
    data['flowCode'] = this._flowCode;
    data['waitTaskId'] = this._waitTaskId;
    data['archiveDate'] = this._archiveDate;
    data['bizId'] = this._bizId;
    data['archiveStatus'] = this._archiveStatus;
    data['finishDate'] = this._finishDate;
    data['finishTaskId'] = this._finishTaskId;
    data['flowId'] = this._flowId;
    data['agreed'] = this._agreed;
    data['createDate'] = this._createDate;
    data['stationId'] = this._stationId;
    data['status'] = this._status;
    return data;
  }
}