module LirithApp
    module Events
      struct RenderAction < Core::Events::Base
        getter action : Systems::Render::Event

        def initialize(@action)
        end
      end
    end
end
