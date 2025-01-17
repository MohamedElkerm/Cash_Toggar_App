class AppEndpoints {
  // Post Methods

  static const String baseUrl = "https://salesforceapi-lepv.onrender.com/api/";
  // static const String baseUrl = "http://102.223.94.154/api/";
  static const String imageBaseUrlForNews = "${baseUrl}news/";
  static const String imageBaseUrlForMedia = "${baseUrl}media/";
  static const String excelBaseUrlForDownloadXLSX = "${baseUrl}files/";

  static const String signIn = "${baseUrl}user/signin";
  static const String sendComplaint = "${baseUrl}complaint/";
  static const String getAllComplaintsAndCases = "${baseUrl}complaint/";
  static const String sendTechIssue = "${baseUrl}techTicket";
  static const String getAllTechCasesPending = "${baseUrl}techTicket";


  static const String acceptTheTicket = "${baseUrl}techTicket/accept/";

  static const String getAssignedTicketsByTechEmp = "${baseUrl}techTicket/accept/";
  static const String getMyTickets = "${baseUrl}techTicket/accept/";

  static const String makeTheCaseDone = "${baseUrl}techTicket/done/";

  static const String getInAndOut = "${baseUrl}user/logs";

  static const String getHealthyInsuranceDate = "${baseUrl}insurance";

  static const String sendNotification = "${baseUrl}studentNotification";



  static const String getNewsOfTheStudents = "https://eelu.edu.eg:4002/api/news";





}
