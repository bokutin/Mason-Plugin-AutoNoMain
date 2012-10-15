use strict;
use feature ":5.10";
use Test::More;

use lib "lib";

use File::Path qw(remove_tree);
use FindBin;

use Mason;

{
    remove_tree("$FindBin::Bin/data");
    my $interp = Mason->new(
        comp_root => "t/comp",
        data_dir  => "t/data",
        plugins => [
        ],
    );
    is( $interp->run("/00-basic/hello")->output, "hello");
    is( $interp->run("/00-basic/blank_line")->output, "");
    is( $interp->run("/00-basic/blank_lines")->output, "\n\n");
    is( $interp->run("/00-basic/lines")->output, "\na\n\nb\n\nc\n\n");
    is( $interp->run("/00-basic/recursive_parse")->output, "hello");
    is( $interp->run("/00-basic/recursive_parse2")->output, "");
}

{
    remove_tree("$FindBin::Bin/data");
    my $interp = Mason->new(
        comp_root => "t/comp",
        data_dir  => "t/data",
        plugins => [
            "AutoNoMain",
        ],
    );
    is( $interp->run("/00-basic/hello")->output, "hello");
    is( $interp->run("/00-basic/blank_line")->output, "Base");
    is( $interp->run("/00-basic/blank_lines")->output, "\n\n");
    is( $interp->run("/00-basic/lines")->output, "\na\n\nb\n\nc\n\n");
    is( $interp->run("/00-basic/recursive_parse")->output, "hello");
    is( $interp->run("/00-basic/recursive_parse2")->output, "Base");
}

done_testing();
