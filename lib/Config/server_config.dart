class ServerConfig {
  static const domainNameServer = 'https://grad2222.000webhostapp.com/';
  String loginApi = 'api/user/login';
  String loginApiInv = 'api/investor/login';
  String registerApi = 'api/investor/register';
  String registerUserApi = 'api/user/register';
  String verifyOtpInvApi = 'api/verify_otpInv';
  String verifyOtpWorApi = 'api/verify_otp';
  String getSectorApi = 'api/Type';
  String getArticlesApi = "api/Article";
  String getSectorProjectApi = "api/Type/showProjectsByType/";
  String getInterest = "api/Interest";
  String addInterestInv = "api/investor/interests";
  String addProject = 'api/user/projects';
  String showProfileUser = 'api/user/users/show';
  String getProjectByInvInterests = "api/investor/projects/investor-interests";
  String addReport = 'api/user/reports';
  String communicationRequest = 'api/investor/communications/';
  String getMyReports = 'api/user/reports/';
  String searchAmount = 'api/projects/Amount/';
  String searchName = 'api/projects/Name/';
  String addEvaluation = '/Evaluation';
  String getEvaluationCount = '/Evaluation/all';
  String getTransaction = 'api/Transaction';
  String requestTransaction = 'api/user/Transaction/';
  String addReportApi = "";
}
