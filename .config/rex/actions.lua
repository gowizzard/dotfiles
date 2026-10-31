local terminal = "com.superlogical.terminal"

rex.action{
  name = "close_pane_or_tab",
  title = "Close Pane or Empty Tab",
  description = "Close the focused pane, or the whole tab when it is the last pane.",
  category = "Panes",
  run = function(ctx, args)
    if ctx.block_id == nil then error("no focused pane", 0) end
    local _, err = rex.call("block.close", { session_id = ctx.session_id, block_id = ctx.block_id })
    if err ~= nil then error(err, 0) end
  end,
}

local function split_lines(text)
  local lines = {}
  for line in (text .. "\n"):gmatch("(.-)\n") do
    lines[#lines + 1] = line
  end
  return lines
end

local function last_output(text, with_command)
  local lines = split_lines(text)
  local current = #lines
  while current > 0 and lines[current] == "" do
    current = current - 1
  end
  if current == 0 then error("the pane is empty", 0) end

  local marker = lines[current]:match("^(%S+)")
  local previous
  for i = current - 1, 1, -1 do
    if lines[i]:sub(1, #marker + 1) == marker .. " " then
      previous = i
      break
    end
  end
  if previous == nil then error("no previous command in this pane", 0) end

  local first, last = previous + (with_command and 0 or 1), current - 1
  while last >= first and lines[last] == "" do
    last = last - 1
  end
  if last < first then error("the last command printed nothing", 0) end
  return table.concat(lines, "\n", first, last)
end

rex.action{
  name = "copy_last_output",
  title = "Copy Last Command Output",
  description = "Copy the output of the previous command to the clipboard.",
  category = "Terminal",
  keywords = "clipboard pbcopy output",
  args = { command = "boolean?" },
  run = function(ctx, args)
    local screen, err = rex.block.call(terminal, "format", {
      block_id = ctx.block_id,
      format = "text",
      trim = true,
      unwrap = true,
    })
    if err ~= nil then error(err, 0) end
    local output = last_output(screen.content, args.command)
    local r, exec_err = rex.exec({ "pbcopy" }, { stdin = output, env = { LC_CTYPE = "UTF-8" } })
    if r == nil then error(exec_err, 0) end
    if not r.ok then error("pbcopy failed: " .. r.stderr, 0) end
  end,
}
