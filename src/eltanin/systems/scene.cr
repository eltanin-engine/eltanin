module Eltanin
  module Systems
    class Scene < Lirith::Systems::Base
      def initialize

        obj_loader = Lirith::Loaders::ObjLoader.new

        if false
          obj_mesh = obj_loader.load(File.open("./src/eltanin/models/Mountain/Mountain.obj"))
          obj_mesh.scale = Lirith::Math::Vector3.new(0.1,0.1,0.1)
          obj_mesh.rotate_y -Lirith::Math.deg2rad(90.0)
          obj_mesh.translate_x -13.83
          obj_mesh.translate_y -2.5
          obj_mesh.update_view
          obj_mesh.material.texture = Lirith::Texture.new(image: RImage::Formats::Bitmap.new(File.open("./src/eltanin/models/Mountain/Texture.bmp")))
          Lirith.application.scene.children << obj_mesh
        else
          obj_mesh = obj_loader.load(File.open("./src/eltanin/models/male02/male02.obj"))
          obj_mesh.scale = Lirith::Math::Vector3.new(0.1,0.1,0.1)
          obj_mesh.update_view
          obj_mesh.material.color = Lirith::Math::Color.red
          Lirith.application.scene.children << obj_mesh
        end
      end

      def handle_event(event)
        #case event
        #end
      end
    end
  end
end
