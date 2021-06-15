public class MockMeal implements HttpCalloutMock {

    protected Integer code;
    protected String body;
    public MockMeal(Integer code, String body ) {
        this.code = code;
        this.body = body;
    }
    
    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setBody(this.body);
        res.setStatusCode(this.code);
        return res;
    }
}
