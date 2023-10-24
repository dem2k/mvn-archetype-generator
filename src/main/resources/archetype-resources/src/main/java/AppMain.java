#set( $sh = '#' )
#set( $ss = '$' )
#set( $se = '\' )
package ${package};

import picocli.CommandLine;

@CommandLine.Command(name = "${artifactId}", mixinStandardHelpOptions = true, version = "v${version}",
        description = "this_is_a_simple_but_powerful_foobar_command")
public class AppMain {

    @CommandLine.Option(names = "-f", description = "foo", required = false)
    private static String foo = "Foo";

    @CommandLine.Option(names = "-b", description = "bar", required = false)
    private static String bar = "Bar";

    @CommandLine.Option(names = {"-?", "-h"}, description = "Display this Help Message", usageHelp = true)
    private static boolean usageHelpRequested = false;

    public static void main(String[] args) {
        AppMain app = CommandLine.populateCommand(new AppMain(), args);

        if (usageHelpRequested) {
            CommandLine.usage(app, System.out);
            System.exit(1);
        }

        AppConfig config = AppConfig.builder()
                .foo(foo)
                .bar(bar)
                .build();
        app.withConfiguration(config);
    }

    private void withConfiguration(AppConfig config) {
        System.out.printf("%s? %s!", config.foo(), config.bar());
    }

}
