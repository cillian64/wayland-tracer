#include "percetto.h"

#define PERCETTO_CATEGORIES(C, G) \
    C(wayproto, "Wayland protocol messages")
PERCETTO_CATEGORY_DECLARE(PERCETTO_CATEGORIES);

PERCETTO_TRACK_DECLARE(waytrack);
