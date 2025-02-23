return {
  "saghen/blink.cmp",
  -- this config is to allow code companion to work
  tag = "v0.12.2",
  opts = function(_, opts)
    opts.completion.accept.dot_repeat = false
  end,
}
