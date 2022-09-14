import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:football_list/PremiereLeagueModel.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.teams}) : super(key: key);
  Teams teams;

  @override
  State<DetailPage> createState() => _DetailPageState();
}



class _DetailPageState extends State<DetailPage> {
  PremiereLeagueModel? premiereLeagueModel;
  bool isloaded = true;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {}
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.teams.strTeam.toString()),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column( 
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 150,
                  height: 150,
                  child: Image.network(widget.teams.strTeamBadge.toString()),
                ),
                Container(
                margin: const EdgeInsets.only(bottom: 20, top: 10),  
                child: Text(widget.teams.strStadium.toString(),style: TextStyle(fontWeight: FontWeight.bold) ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Text("Description:" , style: TextStyle(fontWeight: FontWeight.bold),),

                ),
                Container(
                margin: const EdgeInsets.all(10),
                child: Text(widget.teams.strDescriptionEN.toString()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 5, bottom: 5,left: 10),
                  child: Text("More About " + widget.teams.strTeam.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: InkWell(
                          onTap: () {
                            var myUrl =
                                "https://" + widget.teams.strYoutube.toString();
                            _launchInBrowser(myUrl);
                          },
                          child: Image(image: AssetImage("Image/youtube.png"),height: 25, width: 25,)),
                    ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: InkWell(
                          onTap: () {
                            var myUrl =
                                "https://" + widget.teams.strInstagram.toString();
                            _launchInBrowser(myUrl);
                          },
                          child: Image(image: AssetImage("Image/instagram.png"),height: 25, width: 25,)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: InkWell(
                          onTap: () {
                            var myUrl =
                                "https://" + widget.teams.strTwitter.toString();
                            _launchInBrowser(myUrl);
                          },
                          child: Image(image: AssetImage("Image/twitter.png"),height: 25, width: 25,)),
                        ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
