local a=vim.loop;local b={}local c={}b.handles=c;function b.print_handles()local d=true;for e,f in pairs(c)do local g,h,i=unpack(f)if g and not h and not g:is_closing()then print('')print(i)d=false end end;if d then print('No active handles')end end;vim.api.nvim_create_autocmd('VimLeavePre',{callback=function()for e,f in pairs(c)do local g=f[1]if g and not g:is_closing()then g:close()end end end})function b.new_timer(h)local j=a.new_timer()c[#c+1]={j,h,debug.traceback()}return j end;function b.new_fs_poll(h)local j=a.new_fs_poll()c[#c+1]={j,h,debug.traceback()}return j end;function b.new_pipe(k)local j=a.new_pipe(k)c[#c+1]={j,false,debug.traceback()}return j end;function b.spawn(l,m,n)local g,o=a.spawn(l,m,n)if g then c[#c+1]={g,false,l..' '..vim.inspect(m)}end;return g,o end;return b