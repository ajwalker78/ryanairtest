package java;

import com.intuit.karate.junit5.Karate;

class test_runner {


    @Karate.Test
    Karate testSample() {
        return Karate.run("BookingController").relativeTo(getClass());
    }

            }