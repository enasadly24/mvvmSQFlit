
import 'package:mvvm_buildrealproject/ModelSerlization/Article.dart';
import 'package:mvvm_buildrealproject/ModelSerlization/Articles.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class SQLService {
  Database APIdb;
  static const String Table_Articles="articles";
  static const String Table_FavList="favorit_list";
  Future openDB() async {
    try {
      //get location using getDataBasesPath
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, "News.db");

      //open database
      APIdb = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int vesrion) async {
          print(APIdb);
          this.APIdb = APIdb;
          createTables();
        },
      );
      return true;

    } catch (e) {
      print("ERROR IN OPEN DATABASE $e");
      return Future.error(e);
    }
  }

  createTables() async {
    try {
      var qry = 'CREATE TABLE IF NOT EXISTS $Table_Articles('
          'id TEXT PRIMARY KEY,'
          'title TEXT ,'
          'description TEXT,'
          'url TEXT,'
          'fav INTEGER)';
      await APIdb.execute(qry);
      qry = "CREATE TABLE IF NOT EXISTS $Table_FavList("
          "id TEXT PRIMARY KEY,"
          "title TEXT,"
          "description TEXT,"
          "url TEXT,"
          "fav INTEGER)";

      await APIdb.execute(qry);
    } catch (e) {
      print("ERROR IN CREATE TABLE");
      print(e);
    }
  }

  Future<Article> saveRecord(Article data) async {
    await this.APIdb.transaction((txn) async {
      data.id =
          'INSERT INTO $Table_Articles (title, description,url,fav) VALUES("${data
          .title}",${data.description}, "${data.url}",${data.fav ? 1 : 0})${data.toJson()}';
      int id1 = await txn.rawInsert(data.id);
      return id1;
    });
  }

  Future setItemFavourit(Article article,int id, bool flag) async {
    var query = "UPDATE $Table_Articles set fave=? WHERE id=?";
    return await this.APIdb.rawUpdate(query,[flag ? 1 : 0, id,article.toJson()]);
  }

  Future <Articles>getItemsRecord() async {
      List<Map> maps= await APIdb.rawQuery("SELECT * FROM $Table_Articles", []);
      Articles allarticles= Articles(articles: []);
      List<Article> articles= [];
      if(maps.length>0){
        for(int i=0;i<maps.length;i++){
          articles.add(Article.fromJson(maps[i]));
        }
      }
      allarticles.articles=articles;
      return allarticles;
  }

  Future getFavoritList() async {

    List<Map>maps = await APIdb.rawQuery("SELECT *FROM $Table_FavList ", []);
    Articles allarticles= Articles(articles: []);
    List<Article> articles= [];

    if(maps.length>0){
      for(int i=0;i<maps.length;i++){
        articles.add(Article.fromJson(maps[i]));
      }
    }
    allarticles.articles=articles;
    return allarticles;
  }
  Future<Article> addToFavorit(Article data) async {
    await this.APIdb.transaction((txn) async {
      data.id =
          'INSERT INTO $Table_FavList (title, description,url,fav) VALUES("${data
          .title}",${data.description}, "${data.url}",${data.fav ? 1 : 0})${data.id}';
      int id1 = await txn.rawInsert(data.id);
      return id1;
    });
  }
  Future removeFromCart(int favId)async{
    var qry= 'DELETE FROM $Table_FavList where id=${favId}';
    return await this.APIdb.rawDelete(qry);
  }

}
