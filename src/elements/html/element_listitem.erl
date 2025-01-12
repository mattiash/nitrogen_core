% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2010 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (element_listitem).
-include_lib ("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, listitem).

render_element(Record) -> 
    Body = [
        wf:html_encode(Record#listitem.text, Record#listitem.html_encode),
        Record#listitem.body
    ],

    wf_tags:emit_tag(li, Body, [
        {class, [listitem, Record#listitem.class]},
	{"data-role", Record#listitem.data_role},
	{"data-theme", Record#listitem.data_theme},
	{role, Record#listitem.role},
        {style, Record#listitem.style}
    ]).
