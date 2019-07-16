module LirithApp
  module Systems
    class Window < Lirith::Systems::Base
      def initialize
      end

      def shut_down
        LibGLFW.terminate
        Lirith::Managers::System.trigger_event(LirithApp::Events::Window::Closed)

        true
      end

      def update
        LibGLFW.poll_events
      end

      def swap_buffers
        Application::CORE.window.swap_buffers
        # @window.swap_buffers
      end

      def handle_event(event)
        case event
        when Events::Render::StartPaint   ; update
        when Events::Render::FinalizePaint; swap_buffers
        when Events::Render::Stopped      ; shut_down
        end
      end
    end
  end
end
