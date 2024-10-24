enum ProjectStatus {
  completed,
  important,
  uncompleted
}

class Project {
  const Project({
    this.imageURL, 
    required this.techs, 
    required this.title, 
    required this.description,
  });

  final String techs, title, description;
  final String? imageURL;
}