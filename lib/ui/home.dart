import 'dart:async';
import 'package:coco_jambo_admin/utils/color.dart';
import 'package:flutter/material.dart';
import '../utils/string.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var menuArray = [
    'Dashboard',
    'Main Categories',
    'Sub Categories',
    'Tasks',
    'App Settings',
    'In-App Purchases',
    'PopUps',
    'Push Notifications'
  ];
  var selectedIndex = 0;
  var selectedCategory = 'Dashboard';
  TextEditingController searchController = TextEditingController();
  var selectedValue = '10';
  var isShowCategoryPopup = false;
  var isShowSubCategoryPopup = false;
  var isShowtasksPopup = false;
  var isShowPopup = false;

  var mainCategoryData = [
    {
      'headline': 'Warm Up',
      'desc':
          'Bereitet euch auf unvergesslichen Spaß bei einer Party mit der perfekten Spielform Piccolo. Es wird keine Gnade geben.'
    },
    {
      'headline': 'Pre Party',
      'desc':
          'Warnung: Dieses Spiel ist nur für Spieler geeignet, die bereits gut angetrunken sind und ihre Sinne nicht mehr beisammen haben. Spiel auf eigene Gefahr.'
    }
  ];

  var subCategoryData = [
    {'main_category': '1', 'sub_category': '1', 'name': 'Standard'},
    {'main_category': '1', 'sub_category': '2', 'name': 'Spiel'}
  ];

  var tasksData = [
    {
      'main_category': '1',
      'sub_category': '1',
      'task':
          'Schauspieler aus The Big Bank Theory. Der Spieler, der etwas wiederholt oder keine Idee mehr hat, bekommt 3 Strafen. (Player) beginnt.'
    },
    {
      'main_category': '1',
      'sub_category': '1',
      'task':
          'Wählt gemeinsam die Person unter euch, die regelmäßig vor allem auf Partys einschläft. Die Person bekommt 4 Strafen.'
    }
  ];
  var popupData = [
    {
      'popup': '1',
      'desc': 'Na, habt ihr Fun? Dann gebt uns 5 Sterne im Store!'
    },
    {
      'popup': '2',
      'desc': 'Seid ihr sicher, dass ihr die Spielrunde verlassen wollt?'
    }
  ];

  TextEditingController headlineController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController mainCatController = TextEditingController();
  TextEditingController subCatController = TextEditingController();
  TextEditingController nameSubCatController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  TextEditingController noController = TextEditingController();
  TextEditingController yesController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Text('Coco Jambo',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: fontFamily.fontHelveticaNeueLTStd,
                color: CustomColors.primaryColor)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Account: admin@cocojambo.app',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontFamily.fontHelveticaNeueLTStd,
                        color: CustomColors.loginAccountColor)),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text('Logout',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: fontFamily.fontHelveticaNeueLTStd,
                          color: CustomColors.loginAccountColor)),
                )
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 30,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: InkWell(
                              onTap: () {
                                selectedIndex = index;
                                selectedCategory = menuArray[index];
                                setState(() {
                                  selectedIndex;
                                  selectedCategory;
                                });
                              },
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: selectedIndex == index
                                        ? CustomColors.primaryColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(1.0),
                                    border: Border.all(
                                        color: CustomColors.menuColor)),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Text('${menuArray[index]}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                              fontFamily.fontHelveticaNeueLTStd,
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : CustomColors.menuColor)),
                                )),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                selectedCategory == 'Dashboard'
                    ? dashboard()
                    : selectedCategory == 'Main Categories'
                        ? mainCategory()
                        : selectedCategory == 'Sub Categories'
                            ? subCategory()
                            : selectedCategory == 'Tasks'
                                ? tasks()
                                : selectedCategory == 'PopUps'
                                    ? popUp()
                                    : selectedCategory == 'App Settings'
                                        ? appSettings()
                                        : selectedCategory == 'In-App Purchases'
                                            ? inAppPurchases()
                                            : selectedCategory ==
                                                    'Push Notifications'
                                                ? pushNotifications()
                                                : const SizedBox()
              ],
            ),
          ),
          isShowCategoryPopup
              ? Center(
                  child: Container(
                    height: 300,
                    width: 600,
                    decoration: BoxDecoration(
                        color: CustomColors.tblBGColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Add Main Category #${mainCategoryData.length + 1}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: CustomColors.primaryColor)),
                              InkWell(
                                onTap: () {
                                  isShowCategoryPopup = false;
                                  setState(() {
                                    isShowCategoryPopup;
                                  });
                                },
                                child: Container(
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: BoxDecoration(
                                      color: CustomColors.primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: const Icon(Icons.close,
                                      size: 12, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text('Headline',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            fontFamily.fontHelveticaNeueLTStd,
                                        color: Colors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 35.0),
                                    child: Container(
                                      width: 450,
                                      height: 30,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: headlineController,
                                        keyboardType: TextInputType.text,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily
                                                .fontHelveticaNeueLTStd,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text('Description',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            fontFamily.fontHelveticaNeueLTStd,
                                        color: Colors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 17.0),
                                    child: Container(
                                      width: 450,
                                      height: 50,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: descController,
                                        maxLines: 10,
                                        keyboardType: TextInputType.text,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily
                                                .fontHelveticaNeueLTStd,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text('Main Cat',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            fontFamily.fontHelveticaNeueLTStd,
                                        color: Colors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 33.0),
                                    child: Container(
                                      width: 50,
                                      height: 30,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: mainCatController,
                                        maxLines: 10,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily
                                                .fontHelveticaNeueLTStd,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text('Sub Cat',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            fontFamily.fontHelveticaNeueLTStd,
                                        color: Colors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 39.0),
                                    child: Container(
                                      width: 50,
                                      height: 30,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: mainCatController,
                                        maxLines: 10,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily
                                                .fontHelveticaNeueLTStd,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30.0,
                                  width: 200.0,
                                  decoration: BoxDecoration(
                                      color: CustomColors.menuColor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 3.0),
                                      child: Text('Send',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: fontFamily
                                                  .fontHelveticaNeueLTStd,
                                              color: Colors.white)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          isShowSubCategoryPopup
              ? Center(
                  child: Container(
                    height: 250,
                    width: 600,
                    decoration: BoxDecoration(
                        color: CustomColors.tblBGColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Add Sub Category #${subCategoryData.length + 1}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: CustomColors.primaryColor)),
                              InkWell(
                                onTap: () {
                                  isShowSubCategoryPopup = false;
                                  setState(() {
                                    isShowSubCategoryPopup;
                                  });
                                },
                                child: Container(
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: BoxDecoration(
                                      color: CustomColors.primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: const Icon(Icons.close,
                                      size: 12, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text('Name',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            fontFamily.fontHelveticaNeueLTStd,
                                        color: Colors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 54.0),
                                    child: Container(
                                      width: 450,
                                      height: 30,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: nameSubCatController,
                                        keyboardType: TextInputType.text,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily
                                                .fontHelveticaNeueLTStd,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text('Main Cat',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            fontFamily.fontHelveticaNeueLTStd,
                                        color: Colors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 33.0),
                                    child: Container(
                                      width: 50,
                                      height: 30,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: mainCatController,
                                        maxLines: 10,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily
                                                .fontHelveticaNeueLTStd,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text('Sub Cat',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            fontFamily.fontHelveticaNeueLTStd,
                                        color: Colors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 39.0),
                                    child: Container(
                                      width: 50,
                                      height: 30,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: mainCatController,
                                        maxLines: 10,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily
                                                .fontHelveticaNeueLTStd,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30.0,
                                  width: 200.0,
                                  decoration: BoxDecoration(
                                      color: CustomColors.menuColor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 3.0),
                                      child: Text('Send',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: fontFamily
                                                  .fontHelveticaNeueLTStd,
                                              color: Colors.white)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          isShowtasksPopup
              ? Center(
                  child: Container(
                    height: 250,
                    width: 600,
                    decoration: BoxDecoration(
                        color: CustomColors.tblBGColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Add Task #${tasksData.length + 1}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: CustomColors.primaryColor)),
                              InkWell(
                                onTap: () {
                                  isShowtasksPopup = false;
                                  setState(() {
                                    isShowtasksPopup;
                                  });
                                },
                                child: Container(
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: BoxDecoration(
                                      color: CustomColors.primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: const Icon(Icons.close,
                                      size: 12, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text('Task',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            fontFamily.fontHelveticaNeueLTStd,
                                        color: Colors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 63.0),
                                    child: Container(
                                      width: 450,
                                      height: 50,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: taskController,
                                        keyboardType: TextInputType.text,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily
                                                .fontHelveticaNeueLTStd,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text('Main Cat',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            fontFamily.fontHelveticaNeueLTStd,
                                        color: Colors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 33.0),
                                    child: Container(
                                      width: 50,
                                      height: 30,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: mainCatController,
                                        maxLines: 10,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily
                                                .fontHelveticaNeueLTStd,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text('Sub Cat',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            fontFamily.fontHelveticaNeueLTStd,
                                        color: Colors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 39.0),
                                    child: Container(
                                      width: 50,
                                      height: 30,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: mainCatController,
                                        maxLines: 10,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily
                                                .fontHelveticaNeueLTStd,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30.0,
                                  width: 200.0,
                                  decoration: BoxDecoration(
                                      color: CustomColors.menuColor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 3.0),
                                      child: Text('Send',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: fontFamily
                                                  .fontHelveticaNeueLTStd,
                                              color: Colors.white)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          isShowPopup
              ? Center(
                  child: Container(
                    height: 300,
                    width: 600,
                    decoration: BoxDecoration(
                        color: CustomColors.tblBGColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Add PopUps #${popupData.length + 1}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: CustomColors.primaryColor)),
                              InkWell(
                                onTap: () {
                                  isShowPopup = false;
                                  setState(() {
                                    isShowPopup;
                                  });
                                },
                                child: Container(
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: BoxDecoration(
                                      color: CustomColors.primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: const Icon(Icons.close,
                                      size: 12, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text('Headline',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            fontFamily.fontHelveticaNeueLTStd,
                                        color: Colors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: Container(
                                      width: 400,
                                      height: 30,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: headlineController,
                                        keyboardType: TextInputType.text,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily
                                                .fontHelveticaNeueLTStd,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text('Description',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            fontFamily.fontHelveticaNeueLTStd,
                                        color: Colors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 33.0),
                                    child: Container(
                                      width: 400,
                                      height: 50,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: descController,
                                        maxLines: 10,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily
                                                .fontHelveticaNeueLTStd,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text('No',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            fontFamily.fontHelveticaNeueLTStd,
                                        color: Colors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 90.0),
                                    child: Container(
                                      width: 50,
                                      height: 30,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: noController,
                                        maxLines: 10,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily
                                                .fontHelveticaNeueLTStd,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text('Yes',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            fontFamily.fontHelveticaNeueLTStd,
                                        color: Colors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 85.0),
                                    child: Container(
                                      width: 50,
                                      height: 30,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: yesController,
                                        maxLines: 10,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily
                                                .fontHelveticaNeueLTStd,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30.0,
                                  width: 200.0,
                                  decoration: BoxDecoration(
                                      color: CustomColors.menuColor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 3.0),
                                      child: Text('Send',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: fontFamily
                                                  .fontHelveticaNeueLTStd,
                                              color: Colors.white)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }

  Widget dashboard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: Text('Welcome',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: fontFamily.fontHelveticaNeueLTStd,
                  color: CustomColors.primaryColor)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            color: CustomColors.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('14.02.2023 - Version: 1.0',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: fontFamily.fontHelveticaNeueLTStd,
                      color: CustomColors.primaryColor)),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text('Downloads: 0',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontFamily.fontHelveticaNeueLTStd,
                        color: CustomColors.primaryColor)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget mainCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              child: Text('Main Categories',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: fontFamily.fontHelveticaNeueLTStd,
                      color: CustomColors.primaryColor)),
            ),
            Row(
              children: [
                Text('Search',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontFamily.fontHelveticaNeueLTStd,
                        color: CustomColors.searchTextColor)),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    width: 100,
                    //height: 50.0,
                    child: TextField(
                      controller: searchController,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: fontFamily.fontHelveticaNeueLTStd,
                          color: Colors.black),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(13),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.1)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Show',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: fontFamily.fontHelveticaNeueLTStd,
                          color: CustomColors.searchTextColor)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        border:
                            Border.all(color: Colors.grey.withOpacity(1.0))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        iconSize: 16,
                        value: selectedValue,
                        itemHeight: 50,
                        items: <String>['10', '20', '30', '40', '50']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(value,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: CustomColors.searchTextColor)),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          selectedValue = value!;
                          setState(() {
                            selectedValue;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 10.0),
                  child: InkWell(
                    onTap: () {
                      isShowCategoryPopup = true;
                      setState(() {
                        isShowCategoryPopup;
                      });
                    },
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          color: CustomColors.addCatBGColor,
                          borderRadius: BorderRadius.circular(30.0)),
                      child:
                          const Icon(Icons.add, size: 25, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            color: CustomColors.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text('ID',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily.fontHelveticaNeueLTStd,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Headline',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily.fontHelveticaNeueLTStd,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(' Description',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily.fontHelveticaNeueLTStd,
                              color: Colors.white)),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 25.0),
                  child: Text('Edit',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: fontFamily.fontHelveticaNeueLTStd,
                          color: Colors.white)),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: ListView.builder(
            itemCount: mainCategoryData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  // height: 30.0,
                  padding: const EdgeInsets.all(10),
                  color:
                      index % 2 == 1 ? CustomColors.tblBGColor : Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                              '  ${index + 1}      ${mainCategoryData[index]['headline']}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: fontFamily.fontHelveticaNeueLTStd,
                                  color: Colors.black)),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 250,
                              child: Text('${mainCategoryData[index]['desc']}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: Colors.black)),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 0.0),
                        child: Container(
                          height: 20.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                              color: CustomColors.addCatBGColor,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 3.0),
                              child: Text('Edit',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget subCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              child: Text('Sub Categories',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: fontFamily.fontHelveticaNeueLTStd,
                      color: CustomColors.primaryColor)),
            ),
            Row(
              children: [
                Text('Search',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontFamily.fontHelveticaNeueLTStd,
                        color: CustomColors.searchTextColor)),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    width: 100,
                    //height: 50.0,
                    child: TextField(
                      controller: searchController,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: fontFamily.fontHelveticaNeueLTStd,
                          color: Colors.black),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(13),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.1)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Show',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: fontFamily.fontHelveticaNeueLTStd,
                          color: CustomColors.searchTextColor)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        border:
                            Border.all(color: Colors.grey.withOpacity(1.0))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        iconSize: 16,
                        value: selectedValue,
                        itemHeight: 50,
                        items: <String>['10', '20', '30', '40', '50']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(value,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: CustomColors.searchTextColor)),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          selectedValue = value!;
                          setState(() {
                            selectedValue;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 10.0),
                  child: InkWell(
                    onTap: () {
                      isShowSubCategoryPopup = true;
                      setState(() {
                        isShowSubCategoryPopup;
                      });
                    },
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          color: CustomColors.addCatBGColor,
                          borderRadius: BorderRadius.circular(30.0)),
                      child:
                          const Icon(Icons.add, size: 25, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            color: CustomColors.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text('ID',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily.fontHelveticaNeueLTStd,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Main Category',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily.fontHelveticaNeueLTStd,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Sub Category',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily.fontHelveticaNeueLTStd,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Name',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily.fontHelveticaNeueLTStd,
                              color: Colors.white)),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 25.0),
                  child: Text('Edit',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: fontFamily.fontHelveticaNeueLTStd,
                          color: Colors.white)),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: ListView.builder(
            itemCount: subCategoryData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  // height: 30.0,
                  padding: const EdgeInsets.all(10),
                  color:
                      index % 2 == 1 ? CustomColors.tblBGColor : Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                              '  ${index + 1}              ${subCategoryData[index]['main_category']}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: fontFamily.fontHelveticaNeueLTStd,
                                  color: Colors.black)),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              child: Text(
                                  '                        ${subCategoryData[index]['sub_category']}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: Colors.black)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              // width: MediaQuery.of(context).size.width - 350,
                              child: Text(
                                  '               ${subCategoryData[index]['name']}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: Colors.black)),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 0.0),
                        child: Container(
                          height: 20.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                              color: CustomColors.addCatBGColor,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 3.0),
                              child: Text('Edit',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget tasks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              child: Text('Tasks',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: fontFamily.fontHelveticaNeueLTStd,
                      color: CustomColors.primaryColor)),
            ),
            Row(
              children: [
                Text('Search',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontFamily.fontHelveticaNeueLTStd,
                        color: CustomColors.searchTextColor)),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    width: 100,
                    //height: 50.0,
                    child: TextField(
                      controller: searchController,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: fontFamily.fontHelveticaNeueLTStd,
                          color: Colors.black),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(13),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.1)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Show',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: fontFamily.fontHelveticaNeueLTStd,
                          color: CustomColors.searchTextColor)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        border:
                            Border.all(color: Colors.grey.withOpacity(1.0))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        iconSize: 16,
                        value: selectedValue,
                        itemHeight: 50,
                        items: <String>['10', '20', '30', '40', '50']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(value,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: CustomColors.searchTextColor)),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          selectedValue = value!;
                          setState(() {
                            selectedValue;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 10.0),
                  child: InkWell(
                    onTap: () {
                      isShowtasksPopup = true;
                      setState(() {
                        isShowtasksPopup;
                      });
                    },
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          color: CustomColors.addCatBGColor,
                          borderRadius: BorderRadius.circular(30.0)),
                      child:
                          const Icon(Icons.add, size: 25, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            color: CustomColors.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text('ID',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily.fontHelveticaNeueLTStd,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Main',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily.fontHelveticaNeueLTStd,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Sub',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily.fontHelveticaNeueLTStd,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Task',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily.fontHelveticaNeueLTStd,
                              color: Colors.white)),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 25.0),
                  child: Text('Edit',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: fontFamily.fontHelveticaNeueLTStd,
                          color: Colors.white)),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: ListView.builder(
            itemCount: tasksData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  // height: 30.0,
                  padding: const EdgeInsets.all(10),
                  color:
                      index % 2 == 1 ? CustomColors.tblBGColor : Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                              '  ${index + 1}        ${tasksData[index]['main_category']}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: fontFamily.fontHelveticaNeueLTStd,
                                  color: Colors.black)),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              child: Text(
                                  '      ${tasksData[index]['sub_category']}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: Colors.black)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 300,
                              child: Text('${tasksData[index]['task']}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: Colors.black)),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 0.0),
                        child: Container(
                          height: 20.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                              color: CustomColors.addCatBGColor,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 3.0),
                              child: Text('Edit',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget popUp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              child: Text('PopUp',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: fontFamily.fontHelveticaNeueLTStd,
                      color: CustomColors.primaryColor)),
            ),
            Row(
              children: [
                Text('Search',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontFamily.fontHelveticaNeueLTStd,
                        color: CustomColors.searchTextColor)),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    width: 100,
                    //height: 50.0,
                    child: TextField(
                      controller: searchController,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: fontFamily.fontHelveticaNeueLTStd,
                          color: Colors.black),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(13),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.1)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Show',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: fontFamily.fontHelveticaNeueLTStd,
                          color: CustomColors.searchTextColor)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        border:
                            Border.all(color: Colors.grey.withOpacity(1.0))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        iconSize: 16,
                        value: selectedValue,
                        itemHeight: 50,
                        items: <String>['10', '20', '30', '40', '50']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(value,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: CustomColors.searchTextColor)),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          selectedValue = value!;
                          setState(() {
                            selectedValue;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 10.0),
                  child: InkWell(
                    onTap: () {
                      isShowPopup = true;
                      setState(() {
                        isShowPopup;
                      });
                    },
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          color: CustomColors.addCatBGColor,
                          borderRadius: BorderRadius.circular(30.0)),
                      child:
                          const Icon(Icons.add, size: 25, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            color: CustomColors.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text('ID',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily.fontHelveticaNeueLTStd,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Pop Up',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily.fontHelveticaNeueLTStd,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Description',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily.fontHelveticaNeueLTStd,
                              color: Colors.white)),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 25.0),
                  child: Text('Edit',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: fontFamily.fontHelveticaNeueLTStd,
                          color: Colors.white)),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: ListView.builder(
            itemCount: popupData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  // height: 30.0,
                  padding: const EdgeInsets.all(10),
                  color:
                      index % 2 == 1 ? CustomColors.tblBGColor : Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                              '  ${index + 1}          ${popupData[index]['popup']}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: fontFamily.fontHelveticaNeueLTStd,
                                  color: Colors.black)),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 300,
                              child: Text('${popupData[index]['desc']}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: Colors.black)),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 0.0),
                        child: Container(
                          height: 20.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                              color: CustomColors.addCatBGColor,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 3.0),
                              child: Text('Edit',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          fontFamily.fontHelveticaNeueLTStd,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget appSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: Text('App Settings',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: fontFamily.fontHelveticaNeueLTStd,
                  color: CustomColors.primaryColor)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            color: CustomColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget inAppPurchases() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: Text('In-App Purchases',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: fontFamily.fontHelveticaNeueLTStd,
                  color: CustomColors.primaryColor)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            color: CustomColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget pushNotifications() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: Text('Push Notifications',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: fontFamily.fontHelveticaNeueLTStd,
                  color: CustomColors.primaryColor)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            color: CustomColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
