def path_norm(path_o)
  # Handle absolute paths (beginning with '/') as a special case
  abs_path=false
  if path_o[0] == '/'
    abs_path=true
    # Remove initial slash (will add back in later)
    path_o = path_o.last path_o.length-1
  end
  path_n = Array.new

  for el in path_o.split('/')
    if (el == '..' and path_n.length>0)
      # If there is a parent directory in the input path, remove it
      path_n.delete_at(-1)
    elsif (el != '.' and el != '..')
      # Never return normalized paths with '.' or '..'
      path_n << el
    end
  end

  # Rejoin words separated by slashes
  str_n = path_n.join('/')

  # If input was an absolute path, add the initial slash back in
  if (abs_path)
    str_n.insert(0,'/')
  end

  return str_n
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.length==1
    puts path_norm(ARGV[0])
  end
end
