import 'package:flutter/material.dart';

class Story {
  final String title;
  final List<String> pages;
  Story(this.title, this.pages);
}

class StoryWidget extends StatelessWidget {
  final Story _st;

  StoryWidget(this._st);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_st.title),
        centerTitle: true,
      ),
      body: PageView.builder(
          itemCount: _st.pages.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Center(
                child: Text(_st.title),
              );
            } else {
              return Center(child: Text(_st.pages[index - 1]));
            }
          }),
    );
  }
}

class Stories {
  static final Story h1 = Story("Une histoire merdique", [
    "Il était une fois, dans un pays très lointain...",
    "Un chateau protégé par un méchant dragon.",
    "...",
  ]);
  static final Story h2 = Story("Le cheval noir", [
    "Au commencement de l'an 2019,",
    "une petite syrène",
    "...",
  ]);
}
