local a=require("which-key.util")local b={}local function c(...)local d={}for e,f in ipairs({...})do for e,g in ipairs(f)do d[g]=g end end;return d end;local h={"noremap","desc","expr","silent","nowait","script","unique","callback","replace_keycodes"}local i={"prefix","mode","plugin","buffer","remap","cmd","name","group","preset","cond"}local j=c({"noremap","expr","silent","nowait","script","unique","prefix","mode","buffer","preset","replace_keycodes"})local k=c(h,i)function b.child_opts(l)local d={}for m,g in pairs(l)do if j[m]then d[m]=g end end;return d end;function b._process(n,l)local o={}local p={}for m,g in pairs(n)do if type(m)=="number"then if type(g)=="table"then table.insert(p,g)else table.insert(o,g)end elseif k[m]then l[m]=g else p[m]=g end end;return o,p end;function b._parse(n,q,l)if type(n)~="table"then n={n}end;local o,p=b._process(n,l)if l.plugin then l.group=true end;if l.name then l.name=l.name and l.name:gsub("^%+","")l.group=true end;if l.remap then l.noremap=not l.remap;l.remap=nil end;if l.buffer==0 then l.buffer=vim.api.nvim_get_current_buf()end;if l.cond~=nil then if type(l.cond)=="function"then if not l.cond()then return end elseif not l.cond then return end end;for m,g in pairs(p)do local r=b.child_opts(l)if type(m)=="string"then r.prefix=(r.prefix or"")..m end;b._try_parse(g,q,r)end;if#o==1 then assert(type(o[1])=="string","Invalid mapping for "..vim.inspect({value=n,opts=l}))l.desc=o[1]elseif#o==2 then assert(type(o[2])=="string")l.desc=o[2]if type(o[1])=="string"then l.cmd=o[1]elseif type(o[1])=="function"then l.cmd=""l.callback=o[1]else error("Incorrect mapping "..vim.inspect(o))end elseif#o>2 then error("Incorrect mapping "..vim.inspect(o))end;if l.desc or l.group then if type(l.mode)=="table"then for e,s in pairs(l.mode)do local t=vim.deepcopy(l)t.mode=s;table.insert(q,t)end else table.insert(q,l)end end end;function b.to_mapping(u)u.silent=u.silent~=false;u.noremap=u.noremap~=false;if u.cmd and u.cmd:lower():find("^<plug>")then u.noremap=false end;u.buf=u.buffer;u.buffer=nil;u.mode=u.mode or"n"u.label=u.desc or u.name;u.keys=a.parse_keys(u.prefix or"")local l={}for e,r in ipairs(h)do l[r]=u[r]u[r]=nil end;if vim.fn.has("nvim-0.7.0")==0 then l.replace_keycodes=nil;l.desc=nil;if l.callback then local v=require("which-key.keys").functions;table.insert(v,l.callback)if l.expr then l.cmd=string.format([[luaeval('require("which-key").execute(%d)')]],#v)else l.cmd=string.format([[<cmd>lua require("which-key").execute(%d)<cr>]],#v)end;l.callback=nil end end;u.opts=l;return u end;function b._try_parse(n,q,l)local w,x=pcall(b._parse,n,q,l)if not w then a.error(x)end end;function b.parse(q,l)l=l or{}local d={}b._try_parse(q,d,l)return vim.tbl_map(function(y)return b.to_mapping(y)end,d)end;return b
