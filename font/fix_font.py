# -*- coding: utf-8 -*-
"""
Created on Sat Nov 23 19:27:32 2024

@author: mohib
"""

from skimage.io import imread, imsave, imshow
import numpy as np

base_font = imread("msg_large_1.png")
title_font = imread("msg_large_2.png")
print(np.min(base_font[256, 256, 3]))
print(base_font.shape)

rows = 16
cols = 9
size = 256

blank_image = base_font[256:512, 0:256, :]
numbers_1 = base_font[256:512, (256*11):, :]
numbers_2 = base_font[512:768, :(256*5), :]
fancy_caps_1 = base_font[512:768, (256*5):, :]
fancy_caps_2 = base_font[768:1024, :(256*15), :]
reg_caps_1 = base_font[(256*4):(256*5), (256*11):, :]
reg_caps_2 = base_font[(256*5):(256*6), :, :]
reg_caps_3 = base_font[(256*6):(256*7), :(256*5), :]
lower_1 = base_font[(256*6):(256*7), (256*5):, :]
lower_2 = base_font[(256*7):(256*8), :(256*15), :]

ital_ques = base_font[(256*7):(256*8), (256*15):, :]
ital_excl = base_font[(256*8):(256*9), :(256*1), :]
period = base_font[(256*8):(256*9), (256*1):(256*2), :]
comma = base_font[(256*8):(256*9), (256*2):(256*3), :]
apostraphe = base_font[(256*8):(256*9), (256*3):(256*4), :]
dash = base_font[(256*8):(256*9), (256*4):(256*5), :]
colon = base_font[(256*8):(256*9), (256*5):(256*6), :]
d_apostraphe = base_font[(256*8):(256*9), (256*6):(256*7), :]
l_paren = base_font[(256*8):(256*9), (256*7):(256*8), :]
r_paren = base_font[(256*8):(256*9), (256*8):(256*9), :]

reg_excl = base_font[:(256*1), :(256*1), :]
double_excl = base_font[:(256*1), (256*1):(256*2), :]
reg_quest = base_font[:(256*1), (256*2):(256*3), :]
excl_quest = base_font[:(256*1), (256*3):(256*4), :]
tear = base_font[:(256*1), (256*4):(256*5), :]
percent = base_font[:(256*1), (256*5):(256*6), :]
slash = base_font[:(256*1), (256*6):(256*7), :]
cur_quote_1 = base_font[:(256*1), (256*14):(256*15), :]
cur_quote_2 = base_font[:(256*1), (256*15):(256*16), :]

heart = base_font[(256*1):(256*2), (256*4):(256*5), :]
star = base_font[(256*1):(256*2), (256*5):(256*6), :]
note = base_font[(256*1):(256*2), (256*6):(256*7), :]

title_numbers = title_font[(256*0):(256*1), :(256*10), :]
title_caps_1 = title_font[(256*0):(256*1), (256*10):, :]
title_caps_2 = title_font[(256*1):(256*2), :, :]
title_caps_3 = title_font[(256*2):(256*3), :(256*4), :]

# Punctuation
base_font = np.concatenate((blank_image, ital_excl, d_apostraphe, reg_excl,
                            double_excl, percent, excl_quest, apostraphe,
                            l_paren, r_paren, star, heart, comma, dash, period, slash), axis=1)

blank_4 = np.concatenate((blank_image, blank_image, blank_image, blank_image), axis=1)
base_font_2 = np.concatenate((colon, tear, cur_quote_1, reg_quest, cur_quote_2, ital_ques, note), axis=1)
base_font_3 = np.concatenate((blank_4, blank_image, blank_image), axis=1)
# title_font = 

damage_font = np.concatenate((base_font, title_numbers, base_font_2), axis=1)
damage_font = np.concatenate((damage_font, title_caps_1, title_caps_2, title_caps_3), axis=1)
damage_font = np.concatenate((damage_font, base_font_3), axis=1)
damage_font = np.concatenate((damage_font, title_caps_1, title_caps_2, title_caps_3), axis=1)

damage_font_2 = np.concatenate((base_font, title_numbers, base_font_2), axis=1)
damage_font_2 = np.concatenate((damage_font_2, fancy_caps_1, fancy_caps_2), axis=1)
damage_font_2 = np.concatenate((damage_font_2, base_font_3), axis=1)
damage_font_2 = np.concatenate((damage_font_2, title_caps_1, title_caps_2, title_caps_3), axis=1)
"""
fancy_font = np.concatenate((base_font, numbers_1, numbers_2, base_font_2), axis=1)
fancy_font = np.concatenate((fancy_font, fancy_caps_1, fancy_caps_2), axis=1)
# fancy_font = np.concatenate((fancy_font, reg_caps_1, reg_caps_2, reg_caps_3), axis=1)
fancy_font = np.concatenate((fancy_font, base_font_3), axis=1)
fancy_font = np.concatenate((fancy_font, lower_1, lower_2), axis=1)
reshaped_fancy = np.zeros([2560, 2304, 4], dtype=fancy_font.dtype)
for i in range(9):
    reshaped_fancy[(i*256):((i+1)*256), :, :] = fancy_font[:, (i*2304):((i+1)*2304), :]
remaining_fancy = fancy_font[:, (9*2304):, :]
reshaped_fancy[(9*256):(10*256), :remaining_fancy.shape[1], :] = remaining_fancy 
"""

reg_font = np.concatenate((base_font, numbers_1, numbers_2, base_font_2), axis=1)
reg_font = np.concatenate((reg_font, reg_caps_1, reg_caps_2, reg_caps_3), axis=1)
reg_font = np.concatenate((reg_font, base_font_3), axis=1)
reg_font = np.concatenate((reg_font, lower_1, lower_2), axis=1)
reshaped_reg = np.zeros([3328, 1792, 4], dtype=reg_font.dtype)
for i in range(12):
    reshaped_reg[(i*256):((i+1)*256), :, :] = reg_font[:, (i*1792):((i+1)*1792), :]
remaining_reg = reg_font[:, (12*1792):, :]
reshaped_reg[(12*256):, :remaining_reg.shape[1], :] = remaining_reg 

damage_numbers = np.concatenate((title_numbers, reg_excl, double_excl), axis=1)

def set_color(color, name):
    new_font = np.copy(damage_font)
    new_font[:, :, :3] = color
    imsave("damage_font_" + name, new_font)
    
    new_font = np.copy(damage_font_2)
    new_font[:, :, :3] = color
    imsave("damage_font_2_" + name, new_font)
    
    # new_font = np.copy(reshaped_fancy)
    # new_font[:, :, :3] = color
    # imsave("fancy_font_" + name,  new_font)
    
    new_font = np.copy(damage_numbers)
    new_font[:, :, :3] = color
    imsave("damage_numbers_" + name, new_font)
    
    new_font = np.copy(reshaped_reg)
    new_font[:, :, :3] = color
    imsave("reg_font_" + name, new_font)
    return new_font

set_color([0, 0, 0], "black.png")
"""
set_color([128, 0, 0], "red.png")
damage_font_gold  = set_color([192, 128, 0], "gold.png")
damage_font_blue = set_color([0, 0, 128], "blue.png")
damage_font_pink = set_color([192, 0, 128], "pink.png")
damage_font_green = set_color([0, 128, 0], "green.png")
damage_font_white = set_color([255, 255, 255], "white.png")
damage_font_dark_grey = set_color([128, 128, 128], "dgray.png")
damage_font_light_grey = set_color([192, 192, 192], "lgray.png")
damage_font_light_blue = set_color([128, 128, 255], "lblue.png")
"""
