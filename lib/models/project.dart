class Project{
  int index;
  String name;
  String description;
  String img;
  String techs;
  List<Demo> demos;

  Project({required this.index, required this.name, required this.description, required this.img, required this.techs, required this.demos});
}

class Demo{
  DemoType type;
  String url;

  Demo({required this.type, required this.url});

}

enum DemoType{
  appstore,
  chplay
}