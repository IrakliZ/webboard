def page_title(page_title)
  main_title = "Webboard"
  if page_title.empty?
    main_title
  else
    "#{main_title} | #{page_title}"
  end
end