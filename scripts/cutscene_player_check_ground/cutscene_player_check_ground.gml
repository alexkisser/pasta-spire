function cutscene_player_check_ground(argument0) //cutscene_player_check_ground
{
    var player = argument0
    var finish = 0
    with (player)
    {
        if grounded
            finish = 1
    }
    if finish
        cutscene_end_action()
    return;
}

