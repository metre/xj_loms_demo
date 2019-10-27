import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget titleSelect = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.all(18.0),
                    child: new Text("喜欢吗？嘻嘻，哈哈，我就是这样，哈哈",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 14.0
                        )),
                  ),
                  new Text(
                    "你是傻子吧，你猜啊，",
                    style: new TextStyle(color: Colors.grey[500],fontSize: 10.0),

                  )
                ],
              )),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text("41",style: new TextStyle(fontSize: 20.0),)
        ],
      ),
    );

    Column buidbBotColumn(IconData icon, String lab) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Icon(
            icon,
            color: color,
          ),
          new Text(
            lab,
            style: new TextStyle(
                fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
          )
        ],
      );
    }

    Widget botSelect = new Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buidbBotColumn(Icons.call, 'call'),
          buidbBotColumn(Icons.near_me, 'route'),
          buidbBotColumn(Icons.share, 'share')
        ],
      ),
    );

    Widget textSele = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '花半开最美，情留白最浓，懂得给生命留白，亦是一种生活的智慧。淡泊以明志，宁静以致远，懂得给心灵留白，方能在纷杂繁琐的世界，淡看得失，宠辱不惊，去意无留；懂得给感情留白，方能持久生香，留有余地，相互欣赏，拥有默契；懂得给生活留白，揽一份诗意，留一份淡定，多一份睿智，生命方能如诗如画。人心，远近相安，时光，浓淡相宜。有些风景要远观，才能美好；有些人情要淡然，才会久远，人生平淡更持久，留白方能生远，莲养心中，随遇而安，生命的最美不过是懂得的距离    静静的心里，都有一道最美丽的风景。尽管世事繁杂，此心依然，情怀依然；尽管颠簸流离，脚步依然，追求依然；尽管岁月沧桑，世界依然，生命依然。守住最美风景，成为一种风度，宁静而致远；守住最美风景，成为一种境界，悠然而豁达；守住最美风景，成为一种睿智，淡定而从容。带着前世的印记，心怀纯净，身披霞带，踏一水清盈，今生，寻美好而来',
        softWrap: true,style: new TextStyle(fontSize: 18.0),
      ),
    );

    return MaterialApp(
      title: "flutter demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: new Container(
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/timg.jpeg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSelect,
            botSelect,
            textSele
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('images/ic_launcher.png'),
            Image.asset('images/ic_launcher.png'),
            Image.asset('images/ic_launcher.png'),
          ],
        ),
      ),
    );
  }
}