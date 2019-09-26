require "lirith"
require "./eltanin/events"
require "./eltanin/systems"
require "./eltanin/version"

module Eltanin
  class Application < Lirith::Application
    def setup
      Lirith::Managers::System.instance.register(Lirith::Systems::Console.new([
        Eltanin::Events::Render::EndPaint,
        Eltanin::Events::Render::StartPaint,
        Eltanin::Events::Render::FinalizePaint,
        Eltanin::Events::Render::Finalized,
        Lirith::Events::Input::KeyPressed,
        Lirith::Events::Input::KeyReleased,
      ]))
      Lirith::Managers::System.instance.register(Systems::Window.new)
      Lirith::Managers::System.instance.register(Systems::Input.new)
      Lirith::Managers::System.instance.register(Systems::Render.new)
      Lirith::Managers::System.instance.register(Systems::Clock.new)
      Lirith::Managers::System.instance.register(Systems::Scene.new)
    end
  end
end

Eltanin::Application.new
