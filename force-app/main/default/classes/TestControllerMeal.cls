@isTest
public class TestControllerMeal {
    
    @isTest
    static void testWireCallNull() {
        MockMeal mock = new MockMeal(200, '{"meals":[{"strMeals": "Corba"},{"strMeals": "Beef Dumpling Stew"},{"strMeals": "Brown Stew Chicken"}]}');
        Test.setMock(HttpCalloutMock.class, mock);
        Test.startTest();
            List<ControllerMeal.MealsList> listMeal = ControllerMeal.wireCall(null);
            System.assertEquals(3, listMeal.size());
        Test.stopTest();
    }

    @isTest
    static void testWireCallString() {
        MockMeal mock = new MockMeal(200, '{"meals":[{"strMeals": "Corba"}]}');
        Test.setMock(HttpCalloutMock.class, mock);
        Test.startTest();
            List<ControllerMeal.MealsList> listMeal = ControllerMeal.wireCall('Corba');
            System.assertEquals(1, listMeal.size());
        Test.stopTest();
    }
}
