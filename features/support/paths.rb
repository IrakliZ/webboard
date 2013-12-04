module NavigationHelpers
  # Maps a name to a path. Used by the
  # When /^I go to (.+)$/ do |page_name|

  def path_to(page_name)
    case page_name
    when /^homepage$/ then '/'
    when /^sign-up$/ then '/signup'
    when /^sign-out$/ then '/signout'

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find path"
      end
    end
  end
end

World(NavigationHelpers)
