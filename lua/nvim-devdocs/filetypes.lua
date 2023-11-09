local function version_check(cmd, pattern, default)
  pattern = pattern or "%d+%.%d+"
  default = default or string.match(cmd, "%w+")
  local file = io.popen(cmd)
  if file then
    local output = file:read("*a")
    local version = default .. "-" .. string.match(output, pattern)
    file:close()
    return version
  else
    return default
  end
end

local M = {
  ["sh"] = "bash",
  ["lua"] = version_check("lua -v"),
  ["vue"] = "vue-3",
  ["dart"] = "dart-2",
  ["ruby"] = "ruby-3.2",
  ["twig"] = "twig-3",
  ["less"] = "less-4",
  ["scss"] = "sass",
  ["make"] = "gnu_make",
  ["dockerfile"] = "docker",
  ["cjs"] = "node",
  ["mjs"] = "node",
  ["json"] = "jq",
  ["yaml"] = "ansible",
  ["python"] = version_check("python --version"),
  ["javascriptreact"] = "react",
  ["typescriptreact"] = "react",
  ["fish"] = version_check("fish --version"),
}

return M
