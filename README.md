# LFE Example #

This is a tiny example OTP app written in LFE. See the Keynote presentation for some minimal info, then try:

    rebar compile && ./start.sh

Then, in the Erlang shell:

    application:start(lfe_example), %% Start the application
    lfe_example_server:fib(5).      %% Get a Fibonacci

Enjoy.