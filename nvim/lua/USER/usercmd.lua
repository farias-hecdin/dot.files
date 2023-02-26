local usercmd = vim.api.nvim_create_user_command -- Create usercommand

-- LongLines
-- TEST: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eleifend, est vitae maximus venenatis, erat lorem sodales lorem, quis lacinia sapien nisl non velit. Proin in massa eget urna malesuada lacinia. Suspendisse sit amet porta enim.
usercmd("LongParagraphs",
  function()
    vim.cmd([[/\%>300v.\+]])
  end,
  {desc = "Highlight long paragraphs"}
)

usercmd("LongLines",
  function()
    vim.cmd([[/\%>120v.\+]])
  end,
  {desc = "Highlight long lines"}
)

-- Calculator
usercmd("Calculator",
  "lua require(\"calculator\").calculate()",
  {["range"]=1, ["nargs"]=0}
)

usercmd("BufferManager",
  "lua require('buffer_manager.ui').toggle_quick_menu()",
  {desc = "BufferManager"}
)
