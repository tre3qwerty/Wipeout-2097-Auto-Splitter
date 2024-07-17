state("LiveSplit") {}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/emu-help-v2")).CreateInstance("PS1");

    // Indicates if the race has ended
    vars.raceIsFinished = false;
    // Indicates if the game is loading the next race
    vars.waitingForNextRace = true;

    vars.Helper.Load = (Func<dynamic, bool>)(emu => 
    {
        emu.Make<int>("loading", 0x8011657C);
        emu.Make<short>("position", 0x80094D50);
        emu.Make<byte>("totalLaps", 0x80111227);
        emu.Make<short>("player1Lap", 0x801109E2);
        emu.Make<short>("player2Lap", 0x80110AD2);
        emu.Make<short>("player3Lap", 0x80110BC2);
        emu.Make<short>("player4Lap", 0x80110CB2);
        emu.Make<short>("player5Lap", 0x80110DA2);
        emu.Make<short>("player6Lap", 0x80110E92);
        emu.Make<short>("player7Lap", 0x80110F82);
        emu.Make<short>("player8Lap", 0x80111072);
        emu.Make<short>("player9Lap", 0x80111162);
        emu.Make<short>("player10Lap", 0x80111252);
        emu.Make<short>("player11Lap", 0x80111342);
        emu.Make<short>("player12Lap", 0x80111432);

        emu.Make<byte>("running", 0x801FD1FF);
        return true;
    });

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