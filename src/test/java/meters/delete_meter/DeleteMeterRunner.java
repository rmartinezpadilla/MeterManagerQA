package meters.delete_meter;

import com.intuit.karate.junit5.Karate;

        public class DeleteMeterRunner {
            @Karate.Test
            Karate deleteMeter(){
                return Karate.run("delete-meter").relativeTo(getClass());
            }
        }
