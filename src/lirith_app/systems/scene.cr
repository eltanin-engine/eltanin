module LirithApp
  module Systems
    class Scene < Lirith::Systems::Base
      def initialize
        @model = Models::Cube.new
        loader = Lirith::Loaders::JsonLoader.new
        mesh = loader.load(File.open("./src/lirith_app/models/cube.json"))

        Lirith.application.scene.children << mesh

        mesh2 = loader.load(File.open("./src/lirith_app/models/cube.json"))
        mesh2.position.x -= 2
        mesh2.update_view
        Lirith.application.scene.children << mesh2

        mesh3 = loader.load(File.open("./src/lirith_app/models/cube.json"))
        mesh3.position.x += 2
        mesh3.update_view
        Lirith.application.scene.children << mesh3

      end

      def handle_event(event)
        # case event
        # when Events::Render::Started; load_model
        # end
      end
    end
  end
end
