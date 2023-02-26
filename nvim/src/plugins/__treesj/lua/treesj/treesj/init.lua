local a=require('treesj.utils')local b=require('treesj.treesj.utils')local c={}c.__index=c;function c.new(d,e)local f=e and e:root():preset()or nil;local g=type(d)=='userdata'local h=g and a.has_node_to_format(d,f)or false;local i=g and a.get_self_preset(d)or nil;local j=g and a.get_node_text(d)or''local k=g and b.get_observed_range(d)or{d:range()}local l;if not e then l=vim.fn.indent(k[1]+1)end;return setmetatable({_root=not e,_tsnode=d,_imitator=not g,_parent=e,_prev=nil,_next=nil,_preset=i,_text=j,_has_node_to_format=h,_children={},_observed_range=k,_root_indent=l},c)end;function c:build_tree()local m=a.collect_children(self:tsnode(),a.skip_empty_nodes)local n;if self:non_bracket()then b.add_first_last_imitator(self:tsnode(),m)end;for _,o in ipairs(m)do local p=c.new(o,self)p:_set_prev(n)if p:prev()then p:prev():_set_next(p)end;if not p:is_ignore('split')and p:has_preset()then local q=vim.fn.shiftwidth()p._root_indent=p:get_prev_indent()+q end;if o:type()~='imitator'then p:build_tree()end;table.insert(self._children,p)n=p end end;function c:non_bracket()return self:has_preset()and a.get_nested_key_value(self:preset(),'non_bracket_node')or false end;function c:get_prev_indent()if self:parent():has_preset()and not self:parent():is_ignore('split')then return self:parent()._root_indent end;if self:parent()then return self:parent():get_prev_indent()end end;function c:child(r)return self._children[r]end;function c:root()return self._root and self or self:parent():root()end;function c:join()if self:has_preset()or self:has_to_format()then local s=self:root()if self:has_to_format()and s:preset('join').recursive then for o in self:iter_children()do if not o:is_ignore('join')then o:join()end end end;self:_update_text(b._join(self))end end;function c:split()if self:has_preset()or self:has_to_format()then local s=self:root()if self:has_to_format()and s:preset('split').recursive then for o in self:iter_children()do if not o:is_ignore('split')then o:split()end end end;self:_update_text(vim.tbl_flatten(b._split(self)))end end;function c:is_ignore(t)local u=self:root():preset(t)return u and vim.tbl_contains(u.recursive_ignore,self:type())or false end;function c:tsnode()return self._tsnode end;function c:parent()return self._parent end;function c:prev()return self._prev end;function c:next()return self._next end;function c:_set_prev(v)self._prev=v end;function c:_set_next(v)self._next=v end;function c:type()return self._tsnode:type()end;function c:range()if self:non_bracket()then local w,x,y,z;w,x=self:child(1):tsnode():range()_,_,y,z=self:child(#self._children):tsnode():range()return{w,x,y,z}end;return{self._tsnode:range()}end;function c:o_range()return self._observed_range end;function c:text()return self._text end;function c:_update_text(A)self._text=A end;function c:has_to_format()return self._has_node_to_format end;function c:preset(t)if self:has_preset()then return t and self._preset[t]or self._preset end;return nil end;function c:parent_preset(t)local e=self:parent()if e and e:has_preset()then return t and e:preset(t)or e:preset()end;return nil end;function c:has_preset()return a.tobool(self._preset)end;function c:is_first()return not a.tobool(self:prev())end;function c:is_last()return not a.tobool(self:next())end;function c:is_framing()return self:is_last()or self:is_first()end;function c:is_omit()local B=a.get_nested_key_value(self:parent_preset(),'omit')return B and a.check_match(B,self)or false end;function c:is_imitator()return self._imitator end;function c:get_lines()local j=self:text()return type(j)=='table'and j or{j}end;function c:iter_children()local r=0;local function C(D)r=r+1;return D[r]end;return C,self._children end;return c