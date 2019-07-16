module LirithApp
  module Systems
    class Input < Lirith::Systems::Base
      def handle_key_press(key)
        case key
        when Lirith::Input::Keys::KeyGraveAccent; Lirith::Managers::System.trigger_event(Events::Console::RequestCommand)
        when Lirith::Input::Keys::KeyEscape     ; Lirith::Managers::System.trigger_event(Lirith::Events::Application::Exit)
        when Lirith::Input::Keys::W             ; Application::CORE.camera.position.z -= 0.1
        when Lirith::Input::Keys::A             ; Application::CORE.camera.position.x -= 0.1
        when Lirith::Input::Keys::S             ; Application::CORE.camera.position.z += 0.1
        when Lirith::Input::Keys::D             ; Application::CORE.camera.position.x += 0.1
        end
      end

      def handle_event(event)
        case event
        when Lirith::Events::Input::KeyPressed; handle_key_press(event.key)
        end
      end
    end
  end
end
