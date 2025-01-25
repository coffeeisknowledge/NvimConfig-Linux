local jdtls_dir = vim.fn.stdpath "data" .. "/mason/packages/jdtls"
local config_dir = jdtls_dir .. "/config_linux"
local plugins_dir = jdtls_dir .. "/plugins/"
local path_to_jar = plugins_dir .. "org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar"
local path_to_lombok = jdtls_dir .. "/lombok.jar"


local springboot_nvim = require("springboot-nvim")

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

local cmp_nvim_lsp = require('cmp_nvim_lsp')
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)

local jdtls = require("jdtls")

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace_root/" .. project_name
if vim.fn.isdirectory(workspace_dir) == 0 then
  vim.fn.mkdir(workspace_dir, "p")
end

local config = {
  capabilities = capabilities,
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. path_to_lombok,
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    path_to_jar,
    "-configuration",
    config_dir,
    "-data",
    workspace_dir,
  },

  root_dir = root_dir,
  settings = {
    java = {
      autobuild = { enabled = false },
      project = {
        encoding = "UTF-8",
      },
      foldingRange = { enabled = true },
      selectionRange = { enabled = true },
      saveActions = {
        organizeImports = true,
      },
      import = {
        gradle = { enabled = true },
        maven = { enabled = true },
        exclusions = {
          "**/node_modules/**",
          "**/.metadata/**",
          "**/archetype-resources/**",
          "**/META-INF/maven/**",
          "**/.git/**",
        },
      },
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      maven = {
        downloadSources = true,
        updateSnapshots = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayhints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      -- format = {
        -- enabled = true,
        -- settings = {
        --   url = "file:///C:/Users/abela/AppData/Local/nvim/lua/configs/lang-servers/intellij-java-google-style.xml",
        --   -- url = "file://" .. vim.fn.stdpath("config"):gsub("\\", "/") .. "/lua/configs/lang-servers/intellij-java-google-style.xml",
        --   profile = "GoogleStyle",
        -- },
      -- },
      completion = {
        favoriteStaticMembers = {
          "org.junit.Assert.*",
          "org.junit.Assume.*",
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "org.junit.jupiter.api.Assumptions.*",
          "org.junit.jupiter.api.DynamicContainer.*",
          "org.junit.jupiter.api.DynamicTest.*",
          "org.assertj.core.api.Assertions.assertThat",
          "org.assertj.core.api.Assertions.assertThatThrownBy",
          "org.assertj.core.api.Assertions.assertThatExceptionOfType",
          "org.assertj.core.api.Assertions.catchThrowable",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
        importOrder = {
          "java",
          "jakarta",
          "javax",
          "com",
          "org",
        },
      },
      contentProvider = { preferred = "fernflower" },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
    },
  },
  init_options = {
    bundles = {},
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
  },
}

vim.list_extend(config.init_options.bundles, require("spring_boot").java_extensions())


config["on_attach"] = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<A-o>", jdtls.organize_imports, bufopts)

  -- springboot commands - emacgill
  vim.keymap.set("n", "<leader>jc", springboot_nvim.generate_class, { desc = "[J]ava Create [C]lass" })
  vim.keymap.set("n", "<leader>ji", springboot_nvim.generate_interface, { desc = "[J]ava Create [I]nterface" })
  vim.keymap.set("n", "<leader>je", springboot_nvim.generate_enum, { desc = "[J]ava Create [E]num" })
  vim.keymap.set("n", "<leader>jr", springboot_nvim.generate_record, { desc = "[J]ava Create [R]ecord" })

  -- jdtls.setup.add_commands()
  vim.lsp.codelens.refresh()

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.java" },
    callback = function()
      local _, _ = pcall(vim.lsp.codelens.refresh)
    end,
  })
end

jdtls.start_or_attach(config)
