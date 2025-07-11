
unused_func(){
    auto u;
    u = 64;
    goto ANOTHER_LABEL;
    u = 420;
ANOTHER_LABEL:
}

empty_func() {
}

asm_func() {
    __asm__("");
}

isolated_loop() {
    goto RETURN;

    auto f;
    f = 0;
    while(1) {
        f += 1;
        if (f > 3) {
            goto RETURN;
        }
    }

RETURN:
}

constant_folded_if_else() {
    extrn printf;
    /* mimic constant-folded if-else. */
    {    
        printf("reach\n");
    }
    goto ENDIF;
ELSE:
    {
        printf("unreachable\n");
    }
ENDIF:
}

main() {
    extrn printf;
    auto x, y;
    x = 35;
    y = x - 1;

    isolated_loop();
    constant_folded_if_else();
    empty_func();
    asm_func();

URMOM:
    if (1 < 2) {
        printf("remain\n");
    } else {
        printf("removed if constant folding\n");
    }

    goto END;
    y = 0;
    auto e;
END:
    printf("%d\n", x + y);
    /* TODO: in this case, variable e may not be removed... */
    printf("%d\n", &e - &x);
}
