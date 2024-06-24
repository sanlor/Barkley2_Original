x0 = invenX[swapNumber];
x1 = invenX[slotNumber];
scr_items_swap(argument0, swap, argument1);
dx = sx;
itmAmt = scr_items_count(argument0);
for (i = 0; i < itmAmt; i += 1)
{
    invenX[i] = dx;
    dx += itmSpc + itmSiz;
}
invenX[slotNumber] = x0;
invenX[swapNumber] = x1;
