class GarageDetail {
  AdminDetails? adminDetails;
  Appointments? appointments;
  GarageDetails? garageDetails;
  MechanicsDetails? mechanicsDetails;
  Users? users;

  GarageDetail(
      {this.adminDetails,
      this.appointments,
      this.garageDetails,
      this.mechanicsDetails,
      this.users});

  GarageDetail.fromJson(Map<String, dynamic> json) {
    adminDetails = json['AdminDetails'] != null
        ? new AdminDetails.fromJson(json['AdminDetails'])
        : null;
    appointments = json['Appointments'] != null
        ? new Appointments.fromJson(json['Appointments'])
        : null;
    garageDetails = json['GarageDetails'] != null
        ? new GarageDetails.fromJson(json['GarageDetails'])
        : null;
    mechanicsDetails = json['MechanicsDetails'] != null
        ? new MechanicsDetails.fromJson(json['MechanicsDetails'])
        : null;
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.adminDetails != null) {
      data['AdminDetails'] = this.adminDetails!.toJson();
    }
    if (this.appointments != null) {
      data['Appointments'] = this.appointments!.toJson();
    }
    if (this.garageDetails != null) {
      data['GarageDetails'] = this.garageDetails!.toJson();
    }
    if (this.mechanicsDetails != null) {
      data['MechanicsDetails'] = this.mechanicsDetails!.toJson();
    }
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    return data;
  }
}

class AdminDetails {
  String? email;
  String? iDNumber;
  String? name;
  String? phoneNumber;

  AdminDetails({this.email, this.iDNumber, this.name, this.phoneNumber});

  AdminDetails.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    iDNumber = json['IDNumber'];
    name = json['Name'];
    phoneNumber = json['PhoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['IDNumber'] = this.iDNumber;
    data['Name'] = this.name;
    data['PhoneNumber'] = this.phoneNumber;
    return data;
  }
}

class Appointments {
  ActiveAppointments? activeAppointments;
  ActiveAppointments? allAppointments;
  ActiveAppointments? completedAppointments;

  Appointments(
      {this.activeAppointments,
      this.allAppointments,
      this.completedAppointments});

  Appointments.fromJson(Map<String, dynamic> json) {
    activeAppointments = json['ActiveAppointments'] != null
        ? new ActiveAppointments.fromJson(json['ActiveAppointments'])
        : null;
    allAppointments = json['AllAppointments'] != null
        ? new ActiveAppointments.fromJson(json['AllAppointments'])
        : null;
    completedAppointments = json['CompletedAppointments'] != null
        ? new ActiveAppointments.fromJson(json['CompletedAppointments'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activeAppointments != null) {
      data['ActiveAppointments'] = this.activeAppointments!.toJson();
    }
    if (this.allAppointments != null) {
      data['AllAppointments'] = this.allAppointments!.toJson();
    }
    if (this.completedAppointments != null) {
      data['CompletedAppointments'] = this.completedAppointments!.toJson();
    }
    return data;
  }
}

class ActiveAppointments {
  String? date;
  String? name;
  String? time;

  ActiveAppointments({this.date, this.name, this.time});

  ActiveAppointments.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    name = json['Name'];
    time = json['Time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['Name'] = this.name;
    data['Time'] = this.time;
    return data;
  }
}

class GarageDetails {
  Location? location;
  String? garagename;
  String? officenumber;

  GarageDetails({this.location, this.garagename, this.officenumber});

  GarageDetails.fromJson(Map<String, dynamic> json) {
    location = json['Location'] != null
        ? new Location.fromJson(json['Location'])
        : null;
    garagename = json['garagename'];
    officenumber = json['officenumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['Location'] = this.location!.toJson();
    }
    data['garagename'] = this.garagename;
    data['officenumber'] = this.officenumber;
    return data;
  }
}

class Location {
  String? latitude;
  String? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['Latitude'];
    longitude = json['Longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    return data;
  }
}

class MechanicsDetails {
  String? employeeContactNumber;
  String? employeeSpecialty;
  String? employeeemail;
  String? employeename;
  Users? users;

  MechanicsDetails(
      {this.employeeContactNumber,
      this.employeeSpecialty,
      this.employeeemail,
      this.employeename,
      this.users});

  MechanicsDetails.fromJson(Map<String, dynamic> json) {
    employeeContactNumber = json['employeeContactNumber'];
    employeeSpecialty = json['employeeSpecialty'];
    employeeemail = json['employeeemail'];
    employeename = json['employeename'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeContactNumber'] = this.employeeContactNumber;
    data['employeeSpecialty'] = this.employeeSpecialty;
    data['employeeemail'] = this.employeeemail;
    data['employeename'] = this.employeename;
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    return data;
  }
}

class Users {
  String? employeeContactNumber;
  String? employeeSpecialty;
  String? employeeemail;
  String? employeename;

  Users(
      {this.employeeContactNumber,
      this.employeeSpecialty,
      this.employeeemail,
      this.employeename});

  Users.fromJson(Map<String, dynamic> json) {
    employeeContactNumber = json['employeeContactNumber'];
    employeeSpecialty = json['employeeSpecialty'];
    employeeemail = json['employeeemail'];
    employeename = json['employeename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeContactNumber'] = this.employeeContactNumber;
    data['employeeSpecialty'] = this.employeeSpecialty;
    data['employeeemail'] = this.employeeemail;
    data['employeename'] = this.employeename;
    return data;
  }
}

// class Users {
//   String? email;
//   String? name;
//   String? password;
//   String? phonenumber;

//   Users({this.email, this.name, this.password, this.phonenumber});

//   Users.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     name = json['name'];
//     password = json['password'];
//     phonenumber = json['phonenumber'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email'] = this.email;
//     data['name'] = this.name;
//     data['password'] = this.password;
//     data['phonenumber'] = this.phonenumber;
//     return data;
//   }
// }
