class CategoriesModel {
  String? name ;
  String? image;

  CategoriesModel(this.name, this.image);
  CategoriesModel.fromJson(Map<String , dynamic>map){
    if(map == null){
      return;
    }
    name = map['name'];
    image = map['image'];
  }
  toJson(){
  return{
  name:'name',
  image: 'image'
  };
  }
}