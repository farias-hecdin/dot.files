local a=require("todo-comments.search")local b=require("trouble.util")local c=require("todo-comments.config")local function d(e,f,g,h)a.search(function(i)local j={}for k,l in pairs(i)do local m=(l.lnum==0 and 1 or l.lnum)-1;local n=(l.col==0 and 1 or l.col)-1;local o={row=m,col=n,message=l.text,sign=c.options.keywords[l.tag].icon,sign_hl="TodoFg"..l.tag,severity=0,range={start={line=m,character=n},["end"]={line=m,character=-1}}}table.insert(j,b.process_item(o,vim.fn.bufnr(l.filename,true)))end;if#j==0 then b.warn("no todos found")end;g(j)end,h.cmd_options)end;return d
