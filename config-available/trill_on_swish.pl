:- module(conf_trill_on_swish, []).
:- use_module(cliopatria(hooks)).

/** <module> Add Prolog interaction to ClioPatria
*/

:- multifile
	user:file_search_path/2,
	trill_on_swish_config:config/2.

% tell trill_on_swish where to find its parts.   The last clause allows adding an
% =examples=  directory  in  the  main   directory  holding  application
% specific examples.

user:file_search_path(trill_on_swish_web, web(.)).
user:file_search_path(example,   cpacks(trill_on_swish/examples)).
%user:file_search_path(example,	 examples).

% Load trill_on_swish.  You need this.
:- use_module(applications(trill_on_swish)).
% Load the authentication hook. When loaded, ClioPatria users with admin
% rights can use trill_on_swish without sandboxing security
:- use_module(library(trill_on_swish/cp_authenticate)).
% Enable logging of trill_on_swish queries and sources if HTTP logging is enabled
:- use_module(library(trill_on_swish/logging)).

% Allows users to extend the Examples menu by ticking the Example
% checkbox.
trill_on_swish_config:config(community_examples, false).

%%      cliopatria:menu_item(-Item, -Label) is nondet.
%
%       Add trill_on_swish to the Query menu.

cliopatria:menu_item(300=query/trill_on_swish, 'TRILL on SWISH Prolog shell').
