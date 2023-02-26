local a=vim.api;local b={}do local c={}function b.errmsg(d,e)return(c[e]or a.nvim_err_writeln)("[sos.nvim]: "..d)end end;return b
