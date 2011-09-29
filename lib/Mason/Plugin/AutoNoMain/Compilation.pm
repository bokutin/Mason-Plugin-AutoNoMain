package Mason::Plugin::AutoNoMain::Compilation;
use Mason::PluginRole;

after parse => method () {
    if ( $self->{methods}{main} ) {
        if ( $self->{methods}{main}{body} eq "" ) {
            delete $self->{methods}{main};
        }
    }
};

1;
