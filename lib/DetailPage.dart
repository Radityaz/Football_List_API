import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:football_list/PremiereLeagueModel.dart';
import 'package:readmore/readmore.dart';

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
        title: Text("Detail Page"),
      ),
      body: SingleChildScrollView(
          child: Container(
            child: Column( 
              children: [
                  Container(
 
                  child: FadeInImage.assetNetwork(
                    placeholder: "Image/loading.gif", placeholderScale: 2.5,
                    image: widget.teams.strTeamBanner.toString(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  color: Color.fromARGB(255, 53, 53, 53),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                        width: 90,
                        height: 90,
                        child: Container(
                          child: FadeInImage.assetNetwork(
                          placeholder: "Image/loading.gif", placeholderScale: 2.5,
                          image: widget.teams.strTeamBadge.toString(),
                  ),
                ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(margin: EdgeInsets.only(left: 10), child: Text(widget.teams.strTeam.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),),),
                          Container(margin: EdgeInsets.only(left: 10,top: 23), child: Text("Also Known as " + widget.teams.strTeamShort.toString(),style: TextStyle(color: Colors.white),),),
                          Container(margin: EdgeInsets.only(left: 10), child: Text("A football Club From  " + widget.teams.strCountry.toString(),style: TextStyle(color: Colors.white)),),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(child: Text(widget.teams.strTeam.toString() + " Stadium"),),
                  Container(
                  margin: const EdgeInsets.all(5),
                  width: 250,
                  height: 150,
                  child: FadeInImage.assetNetwork(
                    placeholder: "Image/loading.gif", placeholderScale: 2.5,
                    image: widget.teams.strStadiumThumb.toString(),
                  ),
                ),                
                Container(
                margin: const EdgeInsets.only(top: 10),  
                child: Text(widget.teams.strStadium.toString(),style: TextStyle(fontWeight: FontWeight.bold) ),
                ),
                Container(
                margin: const EdgeInsets.only(top: 5),  
                child: Text(widget.teams.strStadiumLocation.toString()),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10,top: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Text("Description:" , style: TextStyle(fontWeight: FontWeight.bold),),

                ),
                Container(
                margin: const EdgeInsets.all(10),
                child: ReadMoreText(
                  widget.teams.strStadiumDescription.toString(),
                    trimLines: 2, trimCollapsedText: 'Show more',trimExpandedText: 'Show less',
                      moreStyle: TextStyle(
                        fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                          lessStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                          )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 5, bottom: 5,left: 10),
                  child: Text("More About " + widget.teams.strTeam.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, ),
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
                ),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      );
  }
}
