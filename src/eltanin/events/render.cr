# module Lirith
#  module Application
#    module Events
#      struct RenderAction < Lirith::Events::Base
#        getter action : Systems::Render::Event
#
#        def initialize(@action)
#        end
#      end
#    end
#  end
# end
require "./render/*"
