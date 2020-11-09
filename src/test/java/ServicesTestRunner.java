import com.intuit.karate.Results;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.testng.annotations.Test;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.testng.AssertJUnit.assertTrue;

public class ServicesTestRunner {

    @Test
    public void tests() {
        Results results = com.intuit.karate.Runner.path("classpath:services").parallel(2);
        Collection<File> jsonFiles = FileUtils.listFiles(new File(results.getReportDir()), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target/generated-reports"), "Services Test");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }
}
