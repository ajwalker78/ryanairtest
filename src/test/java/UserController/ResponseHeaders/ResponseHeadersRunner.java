package UserController.ResponseHeaders;

import com.intuit.karate.junit5.Karate;

class ResponseHeadersRunner {
    
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}