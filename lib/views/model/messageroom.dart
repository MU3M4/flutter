class MessageRoomModel {
  late final String messageroomid;
  late final List<String> participants;
  MessageRoomModel({required this.messageroomid, required this.participants});
  MessageRoomModel.fromJson(
      Map<String, dynamic> json, this.messageroomid, this.participants) {
    messageroomid = json['messageeroomId'];
    participants = json['participants'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messageroomid'] = messageroomid;
    data['participants'] = participants;

    return data;
  }
}
