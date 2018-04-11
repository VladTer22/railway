# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

module ActiveSupport::Inflector
  # does the opposite of humanize ... mostly.
  # Basically does a space-substituting .underscore
  def dehumanize(the_string)
    result = the_string.to_s.dup
    result.downcase.gsub(/ +/,'_')
  end
end

class String
  def dehumanize
    ActiveSupport::Inflector.dehumanize(self)
  end
end