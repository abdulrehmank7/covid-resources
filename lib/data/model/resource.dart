class Resource {
  bool success;
  List<ResourceData> data;
  String message;

  Resource({this.success, this.data, this.message});

  Resource.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new ResourceData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class ResourceData {
  List<String> type;
  int upVote;
  int downVote;
  bool status;
  String sId;
  String name;
  String phone;
  String email;
  String state;
  String city;
  String address;
  String description;
  String link;
  String createdAt;
  String updatedAt;
  int iV;

  ResourceData(
      {this.type,
      this.upVote,
      this.downVote,
      this.status,
      this.sId,
      this.name,
      this.phone,
      this.email,
      this.state,
      this.city,
      this.address,
      this.description,
      this.link,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ResourceData.fromJson(Map<String, dynamic> json) {
    type = json['type'].cast<String>();
    upVote = json['upVote'];
    downVote = json['downVote'];
    status = json['status'];
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    description = json['description'];
    link = json['link'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['upVote'] = this.upVote;
    data['downVote'] = this.downVote;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['state'] = this.state;
    data['city'] = this.city;
    data['address'] = this.address;
    data['description'] = this.description;
    data['link'] = this.link;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
