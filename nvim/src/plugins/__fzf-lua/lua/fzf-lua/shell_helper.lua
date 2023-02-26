local a=vim.loop;local function b()local c=vim.fn.tempname()local d=a.new_pipe(false)a.pipe_bind(d,c)return d,c end;local e,f=b()a.listen(e,100,function(g)local h=a.new_pipe(false)a.accept(e,h)h:read_start(function(i,j)assert(not i)if not j then a.close(h)a.close(e)vim.schedule(function()vim.cmd[[qall]]end)return end;io.write(j)end)end)local function k(l)local m,n=pcall(function()local o={}for p=1,vim.fn.argc()do table.insert(o,vim.fn.argv(p-1))end;local q=vim.env.FZF_PREVIEW_LINES or vim.env.LINES;local r=vim.env.FZF_PREVIEW_COLUMNS or vim.env.COLUMNS;local s=vim.fn.sockconnect("pipe",l.fzf_lua_server,{rpc=true})vim.rpcrequest(s,"nvim_exec_lua",[[
      local luaargs = {...}
      local function_id = luaargs[1]
      local preview_socket_path = luaargs[2]
      local fzf_selection = luaargs[3]
      local fzf_lines = luaargs[4]
      local fzf_columns = luaargs[5]
      local usr_func = require"fzf-lua.shell".get_func(function_id)
      return usr_func(preview_socket_path, fzf_selection, fzf_lines, fzf_columns)
    ]],{l.fnc_id,f,o,tonumber(q),tonumber(r)})vim.fn.chanclose(s)end)if not m or l.debug then io.stderr:write(("[DEBUG]\tdebug = %s\n"):format(l.debug))io.stderr:write(("[DEBUG]\tfunction ID = %d\n"):format(l.fnc_id))io.stderr:write(("[DEBUG]\tfzf_lua_server = %s\n"):format(l.fzf_lua_server))for p=1,#vim.v.argv do io.stderr:write(("[DEBUG]\targv[%d] = %s\n"):format(p,vim.v.argv[p]))end;for p=1,vim.fn.argc()do io.stderr:write(("[DEBUG]\targ[%d] = %s\n"):format(p,vim.fn.argv(p-1)))end end;if not m then io.stderr:write(("FzfLua Error: %s\n"):format(n or"<null>"))vim.cmd[[qall]]end end;return{rpc_nvim_exec_lua=k}
