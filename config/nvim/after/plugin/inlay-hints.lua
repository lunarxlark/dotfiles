local present, ih = pcall(require, "inlay-hints")
if not present then
  return
end

ih.setup()
