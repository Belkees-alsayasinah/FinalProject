class ServerConfig {
  //static const domainNameServer = 'https://grad2222.000webhostapp.com/';
  static const domainNameServer = 'https://noor-demo-store.webmyidea.com/';


  String loginApi = 'api/user/login';
  String loginApiInv = 'api/investor/login';
  String registerApi = 'api/investor/register';
  String registerUserApi = 'api/user/register';
  String verifyOtpInvApi = 'api/verify_otpInv';
  String verifyOtpWorApi = 'api/verify_otp';
  String getSectorApi = 'api/Type';
  String getInterestsProjects = 'api/investor/projects/investor-interests';
  String getArticlesApi = "api/Article";
  String getSectorProjectApi = "api/Type/showProjectsByType/";
  String getInterest = "api/Interest";
  String addInterestInv = "api/investor/interests";
  String addProject = 'api/user/projects';
  String showProfileUser = 'api/user/users/show';
  String showProfileInvestor = 'api/investor/investors/show';
  String showProfileAnother = 'api/users/';
  String getProjectByInvInterests = "api/investor/projects/investor-interests";
  String addReport = 'api/user/reports';
  String addCanvas = 'api/user/canvas/store/';
  String communicationRequest = 'api/investor/communications/';
  String getMyReports = 'api/reports/';
  String getMyComplaints = 'api/investor/complaints/getInvestorComplaints/';
  String getMyTransaction = 'api/user/Transaction/';
  String searchAmount = 'api/projects/Amount/';
  String searchName = 'api/projects/Name/';
  String addEvaluation = '/Evaluation';
  String getEvaluationCount = '/Evaluation/all';
  String getTransaction = 'api/Transaction';
  String requestTransaction = 'api/user/Transaction/';
  String addComplaint = 'api/investor/complaints';
  String getNotification = 'api/notification/getUserNotifications';
  String userLogout = 'api/user/logout';
  String investorLogout = 'api/investor/logout';
  String chartInfo = 'api/Report-statistics';
  String canvas = 'api/canvas/show/';
  String investorUpdateProfile = 'api/investor/investors/update/';
  String userUpdateProfile = 'api/user/users/update/';
  String addReportApi = "";
}
