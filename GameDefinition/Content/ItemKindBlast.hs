-- Copyright (c) 2008--2011 Andres Loeh
-- Copyright (c) 2010--2019 Mikolaj Konarski and others (see git history)
-- This file is a part of the computer game Allure of the Stars
-- and is released under the terms of the GNU Affero General Public License.
-- For license and copyright information, see the file LICENSE.
--
-- | Blast definitions.
module Content.ItemKindBlast
  ( -- * Group name patterns
    pattern S_FIRECRACKER, pattern S_VIOLENT_FRAGMENTATION, pattern S_FRAGMENTATION, pattern S_FOCUSED_FRAGMENTATION, pattern S_VIOLENT_CONCUSSION, pattern S_CONCUSSION, pattern S_FOCUSED_CONCUSSION, pattern S_VIOLENT_FLASH, pattern S_SPARK, pattern S_FOCUSED_FLASH, pattern S_GLASS_HAIL, pattern S_FOCUSED_GLASS_HAIL, pattern S_PHEROMONE, pattern S_CALMING_MIST, pattern S_DISTRESSING_ODOR, pattern S_HEALING_MIST, pattern S_HEALING_MIST_2, pattern S_WOUNDING_MIST, pattern S_DISTORTION, pattern S_SMOKE, pattern S_BOILING_WATER, pattern S_GLUE, pattern S_WASTE, pattern S_ANTI_SLOW_MIST, pattern S_ANTIDOTE_MIST, pattern S_SLEEP_MIST, pattern S_CURRENT_DISCHARGE, pattern S_CURRENT_RECHARGE, pattern S_DENSE_SHOWER, pattern S_SPARSE_SHOWER, pattern S_MELEE_PROTECTIVE_BALM, pattern S_RANGE_PROTECTIVE_BALM, pattern S_DEFENSELESSNESS_RUNOUT, pattern S_RESOLUTION_DUST, pattern S_HASTE_SPRAY, pattern S_EYE_DROP, pattern S_IRON_FILING, pattern S_SMELLY_DROPLET, pattern S_EYE_SHINE, pattern S_WHISKEY_SPRAY, pattern S_YOUTH_SPRINKLE, pattern S_POISON_CLOUD, pattern S_BURNING_OIL_2, pattern S_BURNING_OIL_3, pattern S_BURNING_OIL_4
  , blastNoStatOf, blastBonusStatOf
  , pattern ARMOR_MISC
  , pattern S_VIOLENT_SLOWNESS_MIST, pattern S_SLOWNESS_MIST, pattern S_FOCUSED_SLOWNESS_MIST, pattern S_PAINT_DROPLET, pattern S_RHINO_HOLOGRAM
  , pattern ADVERTISEMENT, pattern STORY_TELLING
  , pattern FIRE_SOURCE, pattern OIL_SOURCE, pattern WATER_SOURCE, pattern COLD_SOURCE, pattern BLAST_SOURCE
  , blastsGNSingleton, blastsGN
  , -- * Content
    blasts
  ) where

import Prelude ()

import Game.LambdaHack.Core.Prelude

import Content.ItemKindTemporary
import Game.LambdaHack.Content.ItemKind
import Game.LambdaHack.Core.Dice
import Game.LambdaHack.Definition.Ability
import Game.LambdaHack.Definition.Color
import Game.LambdaHack.Definition.Defs
import Game.LambdaHack.Definition.Flavour

-- * Group name patterns

blastsGNSingleton :: [GroupName ItemKind]
blastsGNSingleton =
       [S_FIRECRACKER, S_VIOLENT_FRAGMENTATION, S_FRAGMENTATION, S_FOCUSED_FRAGMENTATION, S_VIOLENT_CONCUSSION, S_CONCUSSION, S_FOCUSED_CONCUSSION, S_VIOLENT_FLASH, S_SPARK, S_FOCUSED_FLASH, S_GLASS_HAIL, S_FOCUSED_GLASS_HAIL, S_PHEROMONE, S_CALMING_MIST, S_DISTRESSING_ODOR, S_HEALING_MIST, S_HEALING_MIST_2, S_WOUNDING_MIST, S_DISTORTION, S_SMOKE, S_BOILING_WATER, S_GLUE, S_WASTE, S_ANTI_SLOW_MIST, S_ANTIDOTE_MIST, S_SLEEP_MIST, S_CURRENT_DISCHARGE, S_CURRENT_RECHARGE, S_DENSE_SHOWER, S_SPARSE_SHOWER, S_MELEE_PROTECTIVE_BALM, S_RANGE_PROTECTIVE_BALM, S_DEFENSELESSNESS_RUNOUT, S_RESOLUTION_DUST, S_HASTE_SPRAY, S_EYE_DROP, S_IRON_FILING, S_SMELLY_DROPLET, S_EYE_SHINE, S_WHISKEY_SPRAY, S_YOUTH_SPRINKLE, S_POISON_CLOUD, S_BURNING_OIL_2, S_BURNING_OIL_3, S_BURNING_OIL_4]
  ++ map firecrackerAt [1..4]
  ++ map blastNoStatOf noStatGN
  ++ map blastBonusStatOf bonusStatGN
  ++ [S_VIOLENT_SLOWNESS_MIST, S_SLOWNESS_MIST, S_FOCUSED_SLOWNESS_MIST, S_PAINT_DROPLET, S_RHINO_HOLOGRAM]

pattern S_FIRECRACKER, S_VIOLENT_FRAGMENTATION, S_FRAGMENTATION, S_FOCUSED_FRAGMENTATION, S_VIOLENT_CONCUSSION, S_CONCUSSION, S_FOCUSED_CONCUSSION, S_VIOLENT_FLASH, S_SPARK, S_FOCUSED_FLASH, S_GLASS_HAIL, S_FOCUSED_GLASS_HAIL, S_PHEROMONE, S_CALMING_MIST, S_DISTRESSING_ODOR, S_HEALING_MIST, S_HEALING_MIST_2, S_WOUNDING_MIST, S_DISTORTION, S_SMOKE, S_BOILING_WATER, S_GLUE, S_WASTE, S_ANTI_SLOW_MIST, S_ANTIDOTE_MIST, S_SLEEP_MIST, S_CURRENT_DISCHARGE, S_CURRENT_RECHARGE, S_DENSE_SHOWER, S_SPARSE_SHOWER, S_MELEE_PROTECTIVE_BALM, S_RANGE_PROTECTIVE_BALM, S_DEFENSELESSNESS_RUNOUT, S_RESOLUTION_DUST, S_HASTE_SPRAY, S_EYE_DROP, S_IRON_FILING, S_SMELLY_DROPLET, S_EYE_SHINE, S_WHISKEY_SPRAY, S_YOUTH_SPRINKLE, S_POISON_CLOUD, S_BURNING_OIL_2, S_BURNING_OIL_3, S_BURNING_OIL_4 :: GroupName ItemKind

pattern S_VIOLENT_SLOWNESS_MIST, S_SLOWNESS_MIST, S_FOCUSED_SLOWNESS_MIST, S_PAINT_DROPLET, S_RHINO_HOLOGRAM :: GroupName ItemKind

blastsGN :: [GroupName ItemKind]
blastsGN =
       [ARMOR_MISC]
    ++ [ADVERTISEMENT, STORY_TELLING]
    ++ [FIRE_SOURCE, OIL_SOURCE, WATER_SOURCE, COLD_SOURCE, BLAST_SOURCE]

pattern ARMOR_MISC :: GroupName ItemKind

pattern ADVERTISEMENT, STORY_TELLING :: GroupName ItemKind

pattern FIRE_SOURCE, OIL_SOURCE, WATER_SOURCE, COLD_SOURCE, BLAST_SOURCE :: GroupName ItemKind

pattern S_FIRECRACKER = GroupName "firecracker"
pattern S_VIOLENT_FRAGMENTATION = GroupName "violent fragmentation"
pattern S_FRAGMENTATION = GroupName "fragmentation"
pattern S_FOCUSED_FRAGMENTATION = GroupName "focused fragmentation"
pattern S_VIOLENT_CONCUSSION = GroupName "violent concussion"
pattern S_CONCUSSION = GroupName "concussion"
pattern S_FOCUSED_CONCUSSION = GroupName "focused concussion"
pattern S_VIOLENT_FLASH = GroupName "violent flash"
pattern S_SPARK = GroupName "spark"
pattern S_FOCUSED_FLASH = GroupName "focused flash"
pattern S_GLASS_HAIL = GroupName "glass hail"
pattern S_FOCUSED_GLASS_HAIL = GroupName "focused glass hail"
pattern S_PHEROMONE = GroupName "pheromone"
pattern S_CALMING_MIST = GroupName "calming mist"
pattern S_DISTRESSING_ODOR = GroupName "distressing odor"
pattern S_HEALING_MIST = GroupName "healing mist"
pattern S_HEALING_MIST_2 = GroupName "strong healing mist"
pattern S_WOUNDING_MIST = GroupName "wounding mist"
pattern S_DISTORTION = GroupName "distortion"
pattern S_SMOKE = GroupName "smoke"
pattern S_BOILING_WATER = GroupName "boiling water"
pattern S_GLUE = GroupName "glue"
pattern S_WASTE = GroupName "waste"
pattern S_ANTI_SLOW_MIST = GroupName "anti-slow mist"
pattern S_ANTIDOTE_MIST = GroupName "antidote mist"
pattern S_SLEEP_MIST = GroupName "sleep mist"
pattern S_CURRENT_DISCHARGE = GroupName "discharge current"
pattern S_CURRENT_RECHARGE = GroupName "recharge current"
pattern S_DENSE_SHOWER = GroupName "dense shower"
pattern S_SPARSE_SHOWER = GroupName "sparse shower"
pattern S_MELEE_PROTECTIVE_BALM = GroupName "melee protective balm"
pattern S_RANGE_PROTECTIVE_BALM = GroupName "ranged protective balm"
pattern S_DEFENSELESSNESS_RUNOUT = GroupName "PhD defense question"
pattern S_RESOLUTION_DUST = GroupName "resolution dust"
pattern S_HASTE_SPRAY = GroupName "haste spray"
pattern S_EYE_DROP = GroupName "eye drop"
pattern S_IRON_FILING = GroupName "iron filing"
pattern S_SMELLY_DROPLET = GroupName "smelly droplet"
pattern S_EYE_SHINE = GroupName "eye shine"
pattern S_WHISKEY_SPRAY = GroupName "whiskey spray"
pattern S_YOUTH_SPRINKLE = GroupName "youth sprinkle"
pattern S_POISON_CLOUD = GroupName "poison cloud"
pattern S_BURNING_OIL_2 = GroupName "burning oil 2"
pattern S_BURNING_OIL_3 = GroupName "burning oil 3"
pattern S_BURNING_OIL_4 = GroupName "burning oil 4"

firecrackerAt :: Int -> GroupName ItemKind
firecrackerAt n = GroupName $ "firecracker" <+> tshow n

blastNoStatOf :: GroupName ItemKind -> GroupName ItemKind
blastNoStatOf grp = GroupName $ fromGroupName grp <+> "mist"

blastBonusStatOf :: GroupName ItemKind -> GroupName ItemKind
blastBonusStatOf grp = GroupName $ fromGroupName grp <+> "dew"

pattern ARMOR_MISC = GroupName "miscellaneous armor"

-- ** Allure-specific
pattern S_VIOLENT_SLOWNESS_MIST = GroupName "violent nitrogen mist"
pattern S_SLOWNESS_MIST = GroupName "nitrogen mist"
pattern S_FOCUSED_SLOWNESS_MIST = GroupName "focused nitrogen mist"
pattern S_PAINT_DROPLET = GroupName "paint droplet"
pattern S_RHINO_HOLOGRAM = GroupName "rhino hologram"

pattern ADVERTISEMENT = GroupName "advertisement"
pattern STORY_TELLING = GroupName "story-telling"

pattern FIRE_SOURCE = GroupName "fire source"
pattern OIL_SOURCE = GroupName "oil source"
pattern WATER_SOURCE = GroupName "water source"
pattern COLD_SOURCE = GroupName "cold source"
pattern BLAST_SOURCE = GroupName "blast source"

-- * Content

blasts :: [ItemKind]
blasts =
  [burningOil2, burningOil3, burningOil4, firecracker1, firecracker2, firecracker3, firecracker4, firecracker5, spreadFragmentation, spreadFragmentation8, focusedFragmentation, spreadConcussion, spreadConcussion8, focusedConcussion, spreadFlash, spreadFlash8, focusedFlash, singleSpark, glassPiece, focusedGlass, fragrance, pheromone, mistCalming, odorDistressing, mistHealing, mistHealing2, mistWounding, distortion, smoke, boilingWater, glue, waste, mistAntiSlow, mistAntidote, mistSleep, currentDischarge, currentRecharge, denseShower, sparseShower, protectingBalmMelee, protectingBalmRanged, defenselessnessRunout, resolutionDust, hasteSpray,eyeDrop, ironFiling, smellyDroplet, eyeShine, whiskeySpray, youthSprinkle, poisonCloud, blastNoSkMove, blastNoSkMelee, blastNoSkDisplace, blastNoSkAlter, blastNoSkWait, blastNoSkMoveItem, blastNoSkProject, blastNoSkApply, blastBonusSkMove, blastBonusSkMelee, blastBonusSkDisplace, blastBonusSkAlter, blastBonusSkWait, blastBonusSkMoveItem, blastBonusSkProject, blastBonusSkApply]
  -- Allure-specific
  ++ [cruiseAdHologram, outerAdHologram, victoriaClassHologram, allureIntroHologram, spreadNitrogen, spreadNitrogen8, focusedNitrogen, paintSpray]

burningOil2,    burningOil3, burningOil4, firecracker1, firecracker2, firecracker3, firecracker4, firecracker5, spreadFragmentation, spreadFragmentation8, focusedFragmentation, spreadConcussion, spreadConcussion8, focusedConcussion, spreadFlash, spreadFlash8, focusedFlash, singleSpark, glassPiece, focusedGlass, fragrance, pheromone, mistCalming, odorDistressing, mistHealing, mistHealing2, mistWounding, distortion, smoke, boilingWater, glue, waste, mistAntiSlow, mistAntidote, mistSleep, currentDischarge, currentRecharge, denseShower, sparseShower, protectingBalmMelee, protectingBalmRanged, defenselessnessRunout, resolutionDust, hasteSpray, eyeDrop, ironFiling, smellyDroplet, eyeShine, whiskeySpray, youthSprinkle, poisonCloud, blastNoSkMove, blastNoSkMelee, blastNoSkDisplace, blastNoSkAlter, blastNoSkWait, blastNoSkMoveItem, blastNoSkProject, blastNoSkApply, blastBonusSkMove, blastBonusSkMelee, blastBonusSkDisplace, blastBonusSkAlter, blastBonusSkWait, blastBonusSkMoveItem, blastBonusSkProject, blastBonusSkApply :: ItemKind
-- Allure-specific
cruiseAdHologram,       outerAdHologram, victoriaClassHologram, allureIntroHologram, spreadNitrogen, spreadNitrogen8, focusedNitrogen, paintSpray :: ItemKind

-- We take care (e.g., in burningOil below) that blasts are not faster
-- than 100% fastest natural speed, or some frames would be skipped,
-- which is a waste of perfectly good frames.

-- * Parameterized blasts

burningOil :: Int -> GroupName ItemKind -> ItemKind
burningOil n grp = ItemKind
  { isymbol  = '*'
  , iname    = "burning oil"
  , ifreq    = [(grp, 1), (FIRE_SOURCE, 1), (OIL_SOURCE, 1)]
  , iflavour = zipPlain [BrYellow]
  , icount   = intToDice (4 + n * 3)
  , irarity  = [(1, 1)]
  , iverbHit = "sear"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity (min 100 $ n `div` 2 * 10)
               , SetFlag Fragile, SetFlag Blast
               , AddSkill SkShine 2 ]
  , ieffects = [ Burn 1
               , toOrganBad S_PACIFIED (2 + 1 `d` 2) ]
                   -- slips and frantically puts out fire
  , idesc    = "Sticky oil, burning brightly."
  , ikit     = []
  }
burningOil2 = burningOil 2 S_BURNING_OIL_2  -- 2 steps, 2 turns
burningOil3 = burningOil 3 S_BURNING_OIL_3  -- 3 steps, 2 turns
burningOil4 = burningOil 4 S_BURNING_OIL_4  -- 4 steps, 2 turns
firecracker :: Int -> ItemKind
firecracker n = ItemKind
  { isymbol  = '*'
  , iname    = "firecracker"
  , ifreq    = [(if n == 5
                 then S_FIRECRACKER
                 else firecrackerAt n, 1)]
  , iflavour = zipPlain [brightCol !! ((n + 2) `mod` length brightCol)]
  , icount   = if n <= 3 then 1 `d` min 2 n else 2 + 1 `d` 2
  , irarity  = [(1, 1)]
  , iverbHit = if n >= 4 then "singe" else "crack"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 5
               , SetFlag Fragile, SetFlag Blast
               , AddSkill SkShine $ intToDice $ 1 + n `div` 2 ]
  , ieffects = [if n >= 4 then Burn 1 else RefillCalm (-2)]
               ++ [DropBestWeapon | n >= 4]
               ++ [OnSmash $ Explode $ firecrackerAt (n - 1) | n >= 2]
  , idesc    = "Scraps of burnt paper, covering little pockets of black powder, buffeted by colorful explosions."
  , ikit     = []
  }
firecracker5 = firecracker 5
firecracker4 = firecracker 4
firecracker3 = firecracker 3
firecracker2 = firecracker 2
firecracker1 = firecracker 1

-- * Focused blasts

spreadFragmentation = ItemKind
  { isymbol  = '*'
  , iname    = "fragmentation burst"
  , ifreq    = [(S_VIOLENT_FRAGMENTATION, 1), (FIRE_SOURCE, 1)]
  , iflavour = zipPlain [Red]
  , icount   = 15  -- strong but few, so not always hits target
  , irarity  = [(1, 1)]
  , iverbHit = "tear apart"
  , iweight  = 1
  , idamage  = 3 `d` 1  -- deadly and adjacent actor hit by 2 on average;
                        -- however, moderate armour blocks completely
  , iaspects = [ ToThrow $ ThrowMod 100 20 4  -- 4 steps, 1 turn
               , SetFlag Lobable, SetFlag Fragile, SetFlag Blast
               , AddSkill SkShine 3, AddSkill SkHurtMelee $ -12 * 5 ]
  , ieffects = [DropItem 1 1 COrgan CONDITION]
  , idesc    = "Flying shards, flame and smoke."
  , ikit     = []
  }
spreadFragmentation8 = spreadFragmentation
  { ifreq    = [(S_FRAGMENTATION, 1), (FIRE_SOURCE, 1)]
  , icount   = 9
  , iaspects = [ ToThrow $ ThrowMod 100 10 2  -- 2 steps, 1 turn
               , SetFlag Lobable, SetFlag Fragile, SetFlag Blast
               , AddSkill SkShine 3, AddSkill SkHurtMelee $ -12 * 5 ]
      -- smaller radius, so worse for area effect, but twice the direct damage
  }
focusedFragmentation = ItemKind
  { isymbol  = '`'
  , iname    = "deflagration ignition"  -- improvised fertilizer, etc.
  , ifreq    = [(S_FOCUSED_FRAGMENTATION, 1), (FIRE_SOURCE, 1)]
  , iflavour = zipPlain [BrYellow]
  , icount   = 4  -- 32 in total vs 16; on average 4 hits
  , irarity  = [(1, 1)]
  , iverbHit = "ignite"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toLinger 0  -- 0 steps, 1 turn
               , SetFlag Fragile, SetFlag Blast ]
      -- when the target position is occupied, the explosion starts one step
      -- away, hence we set range to 0 steps, to limit dispersal
  , ieffects = [OnSmash $ Explode S_FRAGMENTATION]
  , idesc    = idesc spreadFragmentation
  , ikit     = []
  }
spreadConcussion = ItemKind
  { isymbol  = '*'
  , iname    = "concussion blast"
  , ifreq    = [(S_VIOLENT_CONCUSSION, 1), (BLAST_SOURCE, 1)]
                 -- only the strongest explosion breaches
  , iflavour = zipPlain [Magenta]
  , icount   = 17
  , irarity  = [(1, 1)]
  , iverbHit = "shock"
  , iweight  = 1
  , idamage  = 1 `d` 1  -- only air pressure, so not as deadly as fragmentation,
                        -- but armour can't block completely that easily
  , iaspects = [ ToThrow $ ThrowMod 100 20 4  -- 4 steps, 1 turn
               , SetFlag Lobable, SetFlag Fragile, SetFlag Blast
               , AddSkill SkShine 3, AddSkill SkHurtMelee $ -8 * 5 ]
      -- outdoors it has short range, but we only model indoors in the game;
      -- it's much faster than black powder shock wave, but we are beyond
      -- human-noticeable speed differences on short distances anyway
  , ieffects = [ DropItem maxBound 1 CEqp ARMOR_MISC
               , PushActor (ThrowMod 400 25 1)  -- 1 step, fast; after DropItem
                   -- this produces spam for braced actors; too bad
               , toOrganBad S_IMMOBILE 3  -- no balance
               , toOrganBad S_DEAFENED 23 ]
  , idesc    = "Shock wave, hot gases and smoke. Able to demolish small obstacles."
  , ikit     = []
  }
spreadConcussion8 = spreadConcussion
  {  ifreq    = [(S_CONCUSSION, 1), (BLAST_SOURCE, 1)]
                 -- only the strongest explosion breaches
  , icount   = 10
  , iaspects = [ ToThrow $ ThrowMod 100 10 2  -- 2 steps, 1 turn
               , SetFlag Lobable, SetFlag Fragile, SetFlag Blast
               , AddSkill SkShine 3, AddSkill SkHurtMelee $ -8 * 5 ]
  }
focusedConcussion = ItemKind
  { isymbol  = '`'
  , iname    = "detonation ignition"  -- stabilized high explosive liquid
  , ifreq    = [(S_FOCUSED_CONCUSSION, 1), (BLAST_SOURCE, 1)]
  , iflavour = zipPlain [BrGreen]
  , icount   = 4
  , irarity  = [(1, 1)]
  , iverbHit = "ignite"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toLinger 0  -- 0 steps, 1 turn
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [OnSmash $ Explode S_CONCUSSION]
  , idesc    = idesc spreadConcussion
  , ikit     = []
  }
spreadFlash = ItemKind
  { isymbol  = '`'
  , iname    = "magnesium flash"  -- or aluminum, but let's stick to one
  , ifreq    = [(S_VIOLENT_FLASH, 1), (FIRE_SOURCE, 1)]
  , iflavour = zipPlain [BrWhite]
  , icount   = 18
  , irarity  = [(1, 1)]
  , iverbHit = "dazzle"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ ToThrow $ ThrowMod 100 20 4  -- 4 steps, 1 turn
               , SetFlag Fragile, SetFlag Blast
               , AddSkill SkShine 5 ]
  , ieffects = [ toOrganBad S_WEAKENED 20
               , Discharge $ 40 - 1 `d` 20 ]
                 -- Wikipedia says: blind for five seconds and afterimage
                 -- for much longer, harming aim. But blind is boring
                 -- and prevents the player from seeing fun explosions
                 -- such as this one.
  , idesc    = "A very bright flash of fire, causing long-lasting afterimages."
  , ikit     = []
  }
spreadFlash8 = spreadFlash
  { iname    = "spark"
  , ifreq    = [(S_SPARK, 1), (FIRE_SOURCE, 1)]
  , icount   = 7
  , iverbHit = "singe"
  , iaspects = [ ToThrow $ ThrowMod 100 10 2  -- 2 steps, 1 turn
               , SetFlag Fragile, SetFlag Blast
               , AddSkill SkShine 5 ]
  }
focusedFlash = ItemKind
  { isymbol  = '`'
  , iname    = "magnesium ignition"
  , ifreq    = [(S_FOCUSED_FLASH, 1), (FIRE_SOURCE, 1)]
  , iflavour = zipPlain [BrBlue]
  , icount   = 5
  , irarity  = [(1, 1)]
  , iverbHit = "ignite"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toLinger 0  -- 0 steps, 1 turn
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [OnSmash $ Explode S_SPARK]
  , idesc    = idesc spreadFlash
  , ikit     = []
  }
singleSpark = spreadFlash
  { iname    = "single spark"
  , ifreq    = [(S_SINGLE_SPARK, 1)]  -- too weak to start a fire
  , icount   = 1
  , iverbHit = "spark"
  , iaspects = [ toLinger 5  -- 1 step, 1 turn
               , SetFlag Fragile, SetFlag Blast
               , AddSkill SkShine 3 ]
  , ieffects = []
  , idesc    = "A glowing ember."
  , ikit     = []
  }
glassPiece = ItemKind
  { isymbol  = '*'
  , iname    = "glass piece"
  , ifreq    = [(S_GLASS_HAIL, 1)]
  , iflavour = zipPlain [Blue]
  , icount   = 8
  , irarity  = [(1, 1)]
  , iverbHit = "cut"
  , iweight  = 1
  , idamage  = 2 `d` 1
  , iaspects = [ ToThrow $ ThrowMod 100 20 4  -- 4 steps, 1 turn
               , SetFlag Fragile, SetFlag Blast
               , AddSkill SkHurtMelee $ -15 * 5 ]
                 -- brittle, not too dense; armor blocks
  , ieffects = []
  , idesc    = "Swift, sharp edges."
  , ikit     = []
  }
focusedGlass = glassPiece  -- when blowing up windows
  { ifreq    = [(S_FOCUSED_GLASS_HAIL, 1)]
  , icount   = 4
  , iaspects = [ toLinger 0  -- 0 steps, 1 turn
               , SetFlag Fragile, SetFlag Blast
               , AddSkill SkHurtMelee $ -15 * 5 ]
  , ieffects = [OnSmash $ Explode S_GLASS_HAIL]
  }

-- * Assorted blasts that don't induce conditions or not used mainly for them

fragrance = ItemKind
  { isymbol  = '`'
  , iname    = "fragrance"  -- instant, fast fragrance
  , ifreq    = [(S_FRAGRANCE, 1)]
  , iflavour = zipPlain [Magenta]
  , icount   = 12
  , irarity  = [(1, 1)]
  , iverbHit = "engulf"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toLinger 10  -- 2 steps, 1 turn
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [Impress, toOrganGood S_ROSE_SMELLING 45]
  -- Linger 10, because sometimes it takes 2 turns due to starting just
  -- before actor turn's end (e.g., via a necklace).
  , idesc    = "A pleasant scent."
  , ikit     = []
  }
pheromone = ItemKind
  { isymbol  = '`'
  , iname    = "musky whiff"  -- a kind of mist rather than fragrance
  , ifreq    = [(S_PHEROMONE, 1)]
  , iflavour = zipPlain [BrMagenta]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "tempt"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 10  -- 2 steps, 2 turns
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [Dominate]
  , idesc    = "A sharp, strong scent."
  , ikit     = []
  }
mistCalming = ItemKind  -- unused
  { isymbol  = '`'
  , iname    = "mist"
  , ifreq    = [(S_CALMING_MIST, 1)]
  , iflavour = zipPlain [BrGreen]
  , icount   = 8
  , irarity  = [(1, 1)]
  , iverbHit = "sooth"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 5  -- 1 step, 1 turn
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [RefillCalm 2]
  , idesc    = "A soothing, gentle cloud."
  , ikit     = []
  }
odorDistressing = ItemKind
  { isymbol  = '`'
  , iname    = "distressing whiff"
  , ifreq    = [(S_DISTRESSING_ODOR, 1)]
  , iflavour = zipFancy [BrRed]  -- salmon
  , icount   = 8
  , irarity  = [(1, 1)]
  , iverbHit = "distress"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toLinger 10  -- 2 steps, 1 turn
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [ RefillCalm (-10)
               , toOrganBad S_FOUL_SMELLING (20 + 1 `d` 5)
               , toOrganBad S_IMPATIENT (2 + 1 `d` 2) ]
  , idesc    = "It turns the stomach."  -- and so can't stand still
  , ikit     = []
  }
mistHealing = ItemKind
  { isymbol  = '`'
  , iname    = "mist"  -- powerful, so slow and narrow
  , ifreq    = [(S_HEALING_MIST, 1)]
  , iflavour = zipFancy [BrGreen]
  , icount   = 8
  , irarity  = [(1, 1)]
  , iverbHit = "revitalize"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 5  -- 1 step, 1 turn
               , SetFlag Fragile, SetFlag Blast
               , AddSkill SkShine 1 ]
  , ieffects = [RefillHP 2]
  , idesc    = "It fills the air with light and life. And lots of organic chemicals."
  , ikit     = []
  }
mistHealing2 = ItemKind
  { isymbol  = '`'
  , iname    = "mist"
  , ifreq    = [(S_HEALING_MIST_2, 1)]
  , iflavour = zipPlain [Green]
  , icount   = 8
  , irarity  = [(1, 1)]
  , iverbHit = "revitalize"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 5  -- 1 step, 1 turn
               , SetFlag Fragile, SetFlag Blast
               , AddSkill SkShine 2 ]
  , ieffects = [RefillHP 4]
  , idesc    = "At its touch, wounds close and bruises fade. Not the most frugal way to apply nanobots, though."
  , ikit     = []
  }
mistWounding = ItemKind
  { isymbol  = '`'
  , iname    = "mist"
  , ifreq    = [(S_WOUNDING_MIST, 1)]
  , iflavour = zipPlain [BrRed]
  , icount   = 8
  , irarity  = [(1, 1)]
  , iverbHit = "devitalize"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 5  -- 1 step, 1 turn
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [RefillHP (-2)]
  , idesc    = "The air itself stings and itches."
  , ikit     = []
  }
distortion = ItemKind  -- currently unused
  { isymbol  = 'v'
  , iname    = "vortex"
  , ifreq    = [(S_DISTORTION, 1)]
  , iflavour = zipPlain [White]
  , icount   = 8  -- braced are immune to Teleport; avoid failure messages
  , irarity  = [(1, 1)]
  , iverbHit = "engulf"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toLinger 10  -- 2 steps, 1 turn
               , SetFlag Lobable, SetFlag Fragile, SetFlag Blast ]
  , ieffects = [Teleport $ 15 + 1 `d` 10]
  , idesc    = "The air shifts oddly, as though light is being warped."
  , ikit     = []
  }
smoke = ItemKind  -- when stuff burns out
  { isymbol  = '`'
  , iname    = "smoke fume"  -- pluralizes better than 'smokes'
  , ifreq    = [(S_SMOKE, 1)]
  , iflavour = zipPlain [BrBlack]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "choke"  -- or "obscure"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 20  -- 4 steps, 2 turns
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [toOrganBad S_WITHHOLDING (5 + 1 `d` 3)]
                  -- choking and tears, can roughly see, but not aim
  , idesc    = "Twirling clouds of grey smoke."
  , ikit     = []
  }
boilingWater = ItemKind
  { isymbol  = '*'
  , iname    = "boiling water"
  , ifreq    = [(S_BOILING_WATER, 1)]  -- not enough water to create puddles
  , iflavour = zipPlain [White]
  , icount   = 18
  , irarity  = [(1, 1)]
  , iverbHit = "boil"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 30  -- 6 steps, 2 turns
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [Burn 1]
  , idesc    = "It bubbles and hisses."
  , ikit     = []
  }
glue = ItemKind
  { isymbol  = '*'
  , iname    = "glue droplet"
  , ifreq    = [(S_GLUE, 1)]
  , iflavour = zipPlain [Cyan]
  , icount   = 8  -- Paralyze doesn't stack; avoid failure messages
  , irarity  = [(1, 1)]
  , iverbHit = "glue"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 20  -- 4 steps, 2 turns
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [Paralyze 10]
  , idesc    = "Thick and clinging."
  , ikit     = []
  }
waste = ItemKind
  { isymbol  = '*'
  , iname    = "waste piece"
  , ifreq    = [(S_WASTE, 1)]
  , iflavour = zipPlain [Brown]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "splosh"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [ toOrganBad S_FOUL_SMELLING (30 + 1 `d` 10)
               , toOrganBad S_DISPOSSESSED (10 + 1 `d` 5) ]
  , idesc    = "Sodden and foul-smelling."
  , ikit     = []
  }
mistAntiSlow = ItemKind
  { isymbol  = '`'
  , iname    = "mist"
  , ifreq    = [(S_ANTI_SLOW_MIST, 1)]
  , iflavour = zipFancy [BrYellow]
  , icount   = 8
  , irarity  = [(1, 1)]
  , iverbHit = "propel"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 5  -- 1 step, 1 turn
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [DropItem 1 1 COrgan S_SLOWED]
  , idesc    = "A cleansing rain."
  , ikit     = []
  }
mistAntidote = ItemKind
  { isymbol  = '`'
  , iname    = "mist"
  , ifreq    = [(S_ANTIDOTE_MIST, 1)]
  , iflavour = zipFancy [BrBlue]
  , icount   = 8
  , irarity  = [(1, 1)]
  , iverbHit = "cure"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 5  -- 1 step, 1 turn
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [DropItem 1 maxBound COrgan S_POISONED]
  , idesc    = "Washes away death's dew."
  , ikit     = []
  }
mistSleep = ItemKind
  { isymbol  = '`'
  , iname    = "mist"
  , ifreq    = [(S_SLEEP_MIST, 1)]
  , iflavour = zipFancy [BrMagenta]
  , icount   = 8
  , irarity  = [(1, 1)]
  , iverbHit = "put to sleep"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 5  -- 1 step, 1 turn
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [PutToSleep]
  , idesc    = "Lulls weary warriors."
  , ikit     = []
  }
currentDischarge = ItemKind
  { isymbol  = 'v'
  , iname    = "static current"
  , ifreq    = [(S_CURRENT_DISCHARGE, 1)]
  , iflavour = zipFancy [BrBlue]
  , icount   = 12
  , irarity  = [(1, 1)]
  , iverbHit = "reset"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [Discharge $ 40 - 1 `d` 20]  -- sometimes recharges spent items
  , idesc    = ""
  , ikit     = []
  }
currentRecharge = currentDischarge
  { ifreq    = [(S_CURRENT_RECHARGE, 1)]
  , iflavour = zipFancy [BrRed]
  , ieffects = [Discharge 0]  -- beneficial, except for harmful periodic effects
  , idesc    = ""
  }

-- * Condition-inducing blasts

-- Almost all have @toLinger 10@, that travels 2 steps in 1 turn.
-- These are very fast projectiles, not getting into the way of big
-- actors and not burdening the engine for long.
-- A few are slower 'mists'.

denseShower = ItemKind
  { isymbol  = '`'
  , iname    = "dense shower"
  , ifreq    = [(S_DENSE_SHOWER, 1)]
  , iflavour = zipFancy [Green]
  , icount   = 12
  , irarity  = [(1, 1)]
  , iverbHit = "strengthen"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [toOrganGood S_STRENGTHENED 5]
  , idesc    = "A thick rain of droplets."
  , ikit     = []
  }
sparseShower = ItemKind
  { isymbol  = '`'
  , iname    = "sparse shower"
  , ifreq    = [(S_SPARSE_SHOWER, 1)]
  , iflavour = zipFancy [Red]
  , icount   = 8
  , irarity  = [(1, 1)]
  , iverbHit = "weaken"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [toOrganBad S_WEAKENED 7]
  , idesc    = "Light droplets that cling to clothing."
  , ikit     = []
  }
protectingBalmMelee = ItemKind
  { isymbol  = '`'
  , iname    = "oil spray"
  , ifreq    = [(S_MELEE_PROTECTIVE_BALM, 1), (OIL_SOURCE, 1)]
  , iflavour = zipFancy [Brown]
  , icount   = 6
  , irarity  = [(1, 1)]
  , iverbHit = "old"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toLinger 0  -- 0 steps, 1 turn
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [toOrganGood S_PROTECTED_FROM_MELEE (3 + 1 `d` 3)]
  , idesc    = "Thin and slippery."
  , ikit     = []
  }
protectingBalmRanged = ItemKind
  { isymbol  = '`'
  , iname    = "balm droplet"
  , ifreq    = [(S_RANGE_PROTECTIVE_BALM, 1)]
  , iflavour = zipPlain [BrYellow]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "balm"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [toOrganGood S_PROTECTED_FROM_RANGED (3 + 1 `d` 3)]
  , idesc    = "A thick ointment that hardens under high speed stress."
  , ikit     = []
  }
defenselessnessRunout = ItemKind
  { isymbol  = '`'
  , iname    = "acid spray"
  , ifreq    = [(S_DEFENSELESSNESS_RUNOUT, 1)]
  , iflavour = zipFancy [BrRed]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "dissolve"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [toOrganBad S_DEFENSELESS (3 + 1 `d` 3)]
  , idesc    = "A searing fluid that sticks to the skin."
  , ikit     = []
  }
resolutionDust = ItemKind
  { isymbol  = '`'
  , iname    = "resolution dust"
  , ifreq    = [(S_RESOLUTION_DUST, 1)]
  , iflavour = zipPlain [Brown]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "calm"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [toOrganGood S_RESOLUTE (3 + 1 `d` 3)]
                 -- short enough duration that @calmEnough@ not a big problem
  , idesc    = "A handful of honest earth, to strengthen the soul."
  , ikit     = []
  }
hasteSpray = ItemKind
  { isymbol  = '`'
  , iname    = "haste spray"
  , ifreq    = [(S_HASTE_SPRAY, 1)]
  , iflavour = zipFancy [BrYellow]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "haste"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [toOrganGood S_HASTED (3 + 1 `d` 3)]
  , idesc    = "A quick spurt."
  , ikit     = []
  }
eyeDrop = ItemKind
  { isymbol  = '`'
  , iname    = "eye drop"
  , ifreq    = [(S_EYE_DROP, 1)]
  , iflavour = zipFancy [BrCyan]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "cleanse"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [toOrganGood S_FAR_SIGHTED (3 + 1 `d` 3)]
  , idesc    = "Not to be taken orally."
  , ikit     = []
  }
ironFiling = ItemKind
  { isymbol  = '`'
  , iname    = "iron filing"
  , ifreq    = [(S_IRON_FILING, 1)]
  , iflavour = zipPlain [Red]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "blind"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [toOrganBad S_BLIND (10 + 1 `d` 10)]
  , idesc    = "A shaving of bright metal."
  , ikit     = []
  }
smellyDroplet = ItemKind
  { isymbol  = '`'
  , iname    = "smelly droplet"
  , ifreq    = [(S_SMELLY_DROPLET, 1)]
  , iflavour = zipFancy [Blue]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "sensitize"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [toOrganGood S_KEEN_SMELLING (5 + 1 `d` 3)]
  , idesc    = "A viscous lump that stains the skin."
  , ikit     = []
  }
eyeShine = ItemKind
  { isymbol  = '`'
  , iname    = "eye shine"
  , ifreq    = [(S_EYE_SHINE, 1)]
  , iflavour = zipFancy [Cyan]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "smear"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [toOrganGood S_SHINY_EYED (3 + 1 `d` 3)]
  , idesc    = "They almost glow in the dark."
  , ikit     = []
  }
whiskeySpray = ItemKind
  { isymbol  = '`'
  , iname    = "whiskey spray"
  , ifreq    = [(S_WHISKEY_SPRAY, 1)]
  , iflavour = zipFancy [Brown]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "inebriate"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [toOrganGood S_DRUNK (3 + 1 `d` 3)]
  , idesc    = "It burns in the best way."
  , ikit     = []
  }
youthSprinkle = ItemKind
  { isymbol  = '`'
  , iname    = "youth sprinkle"
  , ifreq    = [(S_YOUTH_SPRINKLE, 1)]
  , iflavour = zipFancy [BrGreen]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "sprinkle"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [ toOrganGood S_ROSE_SMELLING (40 + 1 `d` 20)
               , toOrganNoTimer S_REGENERATING ]
  , idesc    = "Bright and smelling of the Spring."
  , ikit     = []
  }
poisonCloud = ItemKind
  { isymbol  = '`'
  , iname    = "poison cloud"
  , ifreq    = [(S_POISON_CLOUD, 1)]
  , iflavour = zipFancy [BrMagenta]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "poison"
  , iweight  = 0  -- lingers, blocking path
  , idamage  = 0
  , iaspects = [ ToThrow $ ThrowMod 10 100 2  -- 2 steps, 2 turns
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [toOrganNoTimer S_POISONED]
  , idesc    = "Choking gas that stings the eyes."
  , ikit     = []
  }
blastNoStat :: GroupName ItemKind -> ItemKind
blastNoStat grp = ItemKind
  { isymbol  = '`'
  , iname    = "mist"
  , ifreq    = [(blastNoStatOf grp, 1)]
  , iflavour = zipFancy [White]
  , icount   = 12
  , irarity  = [(1, 1)]
  , iverbHit = "drain"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 10  -- 2 steps, 2 turns
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [toOrganBad grp (3 + 1 `d` 3)]
  , idesc    = "Completely disables one personal faculty."
  , ikit     = []
  }
blastNoSkMove = blastNoStat S_IMMOBILE
blastNoSkMelee = blastNoStat S_PACIFIED
blastNoSkDisplace = blastNoStat S_IRREPLACEABLE
blastNoSkAlter = blastNoStat S_RETAINING
blastNoSkWait = blastNoStat S_IMPATIENT
blastNoSkMoveItem = blastNoStat S_DISPOSSESSED
blastNoSkProject = blastNoStat S_WITHHOLDING
blastNoSkApply = blastNoStat S_PARSIMONIOUS
blastBonusStat :: GroupName ItemKind -> ItemKind
blastBonusStat grp = ItemKind
  { isymbol  = '`'
  , iname    = "dew"
  , ifreq    = [(blastBonusStatOf grp, 1)]
  , iflavour = zipFancy [White]
  , icount   = 12
  , irarity  = [(1, 1)]
  , iverbHit = "elevate"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 10  -- 2 steps, 2 turns
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [toOrganGood grp (20 + 1 `d` 5)]
  , idesc    = "Temporarily enhances the given personal faculty."
  , ikit     = []
  }
blastBonusSkMove = blastBonusStat S_MORE_MOBILE
blastBonusSkMelee = blastBonusStat S_MORE_COMBATIVE
blastBonusSkDisplace = blastBonusStat S_MORE_DISPLACING
blastBonusSkAlter = blastBonusStat S_MORE_MODIFYING
blastBonusSkWait = blastBonusStat S_MORE_PATIENT
blastBonusSkMoveItem = blastBonusStat S_MORE_TIDY
blastBonusSkProject = blastBonusStat S_MORE_PROJECTING
blastBonusSkApply = blastBonusStat S_MORE_PRACTICAL

-- * Allure-specific

-- ** Lore blasts

-- They exist for a short time only, but the lore can be read
-- from the lore menu. Only optional story bits should go there,
-- because some players may not even notice them (at first, at least).
-- This is designed not to spam gameplay with story. Gameplay first.
-- Generally, 3 to 5 blasts of each kind should suffice for variety.
-- More would induce excessive repetition of some to see all
-- (they are shown at random). With mild exceptions, they should have
-- no effects.

cruiseAdHologram = ItemKind
  { isymbol  = '`'
  , iname    = "cruise ad hologram"
  , ifreq    = [(S_RHINO_HOLOGRAM, 1), (ADVERTISEMENT, 10)]
  , iflavour = zipFancy [BrMagenta]
  , icount   = 8
  , irarity  = [(1, 1)]
  , iverbHit = "excite"
  , iweight  = 0  -- delay of 1 turn at the start, to easily read the text
  , idamage  = 0
  , iaspects = [ toVelocity 5  -- 1 step, 1 turn
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [toOrganGood S_RESOLUTE (5 + 1 `d` 2), DropBestWeapon]
  , idesc    = "The fitful holographic clip shows a couple that laughs, watches in silence Saturn's rings through a huge window, throws treats to a little rhino frolicking in reduced gravity, runs through corridors wearing alien masks in a mock chase. An exited female voice proclaims: \"...safety, security and comfort...for each of your senses...personalized life support zones...robot servants...guessing your every wish...\""
  , ikit     = []
  }
outerAdHologram = cruiseAdHologram
  { iname    = "cruise ad hologram"
  , ifreq    = [(ADVERTISEMENT, 20)]
  , icount   = 4
  , ieffects = []  -- weak, 4 particles, no effect
  , idesc    = "A composed young man in a hat looks straight into your eyes with unwavering stare and extols the opportunities, freedom and excitement of the outer Solar System frontier life with unshakable conviction. Names of Neptune-area realtors scroll at the bottom in small font with oversize serifs."
  }
victoriaClassHologram = outerAdHologram
  { iname    = "space fleet hologram"
  , ifreq    = [(STORY_TELLING, 20)]
  , iflavour = zipFancy [BrBlue]
  , icount   = 1
  , iverbHit = "bore"
  , idesc    = "A series of huge spaceships zoom in and out of view in a solemn procession. Male voice drones over crackling static: Victoria-class cruise liners are the largest passenger ships ever serially manufactured and the third largest in general, including transport vessel series. Bigger ships are sometimes cobbled ad-hoc, by wiring together cheap modules and primitive cargo hulls welded in space, but they are rarely certified for public commercial operation. Victoria-class passenger cruisers are produced for over three decades now, in slowly evolving configurations, one every two years on average. The design is as conservative, as possible. A disc large enough for comfortable artificial gravity through constant spinning. Fusion reactor in the middle of the axle powering engines protruding far back from the rear plane. Meteor shield at the front. Numerous redundant rechargeable power sources and autonomous life support areas within several independently pressurized slices of the disc, eliminating the \"all locked in a single can, breathing the same air\" space travel grievance. Actually, everything is redundant twice over, due to strict regulations. To sum it up, these are the most boring spaceships in the galaxy."
  }
allureIntroHologram = victoriaClassHologram
  { iname    = "spaceship hologram"
  , ifreq    = [(STORY_TELLING, 10)]
  , idesc    = "A wavy 3D wireframe of a spaceship rotates ponderously. Male voice drones: Allure of the Stars belongs to a long line of luxurious orbit-to-orbit cruise liners, the Victoria-class. The ship is named after the largest passenger sea vessel of the early 21st century, with which it shares the grandeur and extravagance. This particular Victoria-class specimen has been designed for long cruises to gas giants, their moons and the moon cities (with their notorious saloons and night life). It has a meteor shield in the form of a flat, multi-layer. unpressurized cargo bay covering the front plane. Such extra cargo capacity enables long space journeys with no limits on resource usage. On shorter legs of the journeys it also enables opportunistic mass cargo transport (in accordance to strictest regulations and completely isolated from the airflow on passenger decks), which is always in demand at the profusely productive, but scarcely populated Solar System frontier. It also makes the unit much thicker than usual: the length from the tip of the cargo bay to the engines' exhausts is almost two thirds of the diameter of the disk. All in all, it is a particularly sturdy and self-sufficient member of a class famed for exceptional resilience and safety."
  }

-- ** Misc

spreadNitrogen = ItemKind
  { isymbol  = '`'
  , iname    = "nitrogen mist"
  , ifreq    = [(S_VIOLENT_SLOWNESS_MIST, 1), (COLD_SOURCE, 1)]
  , iflavour = zipPlain [BrBlack]
  , icount   = 17
  , irarity  = [(1, 1)]
  , iverbHit = "freeze"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toVelocity 10  -- 2 steps, 2 turns, mist, slow
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [toOrganBad S_SLOWED (2 + 1 `d` 3)]
  , idesc    = "Colourless cold clammy fog, making each movement an effort."
  , ikit     = []
  }
spreadNitrogen8 = spreadNitrogen
  { ifreq    = [(S_SLOWNESS_MIST, 1), (COLD_SOURCE, 1)]
  , icount   = 7
  , iaspects = [ toVelocity 5  -- 1 step, 1 turn, mist, slow
               , SetFlag Fragile, SetFlag Blast ]
  }
focusedNitrogen = ItemKind
  { isymbol  = '`'
  , iname    = "liquid nitrogen droplet"
  , ifreq    = [(S_FOCUSED_SLOWNESS_MIST, 1), (COLD_SOURCE, 1)]
  , iflavour = zipFancy [White]
  , icount   = 5
  , irarity  = [(1, 1)]
  , iverbHit = "freeze"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [ toLinger 0  -- 0 steps, 1 turn
               , SetFlag Fragile, SetFlag Blast ]
  , ieffects = [ OnSmash $ Explode S_SLOWNESS_MIST
               , toOrganBad S_SLOWED (2 + 1 `d` 3) ]
  , idesc    = "Colourless and colder than ice."
  , ikit     = []
  }
paintSpray = ItemKind
  { isymbol  = '`'
  , iname    = "fluorescent paint"
  , ifreq    = [(S_PAINT_DROPLET, 1)]
  , iflavour = zipPlain [BrRed]
  , icount   = 16
  , irarity  = [(1, 1)]
  , iverbHit = "paint"
  , iweight  = 1
  , idamage  = 0
  , iaspects = [toLinger 10, SetFlag Fragile, SetFlag Blast]
  , ieffects = [toOrganBad S_PAINTED (3 + 1 `d` 3)]
  , idesc    = "Softly glowing red paint that marks a target."
  , ikit     = []
  }
