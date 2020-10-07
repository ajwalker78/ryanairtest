package RyanairAPI;

import com.intuit.karate.junit5.Karate;

class test_runner {


    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }

}

