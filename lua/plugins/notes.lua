-- plugins for notetaking and knowledge management

return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    enabled = true,
    lazy = false,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      --  PERSONAL MENU (<leader>np...)
      { "<leader>npd", ":Obsidian workspace Personal<cr>:Obsidian today<cr>", desc = "[P]ersonal: [d]aily" },
      { "<leader>npy", ":Obsidian workspace Personal<cr>:Obsidian yesterday<cr>", desc = "[P]ersonal: [y]esterday" },
      { "<leader>npt", ":Obsidian workspace Personal<cr>:Obsidian tomorrow<cr>", desc = "[P]ersonal: [t]omorrow" },
      { "<leader>npn", ":Obsidian workspace Personal<cr>:Obsidian new<cr>", desc = "[P]ersonal: [n]ew" },
      {
        "<leader>npN",
        ":Obsidian workspace Personal<cr>:Obsidian new_from_template<cr>",
        desc = "[P]ersonal: [N]ew from template",
      },
      { "<leader>nps", ":Obsidian workspace Personal<cr>:Obsidian search<cr>", desc = "[P]ersonal: [s]earch" },
      { "<leader>npT", ":e ~/Documents/Personal/readme.md<cr>", desc = "[P]ersonal: [T]odo" },

      -- WORK MENU (<leader>nw...)
      { "<leader>nwd", ":Obsidian workspace Work<cr>:Obsidian today<cr>", desc = "[W]ork: [d]aily" },
      { "<leader>nwy", ":Obsidian workspace Work<cr>:Obsidian yesterday<cr>", desc = "[W]ork: [y]esterday" },
      { "<leader>nwt", ":Obsidian workspace Work<cr>:Obsidian tomorrow<cr>", desc = "[W]ork: [t]omorrow" },
      { "<leader>nwn", ":Obsidian workspace Work<cr>:Obsidian new<cr>", desc = "[W]ork: [n]ew" },
      {
        "<leader>nwN",
        ":Obsidian workspace Work<cr>:Obsidian new_from_template<cr>",
        desc = "[W]ork: [N]ew from template",
      },
      { "<leader>nws", ":Obsidian workspace Work<cr>:Obsidian search<cr>", desc = "[W]ork: [s]earch" },
      { "<leader>nwT", ":e ~/Documents/Work/readme.md<cr>", desc = "[W]ork: [T]odo" },

      -- UTILITIES (Context Aware)
      { "<leader>nl", ":Obsidian links<cr>", desc = "Link selection" },
      { "<leader>nf", ":Obsidian follow_links<cr>", desc = "Follow link" },
      { "<leader>nb", ":Obsidian backlink<cr>", desc = "Backlinks" },
      { "<leader>nO", ":Obsidian open<cr>", desc = "Open in App" },
      { "<leader>ni", ":Obsidian paste_img<cr>", desc = "[I]mage image" },
      { "<leader>nr", ":Obsidian rename<cr>", desc = "[R]ename note" },
    },
    opts = {
      legacy_commands = false,
      ui = {
        -- checkboxes = { [' '] = {}, ['x'] = {} },
        enable = false,
      },
      workspaces = {
        {
          name = "Personal",
          path = "~/Documents/Personal",
        },
        {
          name = "Work",
          path = "~/Documents/Work",
        },
      },
      -- Optional, for templates (see below).
      templates = {
        folder = "Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "Dailies",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = "%B %-d, %Y",
        -- Optional, default tags to add to each new daily note created.
        default_tags = { "daily-notes" },
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = "template-daily.md",
      },
      -- Optional, customize how names/IDs for new notes are created.
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,
    },
  },
}
