local a=vim.api;local b=vim.o;local c=vim.loop;local d=vim.cmd;local e=vim.fn;local f=vim.schedule;local g=math.min;local h=math.max;local i=math.floor;local j,k,l,m,n,o,p,q;local r={win=a.nvim_get_current_win(),buf=a.nvim_get_current_buf()}local s={explorer={},picker={}}local t={builtin={}}local u=e.tempname().."-picker"local v=e.tempname().."-explorer"local w=os.getenv("NNN_OPTS")local x=os.getenv("NNN_TMPFILE")or(os.getenv("XDG_CONFIG_HOME")or os.getenv("HOME").."/.config").."/nnn/.lastd"local y=os.getenv("TMPDIR")or"/tmp"local z=os.getenv("TERM")local A=w and w:gsub("a","")or""local B={explorer={cmd="nnn",width=24,side="topleft",session="",tabs=true,fullscreen=true},picker={cmd="nnn",style={width=0.9,height=0.8,xoffset=0.5,yoffset=0.5,border="single"},session="",fullscreen=true},auto_open={setup=nil,tabpage=nil,empty=false,ft_ignore={"gitcommit"}},auto_close=false,replace_netrw=nil,mappings={},windownav={left="<C-w>h",right="<C-w>l",next="<C-w>w",prev="<C-w>W"},buflisted=false,quitcd=nil,offset=false}local C={number=false,relativenumber=false,wrap=false,winfixwidth=true,winfixheight=true,winhighlight="Normal:NnnNormal,NormalNC:NnnNormalNC,FloatBorder:NnnBorder"}local function D(E,F)if a.nvim_win_get_buf(s[E][F].win)~=s[E][F].buf then a.nvim_win_set_buf(s[E][F].win,s[E][F].buf)return end;if#a.nvim_tabpage_list_wins(0)==1 then a.nvim_win_set_buf(s[E][F].win,a.nvim_create_buf(false,false))else a.nvim_win_hide(s[E][F].win)end;s[E][F].win=nil;if r.win then a.nvim_set_current_win(r.win)end end;local function G(H,E,F)local I={}local J,K;local L,M=pcall(a.nvim_win_get_tabpage,r.win)if not r.win or M~=a.nvim_get_current_tabpage()then r.win=nil;for L,N in pairs(a.nvim_tabpage_list_wins(0))do if a.nvim_buf_get_name(a.nvim_win_get_buf(N))==""then J=N;break end;if a.nvim_buf_get_option(0,"filetype")~="nnn"then K=N end end;if not J and not K then d(m..b.columns-B.explorer.width-1 .."vsplit")r.win=a.nvim_get_current_win()end end;a.nvim_set_current_win(r.win or J or K)for O in H do if j then I[#I+1]=e.fnameescape(O)else pcall(d,"edit "..e.fnameescape(O))end end;if E=="explorer"and s[E][F].fs then a.nvim_win_close(s[E][F].win,{force=true})t.toggle("explorer",false,false)d("vert resize +1 | vert resize -1 | wincmd p")end;if j then f(function()j(I)j=nil end)end end;local function P()local F=B.explorer.tabs and a.nvim_get_current_tabpage()c.fs_open(v,"r+",438,function(Q,R)if Q then f(function()print(Q)end)else local S=c.new_pipe(false)S:open(R)S:read_start(function(T,U)if not T and U then f(function()G(U:gmatch("[^\n]+"),"explorer",F)end)else S:close()end end)end end)end;local function V(W,X)local Y=c.fs_stat(W)return Y and Y.type==X end;local function Z(_,a0)local a1,N;local E=s.picker[1]and s.picker[1].id==_ and"picker"or"explorer"if E=="picker"then a1=1;N=s.picker[1].win else for F,a2 in pairs(s.explorer)do if a2.id==_ then a1=F;N=a2.win;break end end end;if not a1 then return end;s[E][a1]={}if a0>0 then f(function()print(k and k[1]:sub(1,-2))end)else if B.quitcd then local R,L=io.open(x,"r")if R then d(B.quitcd..e.fnameescape(R:read():sub(5,-2)))R:close()os.remove(x)end end;if a.nvim_win_is_valid(N)then if#a.nvim_tabpage_list_wins(0)==1 then d("split")end;a.nvim_win_hide(N)local a3=a.nvim_list_bufs()if a.nvim_buf_get_name(a3[#a3])==""then a.nvim_buf_delete(a3[#a3],{})end end;if E=="picker"and V(u,"file")then G(io.lines(u),"picker",1)end end;if r then a.nvim_set_current_win(r.win)end end;local function a4(L,a5,L)k=a5 end;local function a6(a7)a.nvim_feedkeys(a.nvim_replace_termcodes(a7,true,true,true),"n",true)end;local function a8()for a9,aa in pairs(n)do a.nvim_buf_set_option(0,a9,aa)end;for ab,ac in ipairs(B.mappings)do a.nvim_buf_set_keymap(0,"t",ac[1],"<C-\\><C-n><cmd>lua require('nnn').handle_mapping("..ab..")<CR>",{})end;a.nvim_buf_set_keymap(0,"t",B.windownav.left,"<C-\\><C-n><C-w>h",{})a.nvim_buf_set_keymap(0,"t",B.windownav.right,"<C-\\><C-n><C-w>l",{})a.nvim_buf_set_keymap(0,"t",B.windownav.next,"<C-\\><C-n><C-w>w",{})a.nvim_buf_set_keymap(0,"t",B.windownav.prev,"<C-\\><C-n><C-w>W",{})end;local function ad(N,ae)a.nvim_win_call(N,function()d(a.nvim_buf_is_valid(r.buf)and r.buf~=ae and r.buf.."buffer"or"enew")end)end;local function af(ag)local ah=b.lines;local ai=b.columns;local aj={relative="editor",style="minimal",height=ah,width=ai,row=0,col=0}local ak=B.picker.style;if not ag then aj.height=g(h(0,i(ak.height>1 and ak.height or ah*ak.height)),ah)-1;aj.width=g(h(0,i(ak.width>1 and ak.width or ai*ak.width)),ai)-1;local al=i(ak.yoffset>1 and ak.yoffset or ak.yoffset*(ah-aj.height))-1;local am=i(ak.xoffset>1 and ak.xoffset or ak.xoffset*(ai-aj.width))-1;aj.row=g(h(0,al),ah-aj.height)aj.col=g(h(0,am),ai-aj.width)aj.border=B.picker.style.border end;if B.offset then local O=io.open(y.."/nnn-preview-tui-posoffset","w")if O then O:write(aj.col+1 .." "..aj.row+1 .."\n")O:close()end end;return aj end;local function an(E,F,ao,ag)local ae=s[E][F]and s[E][F].buf;local ap=not ae;local N,aj;if E=="picker"or ag then if ap then ae=ao and a.nvim_get_current_buf()or a.nvim_create_buf(true,false)end;aj=af(ag)N=a.nvim_open_win(ae,true,aj)else if ap then d(B.explorer.side.." "..B.explorer.width..(ao and"vsplit"or"vnew"))ae=a.nvim_get_current_buf()else d(B.explorer.side.." "..B.explorer.width.."vsplit")end;N=a.nvim_get_current_win()end;return N,ae,ap end;local function aq(E,F,ao,J)local _=s[E][F]and s[E][F].id;local ar=a.nvim_get_current_win()local as=B[E].fullscreen and#a.nvim_tabpage_list_wins(0)==1 and J;local N,ae,ap=an(E,F,ao,as)if ap then local at=q and q or B[E].cmd;_=e.termopen(at..l,{env=E=="picker"and{TERM=z}or{TERM=z,NNN_OPTS=A,NNN_FIFO=v},on_exit=Z,on_stdout=a4,stdout_buffered=true})q=nil;a8()if E=="explorer"then P()end else a.nvim_win_set_buf(N,ae)end;for a9,aa in pairs(C)do a.nvim_win_set_option(0,a9,aa)end;s[E][F]={win=N,buf=ae,id=_,fs=as}d("startinsert")if ao then ad(ar,ae)end end;function t.toggle(E,au,av)local aw;local ax=a.nvim_buf_get_name(0)local ao=V(ax,"directory")local J=(ao and e.bufname("#")or ax)==""local F=E=="explorer"and B.explorer.tabs and a.nvim_get_current_tabpage()or 1;if au then for L,ay in ipairs(au)do if ay:find("^cmd=")then q=ay:sub(5)..(E=="picker"and" -p "..u..o or" -F1 "..p)else aw=ay end end end;if av=="netrw"then if not ao then return end;if s[E][F]and s[E][F].buf then a.nvim_buf_delete(s[E][F].buf,{force=true})s[E][F]={}end elseif(av=="setup"or av=="tab")and(B.auto_open.empty and(not J and not ao)or vim.tbl_contains(B.auto_open.ft_ignore,a.nvim_buf_get_option(0,"filetype")))then return end;l=" "..e.shellescape(aw and e.expand(aw)or ao and ax or e.getcwd()).." "local N=s[E][F]and s[E][F].win;N=B.explorer.tabs and N or vim.tbl_contains(a.nvim_tabpage_list_wins(0),N)if N and a.nvim_win_is_valid(N)then D(E,F)else aq(E,F,ao,J)end end;function t.handle_mapping(az)j=B.mappings[az][2]a6("i<CR>")end;function t.win_enter()f(function()if a.nvim_buf_get_option(a.nvim_win_get_buf(0),"filetype")~="nnn"then r.win=a.nvim_get_current_win()r.buf=a.nvim_get_current_buf()elseif#a.nvim_tabpage_list_wins(0)==1 then r.win=nil end end)end;function t.win_closed()if a.nvim_win_get_config(0).zindex then return end;f(function()if a.nvim_buf_get_option(0,"filetype")~="nnn"then return end;local aA=0;for L,N in ipairs(a.nvim_tabpage_list_wins(0))do if not a.nvim_win_get_config(N).zindex then aA=aA+1 end end;if aA==1 then a6("<C-\\><C-n><cmd>q<CR>")end end)end;function t.tab_closed(F)local ae=s.explorer[F]and s.explorer[F].buf;if ae and a.nvim_buf_is_valid(ae)then a.nvim_buf_delete(ae,{force=true})end end;function t.vim_resized()local N=s and s.picker and s.picker[1].win;if N then a.nvim_win_set_config(N,af())end end;local function aB(I,aC)for L,O in ipairs(I)do d(aC.." "..O)end end;function t.builtin.open_in_split(I)aB(I,"split")end;function t.builtin.open_in_vsplit(I)aB(I,"vsplit")end;function t.builtin.open_in_tab(I)d("tabnew")aB(I,"edit")a6("<C-\\><C-n><C-w>h")end;function t.builtin.open_in_preview(I)local aD=a.nvim_get_current_buf()local aE=a.nvim_buf_get_name(aD)if aE==I[1]then return end;d("edit "..I[1])if aE~=""then a.nvim_buf_delete(aD,{})end;d("wincmd p")end;function t.builtin.copy_to_clipboard(I)I=table.concat(I,"\n")e.setreg("+",I)vim.defer_fn(function()print(I:gsub("\n",", ").." copied to register")end,0)end;function t.builtin.cd_to_path(I)local aw=I[1]:match(".*/"):sub(0,-2)local aF=io.open(aw:gsub("\\",""),"r")if aF~=nil then io.close(aF)e.execute("cd "..aw)vim.defer_fn(function()print("working directory changed to: "..aw)end,0)end end;function t.builtin.populate_cmdline(I)a6(": "..table.concat(I,"\n"):gsub("\n"," ").."<C-b>")end;function t.setup(aG)if aG then B=vim.tbl_deep_extend("force",B,aG)end;n={buftype="terminal",filetype="nnn",buflisted=B.buflisted}if B.replace_netrw then vim.g.loaded_netrw=1;vim.g.loaded_netrwPlugin=1;vim.g.loaded_netrwSettings=1;vim.g.loaded_netrwFileHandlers=1;pcall(a.nvim_clear_autocmds,{group="FileExplorer"})f(function()t.toggle(B.replace_netrw,nil,"netrw")a.nvim_create_autocmd({"BufEnter","BufNewFile"},{callback=function()require("nnn").toggle(B.replace_netrw,nil,"netrw")end})end)end;local aH=os.getenv("XDG_CONFIG_HOME")aH=(aH and aH or os.getenv("HOME").."/.config").."/nnn/sessions/nnn.nvim-"..os.date("%Y-%m-%d_%H-%M-%S")if B.picker.session=="shared"or B.explorer.session=="shared"then o=" -S -s "..aH;p=o;a.nvim_create_autocmd("VimLeavePre",{command="call delete(fnameescape('"..aH.."'))"})else if B.picker.session=="global"then o=" -S "elseif B.picker.session=="local"then o=" -S -s "..aH.."-picker "a.nvim_create_autocmd("VimLeavePre",{command="call delete(fnameescape('"..aH.."-picker'))"})else o=" "end;if B.explorer.session=="global"then p=" -S "elseif B.explorer.session=="local"then p=" -S -s "..aH.."-explorer "a.nvim_create_autocmd("VimLeavePre",{command="call delete(fnameescape('"..aH.."-explorer'))"})else p=" "end end;if not V(v,"fifo")then os.execute("mkfifo "..v)end;m=B.explorer.side:match("to")and"botright "or"topleft "B.picker.cmd=B.picker.cmd.." -p "..u..o;B.explorer.cmd=B.explorer.cmd.." -F1 "..p;if B.auto_open.setup and not(B.replace_netrw and V(a.nvim_buf_get_name(0),"directory"))then f(function()t.toggle(B.auto_open.setup,nil,"setup")end)end;if B.auto_close then a.nvim_create_autocmd("WinClosed",{callback=function()require("nnn").win_closed()end})end;if B.auto_open.tabpage then a.nvim_create_autocmd("TabNewEntered",{callback=function()vim.schedule(function()require("nnn").toggle(B.auto_open.tabpage,nil,"tab")end)end})end;a.nvim_create_user_command("NnnPicker",function(aI)require("nnn").toggle("picker",aI.fargs)end,{nargs="*"})a.nvim_create_user_command("NnnExplorer",function(aI)require("nnn").toggle("explorer",aI.fargs)end,{nargs="*"})local aJ=a.nvim_create_augroup("nnn",{clear=true})a.nvim_create_autocmd("WinEnter",{group=aJ,callback=function()require("nnn").win_enter()end})a.nvim_create_autocmd("TermClose",{group=aJ,callback=function()if a.nvim_buf_get_option(0,"filetype")=="nnn"then a.nvim_buf_delete(0,{force=true})end end})a.nvim_create_autocmd("BufEnter",{group=aJ,callback=function()if a.nvim_buf_get_option(0,"filetype")=="nnn"then vim.cmd("startinsert")end end})a.nvim_create_autocmd("VimResized",{group=aJ,callback=function()if a.nvim_buf_get_option(0,"filetype")=="nnn"then require("nnn").vim_resized()end end})a.nvim_create_autocmd("TabClosed",{group=aJ,callback=function(aK)require("nnn").tab_closed(tonumber(aK.file))end})a.nvim_set_hl(0,"NnnBorder",{link="FloatBorder",default=true})a.nvim_set_hl(0,"NnnNormal",{link="Normal",default=true})a.nvim_set_hl(0,"NnnNormalNC",{link="Normal",default=true})end;return t