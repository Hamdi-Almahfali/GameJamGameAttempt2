/// @description Insert description here
// You can write your code in this editor
DEBUG = debug_mode;
global.DEBUG = DEBUG;
global.MASTER_AUDIO = 0.5;
global.MUSIC_AUDIO = 0.5;

audio_group_load(music);
audio_set_master_gain(0, global.MASTER_AUDIO);
audio_group_set_gain(music, global.MUSIC_AUDIO, 1);