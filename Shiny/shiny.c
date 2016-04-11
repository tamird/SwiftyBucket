//
//  shiny.c
//  SwiftyBucket
//
//  Created by Tamir Duberstein on 4/11/16.
//  Copyright © 2016 Tamir Duberstein. All rights reserved.
//

#include "shiny.h"

void callSetterWithRandom(void setter(const uint32_t, const void *), const void *context) {
    setter(arc4random(), context);
}
