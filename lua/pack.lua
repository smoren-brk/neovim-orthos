local M = {}

local function process_plugin(plugin)
  local processed = {}

  -- Handle when plugin is just a string (URL)
  if type(plugin) == "string" then
    processed.url = plugin:match("^https?://") and plugin or "https://github.com/" .. plugin
    return processed
  end

  -- Handle the plugin URL/name (convert from lazy.nvim format)
  local url = nil
  if plugin[1] then
    url = plugin[1]
  elseif plugin.url then
    url = plugin.url
  elseif plugin.src then
    url = plugin.src
  end
  
  if url then
    processed.url = url:match("^https?://") and url or "https://github.com/" .. url
  end

  -- Handle version
  if plugin.version then
    processed.version = plugin.version
  end

  -- Handle opts (will be passed to setup function)
  if plugin.opts then
    processed.opts = plugin.opts
  end

  -- Handle setup function
  if plugin.setup then
    if plugin.setup == true then
      -- Auto-generate setup function from URL
      local module_name = processed.url:match("([^/]+)%.nvim$") or processed.url:match("([^/]+)$")
      if module_name and module_name:match("%.nvim$") then
        module_name = module_name:gsub("%.nvim$", "")
      end
      processed.setup = function(opts)
        if opts then
          require(module_name).setup(opts)
        else
          require(module_name).setup()
        end
      end
    else
      processed.setup = plugin.setup
    end
  end

  return processed
end

local function flatten_dependencies(deps)
  local result = {}

  local function flatten(dep_list)
    for _, dep in ipairs(dep_list) do
      local processed_dep = process_plugin(dep)
      table.insert(result, processed_dep)

      -- Recursively flatten nested dependencies
      if dep.dependencies then
        flatten(dep.dependencies)
      end
    end
  end

  if deps then
    flatten(deps)
  end

  return result
end

function M.setup(plugins)
  local all_plugins = {}

  -- Process each plugin in the input table
  for _, plugin in ipairs(plugins) do
    local processed_plugin = process_plugin(plugin)

    -- Handle dependencies
    if plugin.dependencies then
      local deps = flatten_dependencies(plugin.dependencies)
      for _, dep in ipairs(deps) do
        table.insert(all_plugins, dep)
      end
    end

    table.insert(all_plugins, processed_plugin)
  end

  -- Convert to vim.pack format and add plugins
  local pack_plugins = {}
  for _, plugin in ipairs(all_plugins) do
    local pack_plugin = {
      src = plugin.url,
    }

    if plugin.version then
      pack_plugin.version = plugin.version
    end

    table.insert(pack_plugins, pack_plugin)
  end

  vim.pack.add(pack_plugins)

  -- Handle setup calls after all plugins are added
  for _, plugin in ipairs(all_plugins) do
    if plugin.setup and type(plugin.setup) == "function" then
      if plugin.opts then
        plugin.setup(plugin.opts)
      else
        plugin.setup()
      end
    end
  end
end

return M
