package meters.patch_meter;

import com.intuit.karate.junit5.Karate;

public class UpdateMeterRunner {

    @Karate.Test
    Karate updateMeter(){
        return Karate.run().relativeTo(getClass());
    }
}
