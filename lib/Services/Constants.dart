class BaseUrl{
  static const url= "https://newsapi.org/v2/top-headlines?country=us&apiKey=0cf790498275413a9247f8b94b3843fd";

  static String headlinesFor(String keyword){
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=e1cef2bff9334c58b5504f22d2046bd0";
  }
}