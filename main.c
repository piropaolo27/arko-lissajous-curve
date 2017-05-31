#include <stdio.h>
#include <stdlib.h>
#include <allegro.h>
#include <math.h>

#include "lissajous_curve.h"

int main()

{
	double A, B, a = 5, b = 4, phase = 0.5, step = 10000;

	allegro_init();	//Macro to initialise the Allegro library.
	install_keyboard();	//Installs the Allegro keyboard interrupt handler.
	set_color_depth(8);	//Sets the global pixel color depth.
	set_gfx_mode(GFX_AUTODETECT_WINDOWED, 600, 600, 0, 0);	//Sets a graphic video mode.

	BITMAP *image = create_bitmap_ex(8, SCREEN_W, SCREEN_H);	//Creates a memory bitmap specifying color depth.

	if(!image)
	{
		set_gfx_mode(GFX_TEXT, 0, 0, 0, 0 );
		allegro_message("Cannot load the image.");
		allegro_exit();
		return 1;
	}

	A = 100;
	B = 100;
	clear_to_color(image, makecol(15, 75, 150));	//Clears the bitmap to the specified color.
																								//Converts an RGB value into the current pixel format.
	lissajous_curve(image->line, image->w, image->h, A, B, a, b, phase*M_PI, M_PI/step, 2*M_PI);
	blit(image, screen, 0, 0, 0, 0, image->w, image->h);	//Copies a rectangular area from one bitmap to another.
    	while(!key[KEY_ESC])
	{
		if(key[KEY_1])
		{
			printf("\nChange amplitude A\n");
			printf("A: ");
			scanf("%lf", &A);
			clear_to_color(image, makecol(15, 75, 150));
		}
		else if(key[KEY_2])
		{
			printf("\nChange amplitude B\n");
			printf("B: ");
			scanf("%lf", &B);
			clear_to_color(image, makecol(15, 75, 150));
		}
		else if(key[KEY_3])
		{
			printf("\nChange frequency a\n");
			printf("a: ");
			scanf("%lf", &a);
			clear_to_color(image, makecol(15, 75, 150));
		}
		else if(key[KEY_4])
		{
			printf("\nChange frequency b\n");
			printf("b: ");
			scanf("%lf", &b);
			clear_to_color(image, makecol(15, 75, 150));
		}
		else if(key[KEY_5])
		{
			printf("\nChange phase, phase = x * pi\n");
			printf("x = ");
			scanf("%lf", &phase);
			clear_to_color(image, makecol(15, 75, 150));
		}
		else if (key[KEY_6])
		{
			printf("\nChange step, step = x * pi\n");
			printf("x = ");
			scanf("%lf", &step);
			clear_to_color(image, makecol(15, 75, 150));
		}

		else if(key[KEY_P])
		{
			printf("\nParameters display\n");
			printf("A: %lf ", A);
			printf("B: %lf ", B);
			printf("a: %lf ", a);
			printf("b: %lf ", b);
			printf("phase = x*pi: x =  %lf", phase);
		}
		else if(key[KEY_H])
		{
			printf("\n1 - change amplitude A\n2 - change amplitude B\n3 - change frequency a\n4 - change frequency b\n5 - change phase\nP - display parameters\nH - help\n");
		}
		lissajous_curve(image->line, image->w, image->h, A, B, a, b, phase*M_PI, M_PI/step, 2*M_PI);
		blit(image, screen, 0, 0, 0, 0, image->w, image->h);	//Copies a rectangular area from one bitmap to another.
		readkey();	//Returns the next character from the keyboard buffer.
	}
	destroy_bitmap(image);	//Destroys any type of created bitmap.
	allegro_exit();	//Closes down the Allegro system.
	return 0;
}
