module LirithApp
  module Systems
    class Render < Lirith::Systems::Base
      getter running = false

      def initialize
      end

      def start
        @running = true
        Lirith::Managers::System.trigger_event(Events::Render::Started)
      end

      def stop
        @running = false
        Lirith::Managers::System.trigger_event(Events::Render::Stopped)
      end

      def render
        return unless @running

        Lirith::Managers::System.trigger_event(Events::Render::StartPaint)

        Lirith::Managers::System.trigger_event(Events::Render::EndPaint)

        Application::CORE.renderer.render(Application::CORE.scene, Application::CORE.camera)
        # LibGL.polygon_mode(LibGL::E_FRONT_AND_BACK, LibGL::E_LINE)
        LibGL.draw_arrays LibGL::E_TRIANGLES, 0, 12*3

        Lirith::Managers::System.trigger_event(Events::Render::FinalizePaint)

        Lirith::Managers::System.trigger_event(Events::Render::Finalized)
      end

      def handle_event(event)
        case event
        when Lirith::Events::Application::Initialized; (start && render)
        when Events::Render::Finalized               ; render
        when Lirith::Events::Application::Exit       ; stop
        end
      end
    end
  end
end
