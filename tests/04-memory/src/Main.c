#include "Main.h"

PURS_FFI_FUNC_2(Main_sub, x, y) {
	return purs_any_int(purs_any_force_int(x) - purs_any_force_int(y));
}
