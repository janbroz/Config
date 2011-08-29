import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import Data.Monoid (mappend)
import qualified Data.Map as M
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Actions.Volume -- From the package xmonad-extras

-- Main
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myConfig = defaultConfig {
  manageHook          = myManageHook,
  layoutHook          = myLayoutHook,
  focusedBorderColor  = myFocusedColorBorder,
  modMask             = myModMask,
  terminal            = "gnome-terminal"
  } `additionalKeys` myKeys

-- xmobar stuff.
myBar = "xmobar"
-- Determines what's being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#999999" "" . wrap "<" ">" }
-- Keybinding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- My Config:
myManageHook = manageDocks <+> manageHook defaultConfig
myLayoutHook = avoidStruts $ layoutHook defaultConfig
myModMask    = mod4Mask
-- Black border, change to #FF0000 if needed red.
myFocusedColorBorder = "#FF0000"
-- My keys
myKeys = [((mod4Mask, xK_b), spawn "xmobar"),
          ((mod4Mask, xK_g), spawn "google-chrome"),
          ((mod4Mask, xK_q), spawn "xmonad --recompile && xmonad --restart"), -- :(
          ((mod4Mask, xK_e), spawn "emacs"),
          ((mod4Mask, xK_s), spawn "evince"),
          ((mod4Mask, xK_a), spawn "sh xmonadWorking.sh"),
          -- Use this if you have problems with xmonad-extras:
            -- ((0, xK_F7), spawn "amixer -q set PCM 10+ unmute"),
            -- ((0, xK_F6), spawn "amixer -q set PCM 10- unmute"),
            -- ((0, xK_F8), spawn "amixer -q set PCM toggle"),
          ((0, xK_F7), raiseVolume 4 >> return ()),
          ((0, xK_F6), lowerVolume 4 >> return ()),
          ((0, xK_F8), toggleMute >> return ()),
          ((mod4Mask .|. shiftMask, xK_s), spawn "gksudo pm-suspend")]

