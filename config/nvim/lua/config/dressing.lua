local called, dressing = pcall(require, "dressing")
if not called then
  return
end

dressing.setup()
