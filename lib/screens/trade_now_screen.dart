import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:tradenow/trade_now_icons.dart';
import 'package:tradenow/widgets/tn_admin_content.dart';
import 'package:tradenow/widgets/tn_app_bar.dart';
import 'package:tradenow/widgets/tn_call_tab_view.dart';
import 'package:tradenow/widgets/tn_tab_item.dart';

class TradeNowScreen extends StatefulWidget{
    @override
    _TradeNowScreenState createState() => _TradeNowScreenState();
}

class _TradeNowScreenState extends State<TradeNowScreen> 
    with SingleTickerProviderStateMixin {
    TabController _mainTabController;
    int _currentIndex = 0;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    BannerAd _myBanner;
    
    @override
    void initState(){
        super.initState();
        MobileAdTargetingInfo targetingInfo = new MobileAdTargetingInfo(
            keywords: <String>['tradenow', 'stockmarket', 'stock market'],
            contentUrl: 'https://google.com',
            birthday: new DateTime.now(),
            childDirected: false,
            designedForFamilies: false,
            gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
            testDevices: <String>[], // Android emulators are considered test devices
        );

        _myBanner = new BannerAd(
            // Replace the testAdUnitId with an ad unit id from the AdMob dash.
            // https://developers.google.com/admob/android/test-ads
            // https://developers.google.com/admob/ios/test-ads
            adUnitId: BannerAd.testAdUnitId,
            size: AdSize.smartBanner,
            targetingInfo: targetingInfo,
            listener: (MobileAdEvent event) {
                print("BannerAd event is $event");
            },
        );

        _mainTabController = TabController(vsync: this, length: 2, initialIndex: _currentIndex);
        _mainTabController.addListener((){
            setState(() {
                _currentIndex = _mainTabController.index;
            });
        });
    }

    @override
    void dispose(){
        _mainTabController.dispose();
        super.dispose();
    }
    
    void _switchTab(index){
        setState((){
            _currentIndex = index;
        });
        _mainTabController.animateTo(index);
    }
    
    @override
    Widget build(BuildContext context){
        return _appContent();
    }

    Widget _appContent([type = "cx"]) => type == "cx" ? _buildCustomerContent() : _buildAdminContent();

    Widget _buildCustomerContent(){
        DateTime now = DateTime.now();

        DateTime todaysCallStartOfTheDay = DateTime(now.year, now.month, now.day);
        DateTime todaysCallEndOfTheDay = DateTime(now.year, now.month, now.day).add(Duration(hours: 24));

        DateTime pastCallsStartOfTheDay = DateTime(now.year, now.month, now.day).subtract(Duration(days: 1));
        DateTime pastCallsEndOfTheDay = DateTime(now.year, now.month, now.day).subtract(Duration(hours: 24)).add(Duration(hours: 24));
        
        _myBanner..load()
            ..show(
                // Positions the banner ad 60 pixels from the bottom of the screen
                anchorOffset: 0.0,
                // Banner Position
                anchorType: AnchorType.bottom,
            );


        return Scaffold(
            body: Column(
                children: <Widget>[
                    TNAppBar(title: "TradeNow"),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                            TNTabItem(
                                icon: Icon(Icons.calendar_today, size: 14.0),
                                title: "Today's Calls",
                                isActive: _currentIndex == 0,
                                onTap: (){
                                    _switchTab(0);
                                }
                            ),
                            TNTabItem(
                                icon: Icon(TradeNowIcons.archive, size: 14.0),
                                title: "Past Calls",
                                isActive: _currentIndex == 1,
                                onTap: (){
                                    _switchTab(1);
                                }
                            )
                        ],
                    ),
                    SizedBox(height: 20.0),
                    Divider(height: 1.0, color: Color(0xffC5C8C9)),
                    Expanded(
                        child: TabBarView(
                            controller: _mainTabController,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                                TNCallTabView(stream: Firestore.instance.collection("calls").where("created_at", isGreaterThanOrEqualTo: todaysCallStartOfTheDay, isLessThan: todaysCallEndOfTheDay).orderBy("created_at", descending: true).snapshots()),
                                TNCallTabView(stream: Firestore.instance.collection("calls").where("created_at", isGreaterThanOrEqualTo: pastCallsStartOfTheDay, isLessThan: pastCallsEndOfTheDay).orderBy("created_at", descending: true).limit(7).snapshots())
                            ]
                        ),
                    ),
                    Container(
                        height: 50.0,
                        width: double.infinity,
                        color: Colors.black38,
                    )
                ]
            )
        );
    }
    
    Widget _buildAdminContent(){
        return TNAdminContent(scaffoldKey: _scaffoldKey);
    }
}