
state("ePSXe")
{
    int loading : 0xB79B28;
    // Number of laps in a race
    byte totalLaps : 0xB93247;
    // The human player's current position
    short position : 0xB16D70;

    // All players' current lap is stored in memory as a 2 byte number
    // In which slot the human player is located seems to be determined at game start
    // I have been unable to find a way to determine which of the 12 is the human, so I need all of them
    short player1Lap : 0xB92A02;
    short player2Lap : 0xB92AF2;
    short player3Lap : 0xB92BE2;
    short player4Lap : 0xB92CD2;
    short player5Lap : 0xB92DC2;
    short player6Lap : 0xB92EB2;
    short player7Lap : 0xB92FA2;
    short player8Lap : 0xB93092;
    short player9Lap : 0xB93182;
    short player10Lap : 0xB93272;
    short player11Lap : 0xB93362;
    short player12Lap : 0xB93452;

    // equals 0 if the game is paused, 128 if the game is running
    // somehow connected to the music: if manually set to 0, the music stops despite SFX and controller inputs still working
    byte running : 0x378A4D;
}

startup {
    // Indicates if the race has ended
    vars.raceIsFinished = false;
    // Indicates if the game is loading the next race
    vars.waitingForNextRace = true;
}

update {
    // The race if finished once any player ends the final lap
    vars.raceIsFinished = current.player1Lap > current.totalLaps || current.player2Lap > current.totalLaps || current.player3Lap > current.totalLaps || current.player4Lap > current.totalLaps || current.player5Lap > current.totalLaps || current.player6Lap > current.totalLaps || current.player7Lap > current.totalLaps || current.player8Lap > current.totalLaps || current.player9Lap > current.totalLaps || current.player10Lap > current.totalLaps || current.player11Lap > current.totalLaps || current.player12Lap > current.totalLaps;

    // If a player's lap count has been reset to 0, a new race has begun
    if(current.player1Lap == 0 && vars.waitingForNextRace) {
        vars.waitingForNextRace = false;
    }
}

isLoading {
    if (current.running == 0) {
        return true;
    }

    return false;
}

start {
    if (current.running == 0 && old.running != 0) {
        return true;
    }
}

split {
    // The split should happen if:
    // - The current race has ended
    // - The player was in first place

    // The split will be prevented if:
    // - The game is loading the next race (prevents erroneous splitting between races)
	if (!vars.waitingForNextRace && vars.raceIsFinished && current.position == 1 && current.loading == 0) {
        vars.waitingForNextRace = true;
        return true;
    }

    return false;
}