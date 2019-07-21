module LirithApp
  module Systems
    class Render < Lirith::Systems::Base
      getter running = false

      def initialize
      end

      def run
        @running = true
        Lirith::Managers::System.trigger_event(Events::Render::Started)

        while (@running)
          Lirith::Managers::System.trigger_event(Events::Render::StartPaint)

          Lirith::Managers::System.trigger_event(Events::Render::EndPaint)

          Application::CORE.renderer.render(Application::CORE.scene, Application::CORE.camera)
          # LibGL.polygon_mode(LibGL::E_FRONT_AND_BACK, LibGL::E_LINE)
          LibGL.draw_arrays LibGL::E_TRIANGLES, 0, 12*3

          Lirith::Managers::System.trigger_event(Events::Render::FinalizePaint)
        end

        Lirith::Managers::System.trigger_event(Events::Render::Stopped)
      end

      def handle_event(event)
        case event
        when Lirith::Events::Application::Initialized; run
        when Lirith::Events::Application::Exit       ; @running = false
        end
      end
    end
  end
end
