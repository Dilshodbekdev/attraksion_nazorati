import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:atraksion_nazorati/src/core/router/app_routes.dart';
import 'package:atraksion_nazorati/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OneIdPage extends StatefulWidget {
  const OneIdPage({super.key});

  @override
  State<OneIdPage> createState() => _OneIdPageState();
}

class _OneIdPageState extends State<OneIdPage> {
  late final bloc = context.read<AuthBloc>();

  late final WebViewController _webViewController;

  @override
  void initState() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {

          },
          onNavigationRequest: (NavigationRequest request) {
            String url = request.url;
            debugPrint(url);
            if (url.contains("https://att.technocorp.uz/api/account/one-id-main/?code=")) {
              int index1 = url.indexOf("code=");
              int index2 = url.indexOf("&state");
              String code = url.substring(index1 + 5, index2);
              debugPrint('code: $code');
              bloc.oneId(body: code);
            } else {
              // _webViewController.loadRequest(Uri.dataFromString(url));
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          "https://sso.egov.uz/sso/oauth/Authorization.do?response_type=one_code&client_id=technocorp_uz&redirect_uri=https://att.technocorp.uz/api/account/one-id-main/&scope=technocorp_uz&state=eyJtZXRob2QiOiJJRFBXIn0=",
        ),
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isOneIdVerified) {
            _webViewController.clearCache();
            _webViewController.clearLocalStorage();
           context.goNamed(AppRoutes.main.name);
          }
        },
        builder: (context, state) {
          return WebViewWidget(
            controller: _webViewController,
          );
        },
      ),
    );
  }
}
