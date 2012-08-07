include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo

def generate_atom_feed
  @items << ::Nanoc3::Item.new(
    %{<%= atom_feed :title => "Michelle Amanda", :articles => @items, :limit => 200 %>},
    {
      :posts => @items,
      :title => "Michelle Amanda"
    },
    "/feed"
  )
end

module Nanoc::Extra::TimeExtensions
            
  # Returns a string with the time in an ISO-8601 time format...
  # But so that it works in Google Reader, etc.
  def to_iso8601_time
    self.gmtime.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end
      
end
      
class Time
  include Nanoc::Extra::TimeExtensions
end
