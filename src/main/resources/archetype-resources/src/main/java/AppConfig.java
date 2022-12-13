#set( $sh = '#' )
#set( $ss = '$' )
#set( $se = '\' )
package ${package};

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter @Builder @ToString
public class AppConfig {

    @Builder.Default
    private final String foo = "foo";

    @Builder.Default
    private final String bar = "bar";

}
