package RyanairAPI.UserController;

import com.intuit.karate.junit5.Karate;

class TestUserController {
    

    @Karate.Test
    Karate testAll() { return Karate.run().relativeTo(getClass());
    }

    }
