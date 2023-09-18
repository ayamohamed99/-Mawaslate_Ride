import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../functions/functions.dart';
import 'package:tagyourtaxi_driver/pages/NavigatorPages/favourite.dart';
import 'package:tagyourtaxi_driver/pages/NavigatorPages/selectlanguage.dart';
import 'package:tagyourtaxi_driver/pages/NavigatorPages/sos.dart';
import 'package:tagyourtaxi_driver/pages/onTripPage/map_page.dart';
import 'package:tagyourtaxi_driver/styles/styles.dart';
import 'package:tagyourtaxi_driver/translations/translation.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Material(
      child: Directionality(
        textDirection: (languageDirection == 'rtl')
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            title: Text(
              languages[choosenLanguage]['text_settings'],
            ),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(CupertinoIcons.chevron_back),
            ),
          ),
          body: Column(
            children: [
              //sos
              InkWell(
                onTap: () async {
                  var nav = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Sos()));
                  if (nav) {
                    setState(() {});
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(media.width * 0.025),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/sos.png',
                        fit: BoxFit.contain,
                        width: media.width * 0.075,
                      ),
                      SizedBox(
                        width: media.width * 0.025,
                      ),
                      SizedBox(
                        width: media.width * 0.55,
                        child: Text(
                          languages[choosenLanguage]['text_sos'],
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.tajawal(
                            fontSize: media.width * sixteen,
                            color: textColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              ///

              //favorite
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Favorite()));
                },
                child: Container(
                  padding: EdgeInsets.all(media.width * 0.025),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: media.width * 0.075,
                      ),
                      SizedBox(
                        width: media.width * 0.025,
                      ),
                      SizedBox(
                        width: media.width * 0.55,
                        child: Text(
                          languages[choosenLanguage]['text_favourites'],
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.tajawal(
                              fontSize: media.width * sixteen,
                              color: textColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ////

              InkWell(
                onTap: () async {
                  var nav = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectLanguage()));
                  if (nav) {
                    setState(() {});
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(media.width * 0.025),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/changeLanguage.png',
                        fit: BoxFit.contain,
                        width: media.width * 0.075,
                      ),
                      SizedBox(
                        width: media.width * 0.025,
                      ),
                      SizedBox(
                        width: media.width * 0.55,
                        child: Text(
                          languages[choosenLanguage]['text_change_language'],
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.tajawal(
                              fontSize: media.width * sixteen,
                              color: textColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              //delete account
              InkWell(
                onTap: () {
                  setState(() {
                    deleteAccount = true;
                  });
                  valueNotifierHome.incrementNotifier();
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(media.width * 0.025),
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_forever,
                        size: media.width * 0.075,
                      ),
                      SizedBox(
                        width: media.width * 0.025,
                      ),
                      SizedBox(
                        width: media.width * 0.55,
                        child: Text(
                          languages[choosenLanguage]['text_delete_account'],
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.tajawal(
                              fontSize: media.width * sixteen,
                              color: textColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
