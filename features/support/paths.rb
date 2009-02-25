def path_to(page_name)
  case page_name

  when /homepage/i
    root_path

  # Add more page name => path mappings here
  when /show items/i
    "/items"

  else
    raise "Can't find mapping from \"#{page_name}\" to a path."
  end
end
