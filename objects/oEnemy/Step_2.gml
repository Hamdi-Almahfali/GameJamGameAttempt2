/// @description Insert description here
// Draw alert icon
if (alert) 
{
    // Increment timer by delta_time (for smooth animation)
    alert_timer += delta_time / 1000000; // Convert microseconds to seconds
    
    // Advance frame if enough time passed
    if (alert_timer >= alert_speed) 
    {
        alert_frame++;
        alert_timer = 0; // Reset timer for next frame
        
        // Stop animation if all frames played
        if (alert_frame >= alert_max_frames) 
        {
            alert = false;
            alert_frame = 0; // Reset for next time
        }
    }
}