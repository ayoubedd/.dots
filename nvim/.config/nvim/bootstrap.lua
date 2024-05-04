local function extend_path(modules_list)
  package.path = package.path .. ";" .. vim.fn.stdpath("config") .. '/?/init.lua'

  local new = package.path;

  for _, name in pairs(modules_list) do
    new = new .. ";" .. vim.fn.stdpath("config") .. '/' .. name .. '/?.lua'
  end

  package.path = new;
end

extend_path(Config.modules);
