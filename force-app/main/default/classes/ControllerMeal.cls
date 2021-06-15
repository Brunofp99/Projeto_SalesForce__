public class ControllerMeal {

    @AuraEnabled(cacheable = true)
    public static List<MealsList> wireCall(String strSearch){
        HttpRequest req = new HttpRequest();
        String endpoint = ( strSearch == null ? 'https://www.themealdb.com/api/json/v1/1/search.php?s=' : 'https://www.themealdb.com/api/json/v1/1/search.php?s=' + strSearch );
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        HttpResponse res = new Http().send(req);
        return ((Meal) System.JSON.deserialize(res.getBody(), Meal.class)).meals;
    }

    public class Meal{
        public List<MealsList> meals;
    }

    public class MealsList{
        @AuraEnabled
        public String idMeal;
        @AuraEnabled
        public String strMeal;
        @AuraEnabled
        public String strCategory;
        @AuraEnabled
        public String strArea;
        @AuraEnabled
        public String strMealThumb;
        @AuraEnabled
        public String strInstructions;
    }
}
