//0 = upper body, 1 = head, 2 = lower body
//3 = l arm, 4 = l hand, 5 = r arm, 6 = r hand
//7 = r leg, 8 = r calf, 9 = r foot, 10 = l leg, 11 = l calf, 12 = l foot
//Just supply poseID to exclude
for (h = 0; h < poses; h += 1)
{
    if (argument[0] != h && argument[1] != h)
    {
        for (i = 0; i < 13; i +=1) 
        {
            limbDirD[h, i] = limbDir[h, i] - 5 + random(5);
        }
    }
}
