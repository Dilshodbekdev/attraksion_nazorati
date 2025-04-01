enum AppRoutes {
  splash('splash', '/splash'),
  slider('slider', '/slider/:args'),
  language('language', '/language'),
  oneId('one_id', '/one-id'),
  main('main', '/main'),
  faq('faq', '/faq'),
  news('news', '/news'),
  chat('chat', '/chat'),
  info('info', '/info'),
  notification('notification', '/notification'),
  aboutOmbudsman('about_ombudsman', '/about-ombudsman'),
  aboutApp('about_app', '/about-app'),
  leadership('leadership', '/leadership'),
  centralMembership('central_membership', '/central-membership'),
  regionalMembership('regional_membership', '/regional-membership'),
  biography('biography', '/biography/:text'),
  functions('functions', '/functions/:text'),
  createAppeal('create_appeal', '/create-appeal'),
  requirements('requirements', '/requirements'),
  infoAppeal('info_appeal', '/info-appeal/:arg');

  final String name;
  final String path;
  const AppRoutes(this.name, this.path);
}