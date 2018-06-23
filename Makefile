all: img stl

img:
	openscad --viewall --colorscheme=Metallic -o bose.png bose.scad

stl:
	openscad -o yoke_l.stl yoke_l.scad
	openscad -o yoke_r.stl yoke_r.scad

clean:
	rm *.png *.stl
