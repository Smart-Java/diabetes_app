abstract class AuthenticationPageRepoInterface {
  Future loginAuthenticationRepoRequest({required Map<String, dynamic> loginRequestJson}) async{}
  Future registerAuthenticationRepoRequest({required Map<String, dynamic> registerRequestJson}) async{}
  Future resendVerificationEmailAuthenticationRepoRequest({required Map<String, dynamic> verificationEmailRequestJson}) async{}
  Future sendTokenToEmailForForgotPasswordAuthenticationRepoRequest({required Map<String, dynamic> forgotPasswordTokenRequestJson}) async{}
  Future forgotPasswordAuthenticationRepoRequest({required Map<String, dynamic> forgotPasswordRequestJson}) async{}
  Future getUserCatgoriesForAuthenticationRepoRequest() async{}
  Future logoutUserOrDriverAuthenticationRepoRequest() async{}
}
