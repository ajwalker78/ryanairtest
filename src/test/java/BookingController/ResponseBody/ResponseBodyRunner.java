package BookingController.ResponseBody;

import com.intuit.karate.junit5.Karate;

class ResponseBodyRunner {
    
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
