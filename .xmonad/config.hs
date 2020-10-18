import Control.Monad
import XMonad
import XMonad.Layout.Spacing
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig

myTerminal = "xfce4-terminal --hide-menubar"

myStartupHook = do
    spawn "fcitx -r -d"

main = xmonad <=< xmobar $ def
    { terminal    = myTerminal
    , modMask     = mod4Mask
    , borderWidth = 0
    , startupHook = myStartupHook
    , handleEventHook = fullscreenEventHook
    , layoutHook = spacingRaw True (Border 40 0 40 0) True (Border 0 40 0 40) True $ Tall 1 (3/100) (1/2) ||| Full
    } `additionalKeysP` myKeys

myKeys =
    [ ("M-p", spawn "rofi -show drun -show-icons")
    ]
