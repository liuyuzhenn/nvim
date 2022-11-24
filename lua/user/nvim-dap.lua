local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.require('dap')
dap.adapters.python = {
  type = 'executable';
  command = os.getenv("VIRTUAL_ENV") .. "/bin/python";
  args = { '-m', 'debugpy.adapter' };
}
