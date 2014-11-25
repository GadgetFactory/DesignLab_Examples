const int blocks_x = 10;
const int blocks_y = 20;
const int blocksize=5;

const int board_x0 = 40;
const int board_width = blocks_x * blocksize;
const int board_y0 = 5;
const int board_height = blocks_y * blocksize;

const int piecesize_max=4;

enum event_t {
	event_none,
	event_left,
	event_right,
	event_down,
	event_res,
        event_up
};

struct piece {
    int size;
	unsigned char layout[piecesize_max][piecesize_max];
};

typedef VGA_class::pixel_t color_type[blocksize*blocksize];


struct level {
	unsigned lines_required;
	unsigned char area[blocks_x][blocks_y];
};
