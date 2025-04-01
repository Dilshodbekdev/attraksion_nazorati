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

  /// `Ombudsman`
  String get app_name {
    return Intl.message(
      'Ombudsman',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Choose language`
  String get select_language {
    return Intl.message(
      'Choose language',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `The Authorized person\nfor human rights`
  String get inson_huquqlari_buyicha_vakili {
    return Intl.message(
      'The Authorized person\nfor human rights',
      name: 'inson_huquqlari_buyicha_vakili',
      desc: '',
      args: [],
    );
  }

  /// `Appeal`
  String get appeal {
    return Intl.message(
      'Appeal',
      name: 'appeal',
      desc: '',
      args: [],
    );
  }

  /// `Appeals`
  String get appeals {
    return Intl.message(
      'Appeals',
      name: 'appeals',
      desc: '',
      args: [],
    );
  }

  /// `Online\nconsultation`
  String get online_chat {
    return Intl.message(
      'Online\nconsultation',
      name: 'online_chat',
      desc: '',
      args: [],
    );
  }

  /// `Send us tormenting you questions and problems`
  String get sizni_qiynayotgan {
    return Intl.message(
      'Send us tormenting you questions and problems',
      name: 'sizni_qiynayotgan',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message(
      'FAQ',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `details`
  String get detail {
    return Intl.message(
      'details',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `About\nOmbudsman`
  String get about_ombudsman {
    return Intl.message(
      'About\nOmbudsman',
      name: 'about_ombudsman',
      desc: '',
      args: [],
    );
  }

  /// `Qo‘mita`
  String get about {
    return Intl.message(
      'Qo‘mita',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `All news`
  String get all_news {
    return Intl.message(
      'All news',
      name: 'all_news',
      desc: '',
      args: [],
    );
  }

  /// `Questionnaire`
  String get questionnaire {
    return Intl.message(
      'Questionnaire',
      name: 'questionnaire',
      desc: '',
      args: [],
    );
  }

  /// `Vote`
  String get voting {
    return Intl.message(
      'Vote',
      name: 'voting',
      desc: '',
      args: [],
    );
  }

  /// `You voted`
  String get voted {
    return Intl.message(
      'You voted',
      name: 'voted',
      desc: '',
      args: [],
    );
  }

  /// `Statistic`
  String get statistic {
    return Intl.message(
      'Statistic',
      name: 'statistic',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get general {
    return Intl.message(
      'general',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Incoming appeals`
  String get new_appeals {
    return Intl.message(
      'Incoming appeals',
      name: 'new_appeals',
      desc: '',
      args: [],
    );
  }

  /// `Appeals in process`
  String get process_appeals {
    return Intl.message(
      'Appeals in process',
      name: 'process_appeals',
      desc: '',
      args: [],
    );
  }

  /// `Completed appeals`
  String get complete_appeals {
    return Intl.message(
      'Completed appeals',
      name: 'complete_appeals',
      desc: '',
      args: [],
    );
  }

  /// `Get detailed information about Ombudsman`
  String get about_ombudsman_details {
    return Intl.message(
      'Get detailed information about Ombudsman',
      name: 'about_ombudsman_details',
      desc: '',
      args: [],
    );
  }

  /// `Administration`
  String get leadership {
    return Intl.message(
      'Administration',
      name: 'leadership',
      desc: '',
      args: [],
    );
  }

  /// `Detailed information about members of administration`
  String get about_leadership {
    return Intl.message(
      'Detailed information about members of administration',
      name: 'about_leadership',
      desc: '',
      args: [],
    );
  }

  /// `Central office`
  String get central_membership {
    return Intl.message(
      'Central office',
      name: 'central_membership',
      desc: '',
      args: [],
    );
  }

  /// `Detailed information about members of Central office`
  String get about_central_membership {
    return Intl.message(
      'Detailed information about members of Central office',
      name: 'about_central_membership',
      desc: '',
      args: [],
    );
  }

  /// `Regional representatives`
  String get regional_membership {
    return Intl.message(
      'Regional representatives',
      name: 'regional_membership',
      desc: '',
      args: [],
    );
  }

  /// `Detailed information about Regional representatives`
  String get about_regional_membership {
    return Intl.message(
      'Detailed information about Regional representatives',
      name: 'about_regional_membership',
      desc: '',
      args: [],
    );
  }

  /// `Members of Commission`
  String get commission_members {
    return Intl.message(
      'Members of Commission',
      name: 'commission_members',
      desc: '',
      args: [],
    );
  }

  /// `Detailed information about members of Commission`
  String get about_commission_members {
    return Intl.message(
      'Detailed information about members of Commission',
      name: 'about_commission_members',
      desc: '',
      args: [],
    );
  }

  /// `Phone:`
  String get phone {
    return Intl.message(
      'Phone:',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Reception:`
  String get reception_days {
    return Intl.message(
      'Reception:',
      name: 'reception_days',
      desc: '',
      args: [],
    );
  }

  /// `Biography`
  String get biography {
    return Intl.message(
      'Biography',
      name: 'biography',
      desc: '',
      args: [],
    );
  }

  /// `Functions`
  String get functions {
    return Intl.message(
      'Functions',
      name: 'functions',
      desc: '',
      args: [],
    );
  }

  /// `Send appeal`
  String get create_appeal {
    return Intl.message(
      'Send appeal',
      name: 'create_appeal',
      desc: '',
      args: [],
    );
  }

  /// `send appeal`
  String get create_appeal1 {
    return Intl.message(
      'send appeal',
      name: 'create_appeal1',
      desc: '',
      args: [],
    );
  }

  /// `Enter address`
  String get enter_address {
    return Intl.message(
      'Enter address',
      name: 'enter_address',
      desc: '',
      args: [],
    );
  }

  /// `Region`
  String get regions {
    return Intl.message(
      'Region',
      name: 'regions',
      desc: '',
      args: [],
    );
  }

  /// `District`
  String get district {
    return Intl.message(
      'District',
      name: 'district',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Type of appeal`
  String get appeal_type {
    return Intl.message(
      'Type of appeal',
      name: 'appeal_type',
      desc: '',
      args: [],
    );
  }

  /// `Text of appeal...`
  String get appeal_text {
    return Intl.message(
      'Text of appeal...',
      name: 'appeal_text',
      desc: '',
      args: [],
    );
  }

  /// `Attachment file`
  String get attachment {
    return Intl.message(
      'Attachment file',
      name: 'attachment',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get sending {
    return Intl.message(
      'Send',
      name: 'sending',
      desc: '',
      args: [],
    );
  }

  /// `Your request was successfully sent!`
  String get successfully_send {
    return Intl.message(
      'Your request was successfully sent!',
      name: 'successfully_send',
      desc: '',
      args: [],
    );
  }

  /// `New appeal`
  String get new_appeal {
    return Intl.message(
      'New appeal',
      name: 'new_appeal',
      desc: '',
      args: [],
    );
  }

  /// `Appeal`
  String get all {
    return Intl.message(
      'Appeal',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `On progress`
  String get process {
    return Intl.message(
      'On progress',
      name: 'process',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get complete {
    return Intl.message(
      'Completed',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `My appeals`
  String get my_appeals {
    return Intl.message(
      'My appeals',
      name: 'my_appeals',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get info {
    return Intl.message(
      'Information',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Answer`
  String get answer {
    return Intl.message(
      'Answer',
      name: 'answer',
      desc: '',
      args: [],
    );
  }

  /// `Attached files`
  String get attachment_files {
    return Intl.message(
      'Attached files',
      name: 'attachment_files',
      desc: '',
      args: [],
    );
  }

  /// `Status of appeal`
  String get status_appeal {
    return Intl.message(
      'Status of appeal',
      name: 'status_appeal',
      desc: '',
      args: [],
    );
  }

  /// `Appeal created date `
  String get create_appeal_date {
    return Intl.message(
      'Appeal created date ',
      name: 'create_appeal_date',
      desc: '',
      args: [],
    );
  }

  /// `Appeal sent date for process`
  String get process_appeal_date {
    return Intl.message(
      'Appeal sent date for process',
      name: 'process_appeal_date',
      desc: '',
      args: [],
    );
  }

  /// `Regional inspection responsible for appeal execution`
  String get inspector1 {
    return Intl.message(
      'Regional inspection responsible for appeal execution',
      name: 'inspector1',
      desc: '',
      args: [],
    );
  }

  /// `Regional inspection responsible for execution of Executors`
  String get inspector2 {
    return Intl.message(
      'Regional inspection responsible for execution of Executors',
      name: 'inspector2',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Personal_data`
  String get personal_data {
    return Intl.message(
      'Personal_data',
      name: 'personal_data',
      desc: '',
      args: [],
    );
  }

  /// `User manual`
  String get user_manual {
    return Intl.message(
      'User manual',
      name: 'user_manual',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `About application`
  String get about_app {
    return Intl.message(
      'About application',
      name: 'about_app',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get exit {
    return Intl.message(
      'Logout',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Application language`
  String get app_language {
    return Intl.message(
      'Application language',
      name: 'app_language',
      desc: '',
      args: [],
    );
  }

  /// `Application theme`
  String get app_theme {
    return Intl.message(
      'Application theme',
      name: 'app_theme',
      desc: '',
      args: [],
    );
  }

  /// `Support phone`
  String get by_phone {
    return Intl.message(
      'Support phone',
      name: 'by_phone',
      desc: '',
      args: [],
    );
  }

  /// `Contact by telegram`
  String get by_telegram {
    return Intl.message(
      'Contact by telegram',
      name: 'by_telegram',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get slider_title_1 {
    return Intl.message(
      'Register',
      name: 'slider_title_1',
      desc: '',
      args: [],
    );
  }

  /// `To use the mobile application, register through ID.gov.uz system`
  String get slider_desc_1 {
    return Intl.message(
      'To use the mobile application, register through ID.gov.uz system',
      name: 'slider_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `Inform about human rights issue`
  String get slider_title_2 {
    return Intl.message(
      'Inform about human rights issue',
      name: 'slider_title_2',
      desc: '',
      args: [],
    );
  }

  /// `Inform about existing human rights issues`
  String get slider_desc_2 {
    return Intl.message(
      'Inform about existing human rights issues',
      name: 'slider_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Wait for the result of solving the problem`
  String get slider_title_3 {
    return Intl.message(
      'Wait for the result of solving the problem',
      name: 'slider_title_3',
      desc: '',
      args: [],
    );
  }

  /// `Wait for the result of solving your problem in human rights area`
  String get slider_desc_3 {
    return Intl.message(
      'Wait for the result of solving your problem in human rights area',
      name: 'slider_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `Check out the result`
  String get slider_title_4 {
    return Intl.message(
      'Check out the result',
      name: 'slider_title_4',
      desc: '',
      args: [],
    );
  }

  /// `Check out the result of solving your problem`
  String get slider_desc_4 {
    return Intl.message(
      'Check out the result of solving your problem',
      name: 'slider_desc_4',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get next {
    return Intl.message(
      'Continue',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Main`
  String get main {
    return Intl.message(
      'Main',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get chats {
    return Intl.message(
      'Chats',
      name: 'chats',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Authorized person of  the Oliy Majlis of the Republic of Uzbekistan for human rights`
  String get app_title {
    return Intl.message(
      'Authorized person of  the Oliy Majlis of the Republic of Uzbekistan for human rights',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Istirohat bog‘lari attraksionlaridan foydalanish qoidalarini buzish bilan bog‘liq huquqbuzarliklar haqida xabar berish`
  String get app_desc {
    return Intl.message(
      'Istirohat bog‘lari attraksionlaridan foydalanish qoidalarini buzish bilan bog‘liq huquqbuzarliklar haqida xabar berish',
      name: 'app_desc',
      desc: '',
      args: [],
    );
  }

  /// `Dear user, your application has been sent successfully.`
  String get appeal_sended {
    return Intl.message(
      'Dear user, your application has been sent successfully.',
      name: 'appeal_sended',
      desc: '',
      args: [],
    );
  }

  /// `Mobile application OMBUDSMAN.UZ of the Authorized Person of the Oliy Majlis of the Republic of Uzbekistan for Human Rights (Ombudsman) is developed in accordance with the Law of the Republic of Uzbekistan "On Applications of Individuals and Legal Entities" LLC "Center for Development of Information Technologies and Information Resources".`
  String get about_app_text1 {
    return Intl.message(
      'Mobile application OMBUDSMAN.UZ of the Authorized Person of the Oliy Majlis of the Republic of Uzbekistan for Human Rights (Ombudsman) is developed in accordance with the Law of the Republic of Uzbekistan "On Applications of Individuals and Legal Entities" LLC "Center for Development of Information Technologies and Information Resources".',
      name: 'about_app_text1',
      desc: '',
      args: [],
    );
  }

  /// `To create additional opportunities for applicants, in particular the introduction of such services as providing online advice to citizens, monitoring the state of execution of appeals online, familiarization through a mobile application with response letters of relevant organizations on the execution of appeals, with statistical data.`
  String get about_app_text2 {
    return Intl.message(
      'To create additional opportunities for applicants, in particular the introduction of such services as providing online advice to citizens, monitoring the state of execution of appeals online, familiarization through a mobile application with response letters of relevant organizations on the execution of appeals, with statistical data.',
      name: 'about_app_text2',
      desc: '',
      args: [],
    );
  }

  /// `- Quickly generate and send short appeals;\n- Tracking the status of consideration of appeals and familiarizing with the results of consideration;\n- Familiarization with the statistics of sent appeals;\n- Familiarization with news about the Ombudsman's activities;\n- Providing assistance in obtaining online consultations;\n- Providing information about the Ombudsman, its territorial representatives and the Central Office;\n- Obtaining information on reception days.`
  String get about_app_text3 {
    return Intl.message(
      '- Quickly generate and send short appeals;\n- Tracking the status of consideration of appeals and familiarizing with the results of consideration;\n- Familiarization with the statistics of sent appeals;\n- Familiarization with news about the Ombudsman\'s activities;\n- Providing assistance in obtaining online consultations;\n- Providing information about the Ombudsman, its territorial representatives and the Central Office;\n- Obtaining information on reception days.',
      name: 'about_app_text3',
      desc: '',
      args: [],
    );
  }

  /// `- Sending appeals in 24/7 mode at any time and at any distance;\n- Familiarization with the results of consideration of appeals in online mode;\n- Using OneID - a unified identification system for registration;\n- Quick and convenient access to the mobile application for registered users;\n- Downloading and receiving necessary files and information;\n- Use of Uzbek or Russian language at user's choice;\n- Simple and user-friendly menu;\n- Use of modern methods and principles of ensuring information security of the application and personal data of users.`
  String get about_app_text4 {
    return Intl.message(
      '- Sending appeals in 24/7 mode at any time and at any distance;\n- Familiarization with the results of consideration of appeals in online mode;\n- Using OneID - a unified identification system for registration;\n- Quick and convenient access to the mobile application for registered users;\n- Downloading and receiving necessary files and information;\n- Use of Uzbek or Russian language at user\'s choice;\n- Simple and user-friendly menu;\n- Use of modern methods and principles of ensuring information security of the application and personal data of users.',
      name: 'about_app_text4',
      desc: '',
      args: [],
    );
  }

  /// `The purpose of the mobile application OMBUDSMAN.UZ`
  String get about_target {
    return Intl.message(
      'The purpose of the mobile application OMBUDSMAN.UZ',
      name: 'about_target',
      desc: '',
      args: [],
    );
  }

  /// `Tasks of the mobile application OMBUDSMAN.UZ`
  String get about_task {
    return Intl.message(
      'Tasks of the mobile application OMBUDSMAN.UZ',
      name: 'about_task',
      desc: '',
      args: [],
    );
  }

  /// `Benefits of OMBUDSMAN.UZ mobile application`
  String get about_priority {
    return Intl.message(
      'Benefits of OMBUDSMAN.UZ mobile application',
      name: 'about_priority',
      desc: '',
      args: [],
    );
  }

  /// `Citizenship`
  String get citizenship {
    return Intl.message(
      'Citizenship',
      name: 'citizenship',
      desc: '',
      args: [],
    );
  }

  /// `Select citizenship`
  String get citizenship_select {
    return Intl.message(
      'Select citizenship',
      name: 'citizenship_select',
      desc: '',
      args: [],
    );
  }

  /// `Additional information`
  String get add_info {
    return Intl.message(
      'Additional information',
      name: 'add_info',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Marital Status`
  String get marital_status {
    return Intl.message(
      'Marital Status',
      name: 'marital_status',
      desc: '',
      args: [],
    );
  }

  /// `Entrepreneur`
  String get juridic {
    return Intl.message(
      'Entrepreneur',
      name: 'juridic',
      desc: '',
      args: [],
    );
  }

  /// `Juridical name`
  String get juridical_name {
    return Intl.message(
      'Juridical name',
      name: 'juridical_name',
      desc: '',
      args: [],
    );
  }

  /// `If you are really applying as a business entity, please check this box`
  String get juridical_text {
    return Intl.message(
      'If you are really applying as a business entity, please check this box',
      name: 'juridical_text',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get famale {
    return Intl.message(
      'Female',
      name: 'famale',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get new1 {
    return Intl.message(
      'New',
      name: 'new1',
      desc: '',
      args: [],
    );
  }

  /// `Registered`
  String get registered {
    return Intl.message(
      'Registered',
      name: 'registered',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Answered`
  String get answered {
    return Intl.message(
      'Answered',
      name: 'answered',
      desc: '',
      args: [],
    );
  }

  /// `BASIC PRINCIPLES OF THE REPRESENTATIVE'S ACTIVITY:`
  String get about_text_1 {
    return Intl.message(
      'BASIC PRINCIPLES OF THE REPRESENTATIVE\'S ACTIVITY:',
      name: 'about_text_1',
      desc: '',
      args: [],
    );
  }

  /// `The rights of the representative in the consideration of complaints:`
  String get about_text_2 {
    return Intl.message(
      'The rights of the representative in the consideration of complaints:',
      name: 'about_text_2',
      desc: '',
      args: [],
    );
  }

  /// `International cooperation`
  String get about_text_3 {
    return Intl.message(
      'International cooperation',
      name: 'about_text_3',
      desc: '',
      args: [],
    );
  }

  /// `The Ombudsman Institute has a "B" status in the international arena`
  String get about_text_4 {
    return Intl.message(
      'The Ombudsman Institute has a "B" status in the international arena',
      name: 'about_text_4',
      desc: '',
      args: [],
    );
  }

  /// `File loading...`
  String get file_loading {
    return Intl.message(
      'File loading...',
      name: 'file_loading',
      desc: '',
      args: [],
    );
  }

  /// `An official response based on the results of consideration of your appeal is attached to the file`
  String get answer_text {
    return Intl.message(
      'An official response based on the results of consideration of your appeal is attached to the file',
      name: 'answer_text',
      desc: '',
      args: [],
    );
  }

  /// `Appeal code`
  String get appeal_code {
    return Intl.message(
      'Appeal code',
      name: 'appeal_code',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exit the application?`
  String get exit_text {
    return Intl.message(
      'Are you sure you want to exit the application?',
      name: 'exit_text',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Our social networks`
  String get social_medias {
    return Intl.message(
      'Our social networks',
      name: 'social_medias',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Agreed`
  String get met {
    return Intl.message(
      'Agreed',
      name: 'met',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Murojaatlarga qo‘yiladigan talablar`
  String get requirements {
    return Intl.message(
      'Murojaatlarga qo‘yiladigan talablar',
      name: 'requirements',
      desc: '',
      args: [],
    );
  }

  /// `ATTENTION! All fields are required.`
  String get required {
    return Intl.message(
      'ATTENTION! All fields are required.',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Note. The Ombudsman does not consider issues within court competence.`
  String get required1 {
    return Intl.message(
      'Note. The Ombudsman does not consider issues within court competence.',
      name: 'required1',
      desc: '',
      args: [],
    );
  }

  /// `(pdf, doc, xls, jped, png)\nMaximum file size to upload-5Mb`
  String get file_required {
    return Intl.message(
      '(pdf, doc, xls, jped, png)\nMaximum file size to upload-5Mb',
      name: 'file_required',
      desc: '',
      args: [],
    );
  }

  /// `100027, Tashkent city, Shaykhantakhur district, ave. Islam Karimov, 16A`
  String get address1 {
    return Intl.message(
      '100027, Tashkent city, Shaykhantakhur district, ave. Islam Karimov, 16A',
      name: 'address1',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get full_name {
    return Intl.message(
      'Full name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get birth_date {
    return Intl.message(
      'Date of birth',
      name: 'birth_date',
      desc: '',
      args: [],
    );
  }

  /// `Online reception\ndesk`
  String get network_library {
    return Intl.message(
      'Online reception\ndesk',
      name: 'network_library',
      desc: '',
      args: [],
    );
  }

  /// `In accordance with the Decree of the Cabinet of Ministers of the Republic of Uzbekistan “On measures to further improvement of the system of legal assistance and representing legal information to the population” from September 6, 2019 No. 741, the Ministry of Justice of the Republic of Uzbekistan registered the non-governmental non-profit organization (NGO) “Madad” from September 12, 2019.\n\nOne of the main functions of NGO is to provide citizens free legal assistance by representing them online consultations and explanations on legal issues.\n\nYou may get free legal advice through this link.\n\nPlease follow the link and click on the button “Huquqiy yordam kerakmi?” on the right side of the screen.`
  String get chat_text {
    return Intl.message(
      'In accordance with the Decree of the Cabinet of Ministers of the Republic of Uzbekistan “On measures to further improvement of the system of legal assistance and representing legal information to the population” from September 6, 2019 No. 741, the Ministry of Justice of the Republic of Uzbekistan registered the non-governmental non-profit organization (NGO) “Madad” from September 12, 2019.\n\nOne of the main functions of NGO is to provide citizens free legal assistance by representing them online consultations and explanations on legal issues.\n\nYou may get free legal advice through this link.\n\nPlease follow the link and click on the button “Huquqiy yordam kerakmi?” on the right side of the screen.',
      name: 'chat_text',
      desc: '',
      args: [],
    );
  }

  /// `Information not found`
  String get data_no {
    return Intl.message(
      'Information not found',
      name: 'data_no',
      desc: '',
      args: [],
    );
  }

  /// `Istirohat bog‘i`
  String get istirohatBogi {
    return Intl.message(
      'Istirohat bog‘i',
      name: 'istirohatBogi',
      desc: '',
      args: [],
    );
  }

  /// `Attraksion nomi`
  String get attraksionNomi {
    return Intl.message(
      'Attraksion nomi',
      name: 'attraksionNomi',
      desc: '',
      args: [],
    );
  }

  /// `Attraksiondagi qonunbuzilish turi`
  String get attraksiondagiQonunbuzilishTuri {
    return Intl.message(
      'Attraksiondagi qonunbuzilish turi',
      name: 'attraksiondagiQonunbuzilishTuri',
      desc: '',
      args: [],
    );
  }

  /// `Qonunbuzilish turi`
  String get qonunbuzilishTuri {
    return Intl.message(
      'Qonunbuzilish turi',
      name: 'qonunbuzilishTuri',
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
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uk'),
      Locale.fromSubtags(languageCode: 'uz'),
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
