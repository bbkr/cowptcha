unit class Cowptcha;

use NativeCall;

# Imlib2 API: https://docs.enlightenment.org/api/imlib2/html/imlib2_8c.html

class Image is repr('CPointer') { * }

# https://docs.enlightenment.org/api/imlib2/html/imlib2_8c.html#a27178bd596d8dee6f239f083262dfb6
sub imlib_create_image( int32, int32 ) returns Image is native( 'Imlib2', v1) is export { * }

# https://docs.enlightenment.org/api/imlib2/html/imlib2_8c.html#e9e9156e66ed4c916ccd218b9f235379
sub imlib_context_set_image( Image ) is native( 'Imlib2', v1) is export { * }

# https://docs.enlightenment.org/api/imlib2/html/imlib2_8c.html#ede95498c3a875eb55ffd8317d264eab
sub imlib_image_set_format( Str ) is native( 'Imlib2', v1) is export { * }

# https://docs.enlightenment.org/api/imlib2/html/imlib2_8c.html#5cf90571c318eaf8c3fe45fc63a50c1b
sub imlib_save_image( Str ) is native( 'Imlib2', v1) is export { * }

# https://docs.enlightenment.org/api/imlib2/html/imlib2_8c.html#4220e8411cbf5c432465a015a4215ca3
sub imlib_free_image_and_decache( ) is native( 'Imlib2', v1) is export { * }

sub imlib_context_set_color(int32, int32, int32, int32) is native( 'Imlib2', v1) is export { * }
sub imlib_image_fill_rectangle(int32, int32, int32, int32) is native( 'Imlib2', v1) is export { * }

method foo {

    my $image = imlib_create_image(256, 256);
    imlib_context_set_image($image);
    imlib_context_set_color(255, 255, 255, 255);
    imlib_image_fill_rectangle(0, 0, 256, 256);
    imlib_image_set_format('png');
    imlib_save_image('test.png');
    imlib_free_image_and_decache();
}

