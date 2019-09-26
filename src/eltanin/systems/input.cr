module Eltanin
  module Systems
    class Input < Lirith::Systems::Base
      @move_forward = false
      @move_backward = false
      @move_left = false
      @move_right = false
      @move_up = false
      @move_down = false

      @translate_left = false
      @translate_right = false

      def handle_key_press(key)
        case key
        when Lirith::Input::Keys::KeyGraveAccent; Lirith::Managers::System.trigger_event(Lirith::Events::Console::RequestCommand)
        when Lirith::Input::Keys::KeyEscape     ; Lirith::Managers::System.trigger_event(Lirith::Events::Application::Exit)
        when Lirith::Input::Keys::W             ; @move_forward = true
        when Lirith::Input::Keys::A             ; @move_left = true
        when Lirith::Input::Keys::S             ; @move_backward = true
        when Lirith::Input::Keys::D             ; @move_right = true
        when Lirith::Input::Keys::LeftShift     ; @move_up = true
        when Lirith::Input::Keys::LeftControl   ; @move_down = true
        when Lirith::Input::Keys::Q             ; @translate_left = true
        when Lirith::Input::Keys::E             ; @translate_right = true
        when Lirith::Input::Keys::R             ; randomize_mesh
        when Lirith::Input::Keys::H             ; debug_camera
        end

        Lirith.application.camera.update_view
      end

      def handle_key_release(key)
        case key
        when Lirith::Input::Keys::W          ; @move_forward = false
        when Lirith::Input::Keys::A          ; @move_left = false
        when Lirith::Input::Keys::S          ; @move_backward = false
        when Lirith::Input::Keys::D          ; @move_right = false
        when Lirith::Input::Keys::Q          ; @translate_left = false
        when Lirith::Input::Keys::E          ; @translate_right = false
        when Lirith::Input::Keys::LeftShift  ; @move_up = false
        when Lirith::Input::Keys::LeftControl; @move_down = false
        end
      end

      def randomize_mesh
        if Lirith.application.scene.children.first.is_a?(Lirith::Objects::Mesh)
          Lirith.application.scene.children.each do |m|
            m.rotate_x Lirith::Math.deg2rad(1.0)
            m.update_view
          end
          # mesh.vertices.first.position.x -= 1_f32
          # mesh.needs_update = true
        end
      end

      def debug_camera
        p Lirith.application.camera
      end

      def check_mouse
        Lirith.application.camera.rotate_y(Lirith::Math.deg2rad(1.0)) if @translate_left
        Lirith.application.camera.rotate_y(Lirith::Math.deg2rad(-1.0)) if @translate_right

        Lirith.application.camera.update_view if @translate_left || @translate_right

        true
      end

      def move
        Lirith.application.camera.translate_z -0.1 if @move_forward
        Lirith.application.camera.translate_z 0.1 if @move_backward

        Lirith.application.camera.translate_x -0.1 if @move_left
        Lirith.application.camera.translate_x 0.1 if @move_right

        Lirith.application.camera.translate_y 0.1 if @move_up
        Lirith.application.camera.translate_y -0.1 if @move_down

        Lirith.application.camera.update_view if @move_forward || @move_backward || @move_left || @move_right || @move_up || @move_down

        true
      end

      def handle_event(event)
        case event
        when Events::Render::StartPaint        ; check_mouse && move
        when Lirith::Events::Input::KeyPressed ; handle_key_press(event.key)
        when Lirith::Events::Input::KeyReleased; handle_key_release(event.key)
        end
      end
    end
  end
end
