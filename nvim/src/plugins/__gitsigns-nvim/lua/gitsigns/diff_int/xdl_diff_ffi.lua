local a=require("ffi")a.cdef([[
  typedef struct s_mmbuffer { const char *ptr; long size; } mmbuffer_t;

  typedef struct s_xpparam {
    unsigned long flags;

    // See Documentation/diff-options.txt.
    char **anchors;
    size_t anchors_nr;
  } xpparam_t;

  typedef long (__stdcall *find_func_t)(
    const char *line,
    long line_len,
    char *buffer,
    long buffer_size,
    void *priv
  );

  typedef int (__stdcall *xdl_emit_hunk_consume_func_t)(
    long start_a, long count_a, long start_b, long count_b,
    void *cb_data
  );

  typedef struct s_xdemitconf {
    long ctxlen;
    long interhunkctxlen;
    unsigned long flags;
    find_func_t find_func;
    void *find_func_priv;
    xdl_emit_hunk_consume_func_t hunk_func;
  } xdemitconf_t;

  typedef struct s_xdemitcb {
    void *priv;
    int (__stdcall *outf)(void *, mmbuffer_t *, int);
  } xdemitcb_t;

  int xdl_diff(
    mmbuffer_t *mf1,
    mmbuffer_t *mf2,
    xpparam_t const *xpp,
    xdemitconf_t const *xecfg,
    xdemitcb_t *ecb
  );
]])local function b(c)local d=vim.tbl_isempty(c)and''or table.concat(c,'\n')..'\n'return d,#d end;local function e(f)local g=0;if f=='minimal'then g=1 elseif f=='patience'then g=math.floor(2^14)elseif f=='histogram'then g=math.floor(2^15)end;return g end;local h=a.new('mmbuffer_t')local i=a.new('mmbuffer_t')local j=a.new('xpparam_t')local k=a.new('xdemitcb_t')local function l(m,n,f)h.ptr,h.size=b(m)i.ptr,i.size=b(n)j.flags=e(f)local o={}local p=a.cast('xdl_emit_hunk_consume_func_t',function(q,r,s,t)local u=tonumber(r)local v=tonumber(t)local w=tonumber(q)local x=tonumber(s)if u>0 then w=w+1 end;if v>0 then x=x+1 end;o[#o+1]={w,u,x,v}return 0 end)local y=a.new('xdemitconf_t')y.hunk_func=p;local z=a.C.xdl_diff(h,i,j,y,k)p:free()return z==0 and o end;jit.off(l)return l
