<%class>
use B::Hooks::EndOfScope;

method no_main () {
    on_scope_end {
        $self->meta->remove_method("main");
    };
}
</%class>
