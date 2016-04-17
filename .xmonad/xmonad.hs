import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Config.Bepo
import XMonad.Actions.Volume
import Data.Map    (fromList)
import Data.Monoid (mappend)

main = do
  xmproc <- spawnPipe "/home/arnaud/.cabal/bin/xmobar /home/arnaud/.xmobarrc"
  xmonad $ bepoConfig
    {
    keys =
    keys bepoConfig `mappend`
        \c -> fromList [
                ((0, xK_F6), lowerVolume 5 >> return ()),
                ((0, xK_F7), raiseVolume 5 >> return ()),
                ((0, xK_Super_L), return ())
        ],
      manageHook = manageDocks <+> manageHook defaultConfig
      , layoutHook = avoidStruts  $  layoutHook defaultConfig
      , terminal = "xfce4-terminal"
    }
