module LirithApp
  module Systems
    class Scene < Lirith::Systems::Base
      def initialize
        @model = Models::Cube.new
        loader = Lirith::Loaders::JsonLoader.new
        mesh = loader.load(File.open("./src/lirith_app/models/cube.json"))

        #vertices = [] of Lirith::Math::Vector3
        #@model.vertices.each_slice(3).each do |vertex_attr|
        #  vertices << Lirith::Math::Vector3.new(vertex_attr[0], vertex_attr[1], vertex_attr[2])
        #end

        #colors = [] of Lirith::Math::Vector3
        #@model.colors.each_slice(3).each do |color_attr|
        #  colors << Lirith::Math::Vector3.new(color_attr[0], color_attr[1], color_attr[2])
        #end

        #geometry = Lirith::Geometry.new(vertices)
        #geometry.vertex_colors = colors
        #mesh = Lirith::Objects::Mesh.new(geometry)

        Application::CORE.scene.children << mesh
      end

      def handle_event(event)
        # case event
        # when Events::Render::Started; load_model
        # end
      end
    end
  end
end
