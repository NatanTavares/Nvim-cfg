local function format_time(output)
  local hours, minutes = 0, 0

  hours = output:match("(%d+)%s*hr")
  minutes = output:match("(%d+)%s*min")

  hours = tonumber(hours) or 0
  minutes = tonumber(minutes) or 0

  local total_minutes = hours * 60 + minutes
  local formatted_time = string.format("%d:%02d", math.floor(total_minutes / 60), total_minutes % 60)

  return formatted_time
end

local function wakatime_activity()
  local file_path = os.getenv("HOME") .. "/.wakatime_activity"
  local file = io.open(file_path, "r")

  if file then
    local result = file:read("*a")
    file:close()

    return format_time(result:gsub("[^%g%s]", ""))
  else
    return "⚠︎"
  end
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
      },
      sections = {
        lualine_x = {
          wakatime_activity,
          "enconding",
          "fileformat",
          "filetype",
        },
      },
    })
  end,
}
