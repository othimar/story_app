import 'package:flutter/material.dart';
import 'package:story_app/story.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Story> stories = [Stories.h1, Stories.h2];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(stories),
      onGenerateRoute: routeHandler,
    );
  }

  Route routeHandler(RouteSettings settings) {
    List<String> data = settings.name!.split(":");
    //print(data);
    String routeName = data[0];
    int id = int.tryParse(data[1]) ?? -1;
    print("id de l'histoire: $id");
    Widget output;
    switch(routeName){
      case 'story':
        output = StoryWidget(stories[id]);
        break;
      default:
        output = ErrorWidget();
    }
    return MaterialPageRoute(builder: (context){
      return output;
    });
  }
}

class MyHome extends StatelessWidget {
  final List<Story> stories;
  MyHome(this.stories);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choisissez une histoire'),
      ),
      body: ChooseStory(stories),
    );
  }
}

class ChooseStory extends StatelessWidget {
  final List<Story> stories;
  ChooseStory(this.stories);
  @override
  Widget build(BuildContext context) {
    print("nombre d'histoire: ${stories.length}");
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(stories[index].title),
          onTap: () {
            Navigator.pushNamed(context, "story:$index");
          },
        );
      },
      itemCount: stories.length,
    );
  }
}

class ErrorWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Erreur'),
      ),
    );
  }
}
