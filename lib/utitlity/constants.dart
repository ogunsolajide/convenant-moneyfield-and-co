import 'package:moneyfield/utitlity/iconsImages.dart';

import '../mainScreens/home/homeScreen.dart';

class WelcomeContent {
  String image;
  String title;
  String discription;

  WelcomeContent(
      {required this.image,
        required this.title,
        required this.discription});
}

List<WelcomeContent> contents = [
  WelcomeContent(
      image: AppImages.welcome1,
      title: 'Happy customers with reliable transfers',
      discription: 'Join us to explore a world of convenient and secure banking services. Let\'s get started on your financial journey.'),
  WelcomeContent(
      image: AppImages.welcome2,
      title: 'Save while you spend your money',
      discription: 'Join us to explore a world of convenient and secure banking services. Let\'s get started on your financial journey.'),
  WelcomeContent(
      image: AppImages.welcome3,
      title: 'Pay all your bills All in one place',
      discription: 'Join us to explore a world of convenient and secure banking services. Let\'s get started on your financial journey.'),
];

class CustomRegexp{
  static RegExp emailExp =
  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', caseSensitive: false);
  static RegExp passwordExp =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  static RegExp nameRegExp = RegExp(r'^[a-zA-ZÀ-ÿ-]+(?:\s[a-zA-ZÀ-ÿ-]+)*$');
  static RegExp phoneNumberExp = RegExp(r'^\+?\d{10}$');
  static RegExp anything =  RegExp(r'^.{3,}$', caseSensitive: false);
  static RegExp bvn =  RegExp(r'^\+?\d{11}$', caseSensitive: false);



}

List<UserAccount> demoAccounts = [
  UserAccount(
    accountnumber: '1234567890',
    productName: 'Savings Account',
    balance: 5000.00,
  ),
  UserAccount(
    accountnumber: '0987654321',
    productName: 'Checking Account',
    balance: 3000.00,
  ),
  UserAccount(
    accountnumber: '246813579w',
    productName: 'Investment Account',
    balance: 10000.00,
  ),
  UserAccount(
    accountnumber: '24681357993',
    productName: 'Investment Account',
    balance: 10000.00,
  ),
  UserAccount(
    accountnumber: '24681357283',
    productName: 'Investment Account',
    balance: 10000.00,
  ),
];

class UserAccount {
  String? accountnumber;
  String? productName;
  double? balance;

  UserAccount({
    this.accountnumber,
    this.productName,
    this.balance,
  });

  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
    accountnumber: json["accountnumber"],
    productName: json["productName"],
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "accountnumber": accountnumber,
    "productName": productName,
    "balance": balance,
  };
}

class TransactionHistoryEntry {
  final String title;
  final String date;
  final String amount;
  final bool isDebit;

  TransactionHistoryEntry({
    required this.title,
    required this.date,
    required this.amount,
    required this.isDebit,
  });
}
List<TransactionHistoryEntry> demoTransactionHistory = [
  TransactionHistoryEntry(
    title: 'Grocery shopping',
    date: 'May 15, 2024',
    amount: '50.00',
    isDebit: true,
  ),
  TransactionHistoryEntry(
    title: 'Salary deposit',
    date: 'May 14, 2024',
    amount: '2000.00',
    isDebit: false,
  ),
  TransactionHistoryEntry(
    title: 'Utility bill payment',
    date: 'May 12, 2024',
    amount: '100.00',
    isDebit: true,
  ),
  TransactionHistoryEntry(
    title: 'Online purchase',
    date: 'May 10, 2024',
    amount: '80.00',
    isDebit: true,
  ),
];
