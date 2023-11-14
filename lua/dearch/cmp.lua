local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local kind_icons = {
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = " ",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = " ",
  Misc = " ",
}

cmp.setup {
  mapping = {
	["<C-k>"] = cmp.mapping.select_prev_item(),
	["<C-j>"] = cmp.mapping.select_next_item(),
	["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
	["<C-e>"] = cmp.mapping {
	  i = cmp.mapping.abort(),
	  c = cmp.mapping.close(),
	},
	["<CR>"] = cmp.mapping.confirm { select = true },
	["<Tab>"] = cmp.mapping(function(fallback)
	  if cmp.visible() then
		cmp.select_next_item()
	  else
		fallback()
	  end
	end, {"i", "s",}),
	["<S-Tab>"] = cmp.mapping(function(fallback)
	  if cmp.visible() then
		cmp.select_prev_item()
	  else
		fallback()
	  end
	end, {"i", "s",}),
  },
  formatting = {
	fields = { "kind", "abbr", "menu" },
	format = function(entry, vim_item)
	  -- Kind icons
	  -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
	  vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
	  vim_item.menu = ({
		-- nvim_lsp = "[LSP]",
		buffer = "Buffer",
		path = "Path",
	  })[entry.source.name]
	  return vim_item
	end,
  },
  sources = {
	-- { name = "nvim_lsp" },
	{ name = "buffer" },
	{ name = "path" },
  },
  window = {
	documentation = {
	  border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	},
  },
  experimental = {
	ghost_text = true,
	native_menu = false,
  },
}
