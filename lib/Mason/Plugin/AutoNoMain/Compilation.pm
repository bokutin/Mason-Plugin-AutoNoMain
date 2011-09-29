package Mason::Plugin::AutoNoMain::Compilation;
use Mason::PluginRole;

after parse => method () {
    if ( $self->{methods}{main} ) {
        if ( $self->{methods}{main}{body} =~ m{^\s*$}m ) {
            delete $self->{methods}{main};
        }
    }
};

1;
