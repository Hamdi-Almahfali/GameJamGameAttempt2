/// @description Insert description here
// You can write your code in this editor
// Apply gravity

vsp += grv;


// Horizontal collision
if (hsp != 0) {
    if (place_meeting(x + hsp, y, oWall)) {
        var move = hsp;
        while (!place_meeting(x + sign(move), y, oWall) && abs(move) > 0) {
            x += sign(move);
            move -= sign(move);
        }
        hsp = 0;
    }
    x += hsp;
}

// Vertical collision
if (place_meeting(x, y + vsp, oWall)) {
    while (!place_meeting(x, y + sign(vsp), oWall)) {
        y += sign(vsp);
    }
    vsp = 0;
} else {
    y += vsp;
}

// Update grounded state
grounded = place_meeting(x, y + 1, oWall);

// Update direction
if (hsp != 0) image_xscale = sign(hsp); 