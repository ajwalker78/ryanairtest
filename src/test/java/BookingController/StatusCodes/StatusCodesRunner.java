package BookingController.StatusCodes;

import com.intuit.karate.junit5.Karate;

class StatusCodesRunner {
    
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
