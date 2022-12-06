#set( $sh = '#' )
#set( $ss = '$' )
#set( $se = '\' )
package ${package};

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class AppConfig {

    private final String foo;
    private final String bar;

}
