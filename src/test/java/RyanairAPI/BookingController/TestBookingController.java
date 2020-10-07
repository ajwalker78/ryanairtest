package RyanairAPI.BookingController;

import com.intuit.karate.junit5.Karate;

class TestBookingController {
    

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }

    }
