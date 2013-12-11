use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'MG' }
BEGIN { use_ok 'MG::Controller::Charity' }

ok( request('/charity')->is_success, 'Request should succeed' );
done_testing();
