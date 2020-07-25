package runner;

import org.junit.Test;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.Assert.assertTrue;

public class RunKarateTestsInParallel {
	
	@Test
    public void testParallel() {
        Results results = Runner.path("src/test/java/advanced").tags("~@ignore").parallel(5);
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }
    
	
}