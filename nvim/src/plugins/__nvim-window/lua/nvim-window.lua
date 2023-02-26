local a=vim.api;local b=vim.fn;local c={}local d=27;local e=3;local f=6;local g={chars={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'},normal_hl='Normal',hint_hl='Bold',border='rounded'}local function h(i)local j={}local k=g.chars;local l={}local m={}local n=a.nvim_win_get_number(a.nvim_get_current_win())for o,p in ipairs(i)do local q=a.nvim_win_get_number(p)table.insert(l,q)m[q]=p end;table.sort(l)local r=1;for o,q in ipairs(l)do if q~=n then local s=k[r]if j[s]then s=s..(r==#k and k[1]or k[r+1])end;j[s]=m[q]end;r=r==#k and 1 or r+1 end;return j end;local function t(u,v)for s,o in pairs(u)do if s~=v and s:sub(1,1)==v then return true end end;return false end;local function w(j)local x={}for s,y in pairs(j)do local z=a.nvim_create_buf(false,true)if z>0 then local A=a.nvim_win_get_width(y)local B=a.nvim_win_get_height(y)local C=math.max(0,math.floor(B/2-1))local D=math.max(0,math.floor(A/2-f))a.nvim_buf_set_lines(z,0,-1,true,{'','  '..s..'  ',''})a.nvim_buf_add_highlight(z,0,g.hint_hl,1,0,-1)local E=a.nvim_open_win(z,false,{relative='win',win=y,row=C,col=D,width=#s==1 and f-1 or f,height=e,focusable=false,style='minimal',border=g.border,noautocmd=true})a.nvim_win_set_option(E,'winhl','Normal:'..g.normal_hl)a.nvim_win_set_option(E,'diff',false)x[E]=z end end;vim.cmd('redraw')return x end;local function F(x)for y,z in pairs(x)do a.nvim_win_close(y,true)a.nvim_buf_delete(z,{force=true})end end;local function G()local H,I=pcall(b.getchar)return H and b.nr2char(I)or nil end;function c.setup(J)g=vim.tbl_extend('force',g,J)end;function c.pick()local i=vim.tbl_filter(function(K)return a.nvim_win_get_config(K).relative==''end,a.nvim_tabpage_list_wins(0))local h=h(i)local x=w(h)local s=G()local y=nil;if not s or s==d then F(x)return end;local y=h[s]local L={}local M=0;for N,p in pairs(h)do if vim.startswith(N,s)then L[N]=p;M=M+1 end end;if M>1 then F(x)x=w(L)local O=G()if O then local P=s..O;y=h[P]or h[s]else y=nil end end;F(x)if y then a.nvim_set_current_win(y)end end;return c