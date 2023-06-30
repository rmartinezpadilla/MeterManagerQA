package meters.get_meters;

import com.intuit.karate.junit5.Karate;

public class ReadMeterRunner {

    @Karate.Test
    Karate readMeter(){
        return Karate.run().relativeTo(getClass());
    }
}
