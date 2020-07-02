:- module(pengine_server,
          [ server/1                    % +Port
          ]).

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_server_files)).
:- use_module(library(http/http_files)).
:- use_module(library(pengines)).
:- use_module(pengine_sandbox:library(pengines)).

:- http_handler(/, http_reply_from_files(web, []), [prefix]).

:- set_setting_default(http:cors, [*]).

:- pengine_application(db).
:- use_module(db:'db.prolog').

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

:- server(3030).