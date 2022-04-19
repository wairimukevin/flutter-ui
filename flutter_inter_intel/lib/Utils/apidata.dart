class apidata{
final userId;
final id;
final title;
final completed;
 const apidata({
   this.userId,
   this.id,
   this.title,
   this.completed,
 });
 static apidata fromJson(json)=>apidata(
   userId: json["userId"],
   id: json["id"],
   title: json["title"],
   completed:json["completed"]
 );

}
