package meters.post_create_meter;

import com.intuit.karate.junit5.Karate;

public class CreatMeterRunner {

    @Karate.Test
    Karate createMeter(){
        return Karate.run().relativeTo(getClass());
    }
}
