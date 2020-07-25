package runner;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;

@KarateOptions(features = "src/test/java/config")

@RunWith(Karate.class)
public class RunKarateConfigTests {
	
}