module LirithApp
  module Systems
    class Scene < Lirith::Systems::Base
      def initialize
        @model = Models::Cube.new
        loader = Lirith::Loaders::JsonLoader.new
        mesh = loader.load(File.open("./src/lirith_app/models/cube.json"))

        Lirith.application.scene.children << mesh
      end

      def handle_event(event)
        # case event
        # when Events::Render::Started; load_model
        # end
      end
    end
  end
end
