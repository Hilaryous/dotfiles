require('plugins')
require('settings')
require('mappings')

-- Function to safely load modules
local function load_module(module_name)
    local ok, mod = pcall(require, module_name)
    if not ok then
        print("Error loading module '" .. module_name .. "':")
        print(mod)  -- Print the error message
        return nil
    end
    return mod
end

-- Load modules with error handling
load_module('plugins')
load_module('settings')
load_module('mappings')
