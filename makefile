objects = Main.o glad.o camera.o entity.o shader.o init.o render.o

dirs = "./Objects/Main.o" "./Objects/glad.o" "./Objects/camera.o" "./Objects/entity.o" "./Objects/shader.o" "./Objects/init.o" "./Objects/render.o"

sfml = -I "./ExtLibs/SFML-2.5.1-sources/SFML-2.5.1/include" \
			 -L "./ExtLibs/SFML-2.5.1-compiled/lib" \
			 -L "./ExtLibs/freetype-2.4.10-binwin32/lib" \
 		 		-lsfml-graphics-2 -lsfml-window-2 -lsfml-system-2 -lopengl32 -lfreetype

glm = -I "./ExtLibs/glm"

glad = -I "./ExtLibs/GLAD/include"

stb = -I "./ExtLibs/stb-master"

Main: $(objects) makefile
	g++ -g -o "./Bin/Main" $(dirs) -w -DSFML_STATIC \
		$(glm) \
		$(glad) \
		$(stb) \
		$(sfml)

Main.o:
	g++ -c "./Source/Main.cpp" -o "./Objects/Main.o" -w -DSFML_STATIC \
		$(glm) \
		$(glad) \
		$(stb) \
		$(sfml)

glad.o:
	g++ -c "./ExtLibs/GLAD/src/glad.c" -o "./Objects/glad.o" -I "./ExtLibs/GLAD/include"

camera.o:
	g++ -c "./Source/Libs/camera.cpp" -o "./Objects/camera.o" -w \
		$(glm) \
		$(sfml)

entity.o:
	g++ -c "./Source/Libs/entity.cpp" -o "./Objects/entity.o" -w \
		$(glad) \
		$(glm) \
		$(stb)

shader.o:
	g++ -c "./Source/Libs/shader.cpp" -o "./Objects/shader.o" \
		$(glad)

init.o:
	g++ -c "./Source/Libs/init.cpp" -o "./Objects/init.o" -w -DSFML_STATIC \
		$(sfml) \
		$(glad) \
		$(glm)

render.o:
	g++ -c "./Source/Libs/render.cpp" -o "./Objects/render.o" -w -DSFML_STATIC \
		$(glad) \
		$(glm) \
		$(sfml)


clean:
	erase ".\Bin\*.exe"
	erase ".\Objects\*.o"

run:
	"./Bin/Main"

clean_build: clean Main

cbr: clean Main run makefile
