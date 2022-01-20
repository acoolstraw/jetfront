require "raylib-cr"

alias Ray = LibRaylib

screen_width = 800
screen_height = 450

Ray.init_window(screen_width, screen_height, "Jetfront")

#shader = Ray.load_shader("/home/bo/projects/jetfront/src/resources/shaders/simpleLight.vs", "/home/bo/projects/jetfront/src/resources/shaders/simpleLight.fs")
#shader.locs[Ray::ShaderLocationIndex::MatrixModel.to_i] = Ray.get_shader_location(shader, "matModel")
#shader.locs[Ray::ShaderLocationIndex::VectorView.to_i] = Ray.get_shader_location(shader, "viewPos")

#amb = Ray.get_shader_location(shader, "ambient")

#Ray.set_shader_value(shader, amb, [0.2, 0.2, 0.2, 1.0], Ray::ShaderUniformDataType::Vec4)

#SetShaderValue(shader, amb, (float[4]){0.2,0.2,0.2,1.0}, UNIFORM_VEC4);
#model.materials[0].shader = shader

#light = Ray.create
#Light light = CreateLight(LIGHT_POINT, (Vector3){ 2,2,0 }, Vector3Zero(), WHITE, shader);

#SetShaderValue(shader, shader.locs[LOC_VECTOR_VIEW], &camera.position.x, UNIFORM_VEC3);
#UpdateLightValues(shader, lights[0]);

camera = Ray::Camera3D.new
camera.position = Ray::Vector3.new x: 0.0, y: 5.0, z: -12.0
camera.target = Ray::Vector3.new x: 0.0, y: 0.0, z: 0.0
camera.up = Ray::Vector3.new x: 0.0, y: 1.0, z: 0.0
camera.fovy = 60.0
camera.projection = Ray::CameraProjection::Perspective

model = Ray.load_model("/home/bo/projects/jetfront/src/resources/models/f16.obj")
#texture = Ray.load_texture("/home/bo/projects/jetfront/src/resources/textures/plane_diffuse.png")
model_position = Ray::Vector3.new(x: 0.0, y: -8.0, z: 0.0)

#map = LibRaylib::MaterialMap.new(
#    texture: texture,
#    color: Ray::Color.new(r: 255, g: 255, b: 255, a: 255),
#    value: 0.0
#)

#model.materials[0].maps[Ray::MaterialMapIndex::Albedo.to_i] = map

Ray.set_target_fps(60)

until Ray.close_window?
  Ray.update_camera(pointerof(camera))
  Ray.begin_drawing
  Ray.clear_background(Ray::RAYWHITE)
  Ray.begin_mode_3d(camera)
  Ray.draw_grid(100, 1.0)
  Ray.draw_model(model, model_position, 5, Ray::WHITE)

  #Ray.draw_cube(cube_position, 2.0, 2.0, 2.0, Ray::RED)
  #Ray.draw_cube_wires(cube_position, 2.0, 2.0, 2.0, Ray::MAROON)
  if Ray.key_pressed?(Ray::KeyboardKey::W)
    puts "w"
  end
  Ray.end_mode_3d
  Ray.end_drawing
end

Ray.unload_model(model)
Ray.close_window
