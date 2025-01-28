// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Cash Toggar`
  String get brandName {
    return Intl.message(
      'Cash Toggar',
      name: 'brandName',
      desc: '',
      args: [],
    );
  }

  /// `Select the service you need`
  String get onBoardingHeaderOne {
    return Intl.message(
      'Select the service you need',
      name: 'onBoardingHeaderOne',
      desc: '',
      args: [],
    );
  }

  /// `Secure Money Transfer`
  String get onBoardingHeaderTwo {
    return Intl.message(
      'Secure Money Transfer',
      name: 'onBoardingHeaderTwo',
      desc: '',
      args: [],
    );
  }

  /// `Speed and Ease of Transfer`
  String get onBoardingHeaderThree {
    return Intl.message(
      'Speed and Ease of Transfer',
      name: 'onBoardingHeaderThree',
      desc: '',
      args: [],
    );
  }

  /// `Cash merchants provide you with easy and secure withdrawals and transfers from your wallet to Instapay.`
  String get onBoardingBodyOne {
    return Intl.message(
      'Cash merchants provide you with easy and secure withdrawals and transfers from your wallet to Instapay.',
      name: 'onBoardingBodyOne',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy a seamless and secure experience for transferring money quickly with Cash Merchants.`
  String get onBoardingBodyTwo {
    return Intl.message(
      'Enjoy a seamless and secure experience for transferring money quickly with Cash Merchants.',
      name: 'onBoardingBodyTwo',
      desc: '',
      args: [],
    );
  }

  /// `Cash Merchants offers you a unique experience for transferring money quickly, easily, and securely.`
  String get onBoardingBodyThree {
    return Intl.message(
      'Cash Merchants offers you a unique experience for transferring money quickly, easily, and securely.',
      name: 'onBoardingBodyThree',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `back`
  String get previous {
    return Intl.message(
      'back',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get signIn {
    return Intl.message(
      'Login',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `enter your email address here ...`
  String get enterEmail {
    return Intl.message(
      'enter your email address here ...',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `enter your password here ...`
  String get enterPassword {
    return Intl.message(
      'enter your password here ...',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgotPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don’t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create new an account`
  String get createAccount {
    return Intl.message(
      'Create new an account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get signUp {
    return Intl.message(
      'Create an account',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `enter first name here ...`
  String get enterFirstName {
    return Intl.message(
      'enter first name here ...',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `enter last name here ...`
  String get enterLastName {
    return Intl.message(
      'enter last name here ...',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `enter phone number here ...`
  String get enterPhoneNumber {
    return Intl.message(
      'enter phone number here ...',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `agree to the terms & conditions of كاش تجار & the privacy policy.`
  String get agreeConditions {
    return Intl.message(
      'agree to the terms & conditions of كاش تجار & the privacy policy.',
      name: 'agreeConditions',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get craeteAccount {
    return Intl.message(
      'Create an account',
      name: 'craeteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already Have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already Have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get signInHere {
    return Intl.message(
      'Login',
      name: 'signInHere',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `profile`
  String get profile {
    return Intl.message(
      'profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get googMorning {
    return Intl.message(
      'Good Morning',
      name: 'googMorning',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening`
  String get goodAfternoon {
    return Intl.message(
      'Good Evening',
      name: 'goodAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get sendingMoney {
    return Intl.message(
      'Deposit',
      name: 'sendingMoney',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get receiveMoney {
    return Intl.message(
      'Withdraw',
      name: 'receiveMoney',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get myCurrentMoney {
    return Intl.message(
      'Balance',
      name: 'myCurrentMoney',
      desc: '',
      args: [],
    );
  }

  /// `Transaction history`
  String get transActionHistory {
    return Intl.message(
      'Transaction history',
      name: 'transActionHistory',
      desc: '',
      args: [],
    );
  }

  /// `show all`
  String get seeAll {
    return Intl.message(
      'show all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Account Deposits`
  String get sendingMoneyProcess {
    return Intl.message(
      'Account Deposits',
      name: 'sendingMoneyProcess',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw Funds`
  String get receiveMoneyProcess {
    return Intl.message(
      'Withdraw Funds',
      name: 'receiveMoneyProcess',
      desc: '',
      args: [],
    );
  }

  /// `Account Refill`
  String get refillMyAccount {
    return Intl.message(
      'Account Refill',
      name: 'refillMyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Select the payment method you wish to use to withdraw funds`
  String get chooseYourBestGatewayForeReceiveMoney {
    return Intl.message(
      'Select the payment method you wish to use to withdraw funds',
      name: 'chooseYourBestGatewayForeReceiveMoney',
      desc: '',
      args: [],
    );
  }

  /// `Select the payment method you wish to use to top up your account`
  String get chooseYourBestGatewayForeSendingMoney {
    return Intl.message(
      'Select the payment method you wish to use to top up your account',
      name: 'chooseYourBestGatewayForeSendingMoney',
      desc: '',
      args: [],
    );
  }

  /// `Recommended Methods`
  String get currentGateway {
    return Intl.message(
      'Recommended Methods',
      name: 'currentGateway',
      desc: '',
      args: [],
    );
  }

  /// `Before submitting the request, please transfer the funds within 10 minutes using the payment information provided below`
  String get alertMessageWhenCreateRequest {
    return Intl.message(
      'Before submitting the request, please transfer the funds within 10 minutes using the payment information provided below',
      name: 'alertMessageWhenCreateRequest',
      desc: '',
      args: [],
    );
  }

  /// `Money:`
  String get amount {
    return Intl.message(
      'Money:',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `The minimum is 15 LE - the maximum is 30,000 LE`
  String get moneyRange {
    return Intl.message(
      'The minimum is 15 LE - the maximum is 30,000 LE',
      name: 'moneyRange',
      desc: '',
      args: [],
    );
  }

  /// `phone number transferred made from`
  String get phoneNumberThatSendingMoney {
    return Intl.message(
      'phone number transferred made from',
      name: 'phoneNumberThatSendingMoney',
      desc: '',
      args: [],
    );
  }

  /// `phone number will receive to`
  String get phoneNumberThatReceivingMoney {
    return Intl.message(
      'phone number will receive to',
      name: 'phoneNumberThatReceivingMoney',
      desc: '',
      args: [],
    );
  }

  /// `Screenshot of a successful transfer`
  String get screenshotOfTransaction {
    return Intl.message(
      'Screenshot of a successful transfer',
      name: 'screenshotOfTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Upload screenshot here`
  String get uploadTheImage {
    return Intl.message(
      'Upload screenshot here',
      name: 'uploadTheImage',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Your request is under review`
  String get alertHeaderSendRequestDone {
    return Intl.message(
      'Your request is under review',
      name: 'alertHeaderSendRequestDone',
      desc: '',
      args: [],
    );
  }

  /// `The review process may take approximately 5 to 10 minutes`
  String get alertBodySendRequestDone {
    return Intl.message(
      'The review process may take approximately 5 to 10 minutes',
      name: 'alertBodySendRequestDone',
      desc: '',
      args: [],
    );
  }

  /// `Once the review is complete, we will notify you via SMS`
  String get alertBodySendRequestDone2 {
    return Intl.message(
      'Once the review is complete, we will notify you via SMS',
      name: 'alertBodySendRequestDone2',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home Page`
  String get backToHome {
    return Intl.message(
      'Back to Home Page',
      name: 'backToHome',
      desc: '',
      args: [],
    );
  }

  /// `Personal Informations`
  String get userInformation {
    return Intl.message(
      'Personal Informations',
      name: 'userInformation',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Language Setting`
  String get changeLanguage {
    return Intl.message(
      'Language Setting',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logOut {
    return Intl.message(
      'Logout',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Call Center`
  String get callUs {
    return Intl.message(
      'Call Center',
      name: 'callUs',
      desc: '',
      args: [],
    );
  }

  /// `Rate us on Google Play`
  String get rateUs {
    return Intl.message(
      'Rate us on Google Play',
      name: 'rateUs',
      desc: '',
      args: [],
    );
  }

  /// `day`
  String get day {
    return Intl.message(
      'day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Cash back`
  String get cashBack {
    return Intl.message(
      'Cash back',
      name: 'cashBack',
      desc: '',
      args: [],
    );
  }

  /// `Wallet Balance`
  String get walletBalance {
    return Intl.message(
      'Wallet Balance',
      name: 'walletBalance',
      desc: '',
      args: [],
    );
  }

  /// `Deposit successful`
  String get depositSuccessful {
    return Intl.message(
      'Deposit successful',
      name: 'depositSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal successful`
  String get withdrawalSuccessful {
    return Intl.message(
      'Withdrawal successful',
      name: 'withdrawalSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Deposit rejected`
  String get depositRejected {
    return Intl.message(
      'Deposit rejected',
      name: 'depositRejected',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal rejected`
  String get withdrawalRejected {
    return Intl.message(
      'Withdrawal rejected',
      name: 'withdrawalRejected',
      desc: '',
      args: [],
    );
  }

  /// `Transaction pending`
  String get transactionPending {
    return Intl.message(
      'Transaction pending',
      name: 'transactionPending',
      desc: '',
      args: [],
    );
  }

  /// `Complete Transaction`
  String get completeTransaction {
    return Intl.message(
      'Complete Transaction',
      name: 'completeTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Vodafone Cash Number`
  String get vodafoneCashNum {
    return Intl.message(
      'Vodafone Cash Number',
      name: 'vodafoneCashNum',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name`
  String get validatorFirstName {
    return Intl.message(
      'Please enter your first name',
      name: 'validatorFirstName',
      desc: '',
      args: [],
    );
  }

  /// `First name should contain only letters`
  String get validatorFirstNameWrong {
    return Intl.message(
      'First name should contain only letters',
      name: 'validatorFirstNameWrong',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get validatorLastName {
    return Intl.message(
      'Please enter your last name',
      name: 'validatorLastName',
      desc: '',
      args: [],
    );
  }

  /// `Last name should contain only letters`
  String get validatorLastNameWrong {
    return Intl.message(
      'Last name should contain only letters',
      name: 'validatorLastNameWrong',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get validatorEmail {
    return Intl.message(
      'Please enter your email',
      name: 'validatorEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get validatorEmailValid {
    return Intl.message(
      'Please enter a valid email',
      name: 'validatorEmailValid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get validatorPassword {
    return Intl.message(
      'Please enter your password',
      name: 'validatorPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get validatorPassword2 {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'validatorPassword2',
      desc: '',
      args: [],
    );
  }

  /// `Password must include at least one uppercase letter, one lowercase letter, one digit, and one special character`
  String get validatorPassword3 {
    return Intl.message(
      'Password must include at least one uppercase letter, one lowercase letter, one digit, and one special character',
      name: 'validatorPassword3',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get validatorPhoneNumber {
    return Intl.message(
      'Please enter your phone number',
      name: 'validatorPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Sign in successful!`
  String get signInSuccess {
    return Intl.message(
      'Sign in successful!',
      name: 'signInSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Sign up successful!`
  String get signUpSuccess {
    return Intl.message(
      'Sign up successful!',
      name: 'signUpSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Error in sign in!`
  String get signInError {
    return Intl.message(
      'Error in sign in!',
      name: 'signInError',
      desc: '',
      args: [],
    );
  }

  /// `Error in sign up!`
  String get signUpError {
    return Intl.message(
      'Error in sign up!',
      name: 'signUpError',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw funds via `
  String get withdrawFundsVia {
    return Intl.message(
      'Withdraw funds via ',
      name: 'withdrawFundsVia',
      desc: '',
      args: [],
    );
  }

  /// `my points`
  String get my_points {
    return Intl.message(
      'my points',
      name: 'my_points',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your amount`
  String get validatorAmountEmpty {
    return Intl.message(
      'Please enter your amount',
      name: 'validatorAmountEmpty',
      desc: '',
      args: [],
    );
  }

  /// `your cash not enough`
  String get validatorAmountNotEnough {
    return Intl.message(
      'your cash not enough',
      name: 'validatorAmountNotEnough',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone`
  String get validatorPhoneEmpty {
    return Intl.message(
      'Please enter your phone',
      name: 'validatorPhoneEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your instapay account`
  String get validatorAccountInstapayEmpty {
    return Intl.message(
      'Please enter your instapay account',
      name: 'validatorAccountInstapayEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please pick an image first`
  String get imageValidator {
    return Intl.message(
      'Please pick an image first',
      name: 'imageValidator',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset Send Successfully`
  String get passwordReset {
    return Intl.message(
      'Password Reset Send Successfully',
      name: 'passwordReset',
      desc: '',
      args: [],
    );
  }

  /// `failed at this time pleas try again later`
  String get failedMessage {
    return Intl.message(
      'failed at this time pleas try again later',
      name: 'failedMessage',
      desc: '',
      args: [],
    );
  }

  /// `copied successfully`
  String get copySuccess {
    return Intl.message(
      'copied successfully',
      name: 'copySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Insta@username`
  String get instapayAddress {
    return Intl.message(
      'Insta@username',
      name: 'instapayAddress',
      desc: '',
      args: [],
    );
  }

  /// `@instapayuser`
  String get instapayAddressUser {
    return Intl.message(
      '@instapayuser',
      name: 'instapayAddressUser',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
