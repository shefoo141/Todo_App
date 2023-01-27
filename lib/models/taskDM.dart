class task{
  String id;
  String title;
  String description;
  bool isDone;
  int date;

  task({this.id = "",
    required this.title,
    required this.description,
    this.isDone = false, required this.date});

  task.fromJson(Map<String,dynamic> json)
      :this(
    id:json["id"],
    title:json["title"],
    description:json["description"],
    isDone:json["isDone"],
    date:json["date"],
  );

  Map<String,dynamic> toJson(){
    return {
      "id" : id,
      "title" : title,
      "description" : description,
      "isDone" : isDone,
      "date" : date,
    };
  }


}