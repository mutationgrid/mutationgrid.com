use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'ManySites' }
BEGIN { use_ok 'ManySites::Controller::MG' }

ok( request('/mg')->is_success, 'Request should succeed' );
done_testing();
