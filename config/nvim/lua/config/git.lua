local git_ok, git = pcall(require, "git")
if not git_ok then
  vim.notify("'git' not found", "warn")
  return
end

git.setup({
  target_branch = "main",
})
