local M = {}

M.search_config = function()
  require("fzf-lua").files({
    prompt = "Config >",
    cwd = "$HOME/.local/share/chezmoi/dot_config/nvim",
  })
end

local repo_directory = "$HOME/repos"
local function get_projects()
  local repo_directories = vim.fs.dir(repo_directory, { depth = 1, type = "directory" })

  local projects = {}
  for name, type in repo_directories do
    if type == "directory" then
      projects[#projects + 1] = vim.fs.normalize(vim.fs.joinpath(repo_directory, name))
    end
  end

  return projects
end

M.switch_project = function()
  local projects = get_projects()

  require("fzf-lua").fzf_exec(projects, {
    prompt = "Projects >",
    actions = {
      ["default"] = function(e)
        local path = e[1]
        vim.cmd.cd(path)
        -- vim.cmd("ProjectRoot '" .. path .. "'")
        vim.cmd("Oil " .. path)
      end,
    },
  })
end

M.search_project_files = function()
  local projects = get_projects()

  require("fzf-lua").fzf_exec(projects, {
    prompt = "Projects >",
    actions = {
      ["default"] = function(e)
        local path = e[1]

        require("fzf-lua").files({
          cwd = path,
        })
      end,
    },
  })
end

return M
