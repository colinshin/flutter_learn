import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/generated/i18n.dart';
import 'package:flutter_learn/model/web_view_model.dart';
import 'package:flutter_learn/util/log_util.dart';
import 'package:flutter_learn/util/share_util.dart';
import 'package:webview_flutter/webview_flutter.dart';

///加载网页
class WebViewPage extends StatefulWidget {
  const WebViewPage(
    this.model, {
    Key key,
  }) : super(key: key);

  final WebViewModel model;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController _webViewController;
  ValueNotifier _canGoBack = ValueNotifier(false);
  ValueNotifier _canGoForward = ValueNotifier(false);
  ValueNotifier _getTitle = ValueNotifier("...");
  bool _loading = true;
  bool _nextLoading = false;
  String _currentUrl;
  String _title;
  String _currentTitle;

  @override
  Widget build(BuildContext context) {
    _title = _title == null || _title.isEmpty
        ? S.of(context).loadingWebTitle
        : _title;
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: _getTitle,
          builder: (context, title, child) => Text(_title),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Theme(
              data: ThemeData(
                cupertinoOverrideTheme: CupertinoThemeData(
                  primaryColor: Colors.red,
                ),
              ),
              child: CupertinoActivityIndicator(
                radius: _nextLoading ? 8 : 0.5,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // 模糊进度条(会执行一个动画)
          Container(
            height: _loading ? 2 : 0,
            child: LinearProgressIndicator(
              backgroundColor: Theme.of(context).appBarTheme.color,
              valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
            ),
          ),
          Expanded(
            flex: 1,
            child: SafeArea(
              child: WebView(
                initialUrl: widget.model.url,
                debuggingEnabled: false,
                javascriptMode: JavascriptMode.unrestricted,
                navigationDelegate: (NavigationRequest request) {
                  debugPrint('导航$request');
                  if (!request.url.startsWith('http')) {
                    return NavigationDecision.prevent;
                  } else {
                    if (_currentTitle != null && _currentTitle.isNotEmpty) {
                      setState(() {
                        _nextLoading = true;
                      });
                    }
                    return NavigationDecision.navigate;
                  }
                },
                onWebViewCreated: (WebViewController web) {
                  debugPrint("onWebViewCreated");
                  _webViewController = web;

                  ///webView 创建调用，
                  web.currentUrl().then((url) {
                    ///返回当前url
                    _currentUrl = url;
                    debugPrint("_currentUrl:" + _currentUrl);
                  });
                },
                onPageFinished: (String value) async {
                  debugPrint("onPageFinished:" + value);

                  ///webView页面加载调用
                  setState(() {
                    _loading = false;
                    _nextLoading = false;
                  });
                  refreshNavigator();
                },
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: IconTheme(
        data: Theme.of(context).iconTheme.copyWith(
              color: Theme.of(context).accentColor,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ValueListenableBuilder(
              valueListenable: _canGoBack,
              builder: (context, value, child) => IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  tooltip: S.of(context).back,
                  onPressed: !value
                      ? null
                      : () {
                          _webViewController.goBack();
                          refreshNavigator();
                        }),
            ),
            ValueListenableBuilder(
              valueListenable: _canGoForward,
              builder: (context, value, child) => IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  tooltip: S.of(context).forward,
                  onPressed: !value
                      ? null
                      : () {
                          _webViewController.goForward();
                          refreshNavigator();
                        }),
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              tooltip: S.of(context).refresh,
              onPressed: () {
                _webViewController.reload();
              },
            ),
            IconButton(
              icon: Icon(Icons.share),
              tooltip: S.of(context).share,
              onPressed: () {
                ShareUtil.share(
                    widget.model.title + _currentUrl ?? widget.model.url);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 刷新导航按钮
  ///
  /// 目前主要用来控制 '前进','后退'按钮是否可以点击
  /// 但是目前该方法没有合适的调用时机.
  /// 在[onPageFinished]中,会遗漏正在加载中的状态
  /// 在[navigationDelegate]中,会存在页面还没有加载就已经判断过了.
  void refreshNavigator() {
    /// 是否可以后退
    _webViewController.canGoBack().then((value) {
      debugPrint('_canGoBack--->$value');
      return _canGoBack.value = value;
    });

    /// 是否可以前进
    _webViewController.canGoForward().then((value) {
      debugPrint('_canGoForward--->$value');
      return _canGoForward.value = value;
    });
    _webViewController.getTitle().then((title) {
      LogUtil.e("getTitle:" + title);
      _title = title;
      _currentTitle = title;
      return _getTitle.value = title;
    });
  }
}
