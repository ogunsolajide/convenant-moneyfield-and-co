import 'package:moneyfield/utitlity/iconsImages.dart';

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



}
