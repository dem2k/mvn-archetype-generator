#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package};

import picocli.CommandLine;

@CommandLine.Command(name = "${artifactId}", mixinStandardHelpOptions = true, version = "v${version}",
        description = "loremipsum")
public class AppMain {

    @CommandLine.Option(names = {"-?", "-h"}, description = "Display this Help Message", usageHelp = true)
    private boolean usageHelpRequested = false;

    public static void main(String[] args) {
        AppMain appMain = CommandLine.populateCommand(new AppMain(), args);
        if (appMain.usageHelpRequested) {
            CommandLine.usage(appMain, System.out);
            System.exit(1);
        }

        System.out.println("Hello world!");
    }
    
}
