import traceback

from Tools.mapconvert import bipartitematch


class Grid(object):
    
    outsideGridVal = 0
    
    def __init__(self, w, h, val = 0):
        self.matrix = [[val for y in xrange(h)] for x in xrange(w)]
        self.w = w
        self.h = h
    
    def reset(self, val = 0):
        self.matrix = [[val for x in xrange(self.h)] for x in xrange(self.w)]
        
    def set(self, x, y, val):
        if not (x < 0 or y < 0 or x >= self.w or y >= self.h):
            self.matrix[x][y] = val
        
    def get(self, x, y):
        if (x < 0 or y < 0 or x >= self.w or y >= self.h):
            return self.outsideGridVal
        else:
            return self.matrix[x][y]
    
    def set_rect(self, x1, y1, x2, y2, val):
        for x in xrange(x1, x2+1):
            for y in xrange(y1, y2+1):
                self.set(x, y, val)
                
#------------------------------------
#- RectSolver functions
#------------------------------------
class RectSolver(Grid):

    def __init__(self, w, h, val = 0):
        super(RectSolver, self).__init__(w, h, val)
        self.lines_hori = []
        self.lines_vert = []
    
    #--------------------------------
    # Line Arithmetics

    def line_is_hori(self, line):
        if (line[1] == line[3]):
            return True
        return False
        
    def line_is_vert(self, line):
        if (line[0] == line[2]):
            return True
        return False
    
    def point_meets_line(self, x, y):
        return (self.point_meets_line_hori(x, y) or self.point_meets_line_vert(x, y))
        
    def point_meets_line_hori(self, x, y):
        for line in self.lines_hori:
            if (y == line[1] and y == line[3] and
                x >= line[0] and x <= line[2]):
                return True
        return False
        
    def point_meets_line_vert(self, x, y):
        for line in self.lines_vert:
            if (y >= line[1] and y <= line[3] and
                x == line[0] and x == line[2]):
                return True
        return False
        
    def line_meets_hori(self, x1, y1, x2, y2):
        assert self.line_is_hori((x1, y1, x2, y2))
        for line in self.lines_hori:
            if (y1 == line[1] and y2 == line[3] and
                x1 >= line[0] and x2 <= line[2]):
                return True
        return False
        
    def line_meets_vert(self, x1, y1, x2, y2):
        assert self.line_is_vert((x1, y1, x2, y2))
        for line in self.lines_vert:
            if (y1 >= line[1] and y2 <= line[3] and
                x1 == line[0] and x2 == line[2]):
                return True
        return False
        
    def debug_print(self, x1, y1, x2, y2, xp = None, yp = None):
        print_lines = True
        y = y1
        while (y <= y2 or print_lines):
            x = x1
            ln = ""
            if print_lines:
                while (x <= x2+1):
                    if (self.point_meets_line(x,y)):
                        ln += "# "
                    else:
                        ln += "  "
                    x += 1
                print ln
                print_lines = False
            else:
                while (x <= x2):
                    if ((not x is None) and (not y is None) and x == xp and y == yp):
                        ln += " O"
                    elif (self.get(x,y) == 0):
                        ln += " X"
                    else:
                        ln += " ."
                    x += 1
                print ln
                y += 1
                print_lines = True

    def find_convex_corners(self):
        points = []
        
        for x in range(0, self.w+1):
            for y in range(0, self.h+1):
                
                if self.point_meets_line(x, y):
                    #If a point meets a line it can never be a convex corner
                    continue
                    
                data = [self.get(x-1, y-1), self.get(x, y-1),
                        self.get(x-1, y  ), self.get(x, y  )]
                        
                if data == [1,1,0,1]:
                   points.append((x,y,1)) # Quadrant 1
                elif data == [1,1,1,0]:
                   points.append((x,y,2)) # Quadrant 2
                elif data == [1,0,1,1]:
                   points.append((x,y,3)) # Quadrant 3
                elif data == [0,1,1,1]:
                   points.append((x,y,4)) # Quadrant 4
                   
        return points
    
    # Concave corner is [x, y, quadrant(1, 2, 3, or 4)]
    def find_concave_corners(self):
        points = []
        
        for x in range(0, self.w+1):
            for y in range(0, self.h+1):
                
                data = [self.get(x-1, y-1), self.get(x, y-1),
                        self.get(x-1, y  ), self.get(x, y  )]
                #line = [self.point_meets_line_hori(x-1, y  ),
                #        self.point_meets_line_vert(x,   y-1),
                #        self.point_meets_line_hori(x+1, y  ),
                #        self.point_meets_line_vert(x,   y+1)]
                line = [self.line_meets_hori(x-1, y,   x,   y),
                        self.line_meets_vert(x,   y-1, x,   y),
                        self.line_meets_hori(x,   y,   x+1, y),
                        self.line_meets_vert(x,   y,   x,   y+1)]
                
                if (data[1] == 1 and
                    (data[0] == 0 or line[1]) and
                    (data[3] == 0 or line[2])):
                    points.append((x,y,1)) # Quadrant 1
                if (data[0] == 1 and
                    (data[1] == 0 or line[1]) and
                    (data[2] == 0 or line[0])):
                    points.append((x,y,2)) # Quadrant 2
                if (data[2] == 1 and
                    (data[0] == 0 or line[0]) and
                    (data[3] == 0 or line[3])):
                    points.append((x,y,3)) # Quadrant 3
                if (data[3] == 1 and
                    (data[1] == 0 or line[2]) and
                    (data[2] == 0 or line[3])):
                    points.append((x,y,4)) # Quadrant 4
        
        return points
    
    def trace_line_east(self, ox, oy):
        cx = ox
        cy = oy
        
        while (self.get(cx,cy-1) == 1 and
               self.get(cx,cy  ) == 1 and
               not self.point_meets_line_vert(cx,cy)):
           cx += 1
        
        if cx == ox and cy == oy:
            return None
        return ((ox, oy, cx, cy), cx - ox)
        
    def trace_line_west(self, ox, oy):
        cx = ox
        cy = oy
        
        while (self.get(cx-1,cy-1) == 1 and
               self.get(cx-1,cy  ) == 1 and
               not self.point_meets_line_vert(cx,cy)):
           cx -= 1
        
        if cx == ox and cy == oy:
            return None
        return ((cx, cy, ox, oy), ox - cx)
        
    def trace_line_north(self, ox, oy):
        cx = ox
        cy = oy
        
        while (self.get(cx-1,cy-1) == 1 and
               self.get(cx  ,cy-1) == 1 and
               not self.point_meets_line_vert(cx,cy)):
           cy -= 1
        
        if cx == ox and cy == oy:
            return None
        return ((cx, cy, ox, oy), oy - cy)
        
    def trace_line_south(self, ox, oy):
        cx = ox
        cy = oy
        
        while (self.get(cx-1,cy) == 1 and
               self.get(cx  ,cy) == 1 and
               not self.point_meets_line_vert(cx,cy)):
           cy += 1
        
        
        if cx == ox and cy == oy:
            return None
        return ((ox, oy, cx, cy), cy - oy)
    
    def line_coll(self, lhori, lvert):
        # Sanity checks
        if not self.line_is_hori(lhori):
            print "lhori is not horizontal!"
            print lhori
            exit(1)
        if not self.line_is_vert(lvert):
            print "lvert is not horizontal!"
            print lvert
            exit(1)
        
        if (lhori[0] <= lvert[0] and
            lhori[2] >= lvert[0] and
            lvert[1] <= lhori[1] and
            lvert[3] >= lhori[1]):
            return True
        return False
    
    def expand_convex_corner(self, x, y, q): #q is quadrant
        if (q == 1):
            l1 = self.trace_line_east(x,y)
            l2 = self.trace_line_north(x,y)
        elif (q == 2):
            l1 = self.trace_line_north(x,y)
            l2 = self.trace_line_west(x,y)
        elif (q == 3):
            l1 = self.trace_line_west(x,y)
            l2 = self.trace_line_south(x,y)
        elif (q == 4):
            l1 = self.trace_line_south(x,y)
            l2 = self.trace_line_east(x,y)
        
        if l1 is None or l2 is None:
            print "A line from convex corner was None!"
            print (x, y, q)
            print (l1, l2)
            self.debug_print(x - 3, y - 3, x + 2, y + 2)
            exit(1)
            
        if (l1[1] < l2[1]):
            return l1[0]
        else:
            return l2[0]
    
    # ---------------------------------------------------------------
    # MAIN FUNCTIONS
    # ---------------------------------------------------------------
    
    def dissect(self):
        # ---This is one dissection pass---
        # It draws lines from all concave corners and attempts to find the minimum cut of lines.
        # Lines that have convex corners at both endpoints (double-duty lines) will be prioritized.
        # When no concave corners remain, the area has been fully dissected into rectangles.
        
        #print "---- DISSECT"
        convex = self.find_convex_corners()
        #print "convex corners: %s" % convex
        if len(convex) == 0:
            return True # Dissection finished
        
        # Trace lines from all corners
        lines = [self.expand_convex_corner(c[0], c[1], c[2]) for c in convex]
        lines_hori = [l for l in lines if l[1] == l[3]]
        lines_vert = [l for l in lines if l[0] == l[2]]
        #print "traced lines: %s" % lines
        #print "traced lines hori: %s" % lines_hori
        #print "traced lines vert: %s" % lines_vert
        
        # Prioritize double-duty lines
        
        if (len(lines_hori) > 0):
            # Make a line-collision bipartite graph
            bipart = {}
            for i in xrange(len(lines_hori)):
                l = []
                for j in xrange(len(lines_vert)):
                    if self.line_coll(lines_hori[i], lines_vert[j]):
                        l.append(lines_vert[j])
                bipart[lines_hori[i]] = l
                    
            # Minimum-cut
            (M, A, B) = bipartitematch.bipartiteMatch(bipart)
            #print "Selected lines: %s" % str((A, B))
            
            # Add the selected lines
            A.extend(B)
            for l in A:
                if self.line_is_hori(l):
                    self.lines_hori.append(l)
                elif self.line_is_vert(l):
                    self.lines_vert.append(l)
                else:
                    print "BAD LINE: NEITHER HORI NOR VERT"
                    print l
                    exit(1)
        else:
            # Special case: vert lines but no hori lines
            self.lines_vert.extend(lines_vert)
        
        #print "hori lines: %s" % str(self.lines_hori)
        #print "vert lines: %s" % str(self.lines_vert)
        return False # Dissection not finished
    
    def generate_rects(self):
        
        def print_points(corners):
            for c in corners:
                print "-- Printing corner: %s" % str(c)
                self.debug_print(c[0] - 10, c[1] - 10, c[0] + 9, c[1] + 9, xp = c[0], yp = c[1])
        
        #print "---- GENERATE RECTS"
        
        assert len(self.find_convex_corners()) == 0, (
               "Convex corners remaining when doing generate_rects()")
        
        rects = []
        concave = self.find_concave_corners()
        while (len(concave) > 0):
            q1c = None
            q2c = None
            q3c = None
            q4c = None

            # Find Quadrant 4 corner (top left corner of a rect)
            for c in concave:
                if c[2] == 4:
                    q4c = c
                    break
            if (q4c is None):
                # Something is terribly wrong. dump debug infos
                print "No Q4 corner found: %s" % str(concave)
                print_points(concave[:6])
                exit(1)
            #print "Q4C: %s" % str(q4c)
            
            # Find quadrant 3 corner to the east
            y = q4c[1]
            x = q4c[0] + 1
            while (x <= self.w and q3c is None):
                if ((x, y, 3) in concave):
                    q3c = (x, y, 3)
                x += 1
            if q3c is None:
                print "No Q3 corner found for Q4:%s, :%s" % (str(q4c), str(concave))
                print_points([q4c])
                print_points(concave[:6])
                exit(1)
            #print "Q3C: %s" % str(q3c)
            
            # Find quadrant 1 corner to the south
            y = q4c[1] + 1
            x = q4c[0]
            while (y <= self.h and q1c is None):
                if ((x, y, 1) in concave):
                    q1c = (x, y, 1)
                y += 1
            if q1c is None:
                print "No Q1 corner found for Q4:%s, %s" % (str(q4c), str(concave))
                print_points([q4c, q3c])
                print_points(concave[:6])
                exit(1)
            #print "Q2C: %s" % str(q2c)
            
            # Extrapolate quadrant 2 corner
            q2c = (q3c[0], q1c[1], 2)
            if not (q2c in concave):
                print "No Q2 corner %s found for Q4:%s, %s" % (str(q2c), str(q4c), str(concave))
                print_points([q4c,q1c,q3c,q2c])
                print_points(concave[:6])
                exit(1)
            #print "Q1C: %s" % str(q1c)
            
            rect = (q4c[0], q4c[1], q2c[0] - q4c[0], q2c[1] - q4c[1])
            #rect = (q4c[0], q4c[1], q2c[0] - 1, q2c[1] - 1)
            rects.append(rect)
            #print (rect)
            concave.remove(q1c)
            concave.remove(q2c)
            concave.remove(q3c)
            concave.remove(q4c)
        
        return rects
            
        
    def solve(self):
        #traceback.print_stack()
        self.lines_hori = []
        self.lines_vert = []
        
        while (not self.dissect()):
            pass
        
        rects = self.generate_rects()
        #print "---- FINAL RECTS"
        #print rects
        #print "---- TOTAL RECTS: %d" % len(rects)
        return rects


if __name__ == "__main__":
    #Test script
    rs = RectSolver(10, 10)
    rs.set_rect(5,2, 8,8, 1)
    rs.set_rect(2,5, 8,8, 1)
    rs.set_rect(4,4, 5,5, 1)
    rs.set_rect(7,7, 8,8, 0)
    rs.solve()


    rs = RectSolver(10, 10)
    rs.set_rect(1,1, 8,3, 1)
    rs.set_rect(3,4, 3,5, 1)
    rs.set_rect(3,6, 6,8, 1)
    rs.solve()
