#!/bin/sh
cd `dirname $0`
erl -pa ebin deps/*/ebin -boot start_sasl # -s lfe_shell start
