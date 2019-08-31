module LirithApp
  module Systems
    class Scene < Lirith::Systems::Base
      def initialize
        texture = Lirith::Texture.new(
          image: RImage::Formats::Bitmap.new(File.open("./src/lirith_app/textures/uvtemplate.bmp"))
        )

        material = Lirith::Materials::Basic.new
        material.texture = texture

        loader = Lirith::Loaders::JsonLoader.new
        mesh = loader.load(File.open("./src/lirith_app/models/cubes/cube.json"))
        Lirith.application.scene.children << mesh

        mesh2 = mesh.clone
        # mesh2 = loader.load(File.open("./src/lirith_app/models/cube.json"))
        mesh2.position.x -= 2
        mesh2.update_view
        # Lirith.application.scene.children << mesh2

        mesh3 = loader.load(File.open("./src/lirith_app/models/cubes/cube.json"))
        mesh3.position.x += 2
        mesh3.update_view
        # Lirith.application.scene.children << mesh3

        plane = Lirith::Objects::Plane.create(2, 2, 2, 2)
        # plane.rotate_x Lirith::Math.deg2rad(90.0)
        plane.translate_z 6
        plane.translate_x -1
        plane.translate_y -1
        plane.update_view
        plane.material.color = Lirith::Math::Color.red
        Lirith.application.scene.children << plane

        obj_loader = Lirith::Loaders::ObjLoader.new
        # obj_mesh = obj_loader.load(File.open("./src/lirith_app/models/cubes/cube.obj"))
        # obj_mesh = obj_loader.load(File.open("./src/lirith_app/models/male02/male02.obj"))
        # obj_mesh.scale = Lirith::Math::Vector3.new(0.01, 0.01, 0.01)
        # obj_mesh.translate_y -1
        # obj_mesh = obj_loader.load(File.open("./src/lirith_app/models/cubes/cubes.obj"))
        obj_mesh = obj_loader.load(File.open("./src/lirith_app/models/antler.obj"))
        obj_mesh.update_view
        obj_mesh.material = material
        Lirith.application.scene.children << obj_mesh
      end

      def handle_event(event)
        # case event
        # when Events::Render::Started; load_model
        # end
      end
    end
  end
end
