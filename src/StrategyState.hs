module StrategyState where

import Data.List as L
import Data.Map as M
import Data.Set as S
import qualified Data.IntMap as IM
import Data.Maybe

import Geometry
import Level
import Movable
import MovableState
import MovableKind
import Random
import Perception
import Strategy
import State

strategy :: Actor -> State -> Perceptions -> Strategy Dir
strategy actor
         state@(State { splayer = pl,
                        stime   = time,
                        slevel  = Level { lsmell = nsmap,
                                          lmap = lmap } })
         per =
    monsterStrategy
  where
    -- TODO: set monster targets and then prefer targets to other heroes
    Movable { mkind = mk, mloc = me, mdir = mdir } = getActor actor state
    delState = deleteActor actor state
    hs = L.map (\ (i, m) -> (AHero i, mloc m)) $
         IM.assocs $ lheroes $ slevel delState
    ms = L.map (\ (i, m) -> (AMonster i, mloc m)) $
         IM.assocs $ lmonsters $ slevel delState
    -- If no heroes on the level, monsters go at each other. TODO: let them
    -- earn XP by killing each other to make this dangerous to the player.
    foe = if L.null hs then ms else hs
    -- We assume monster sight is actually infravision, so light has no effect.
    foeVisible = L.filter (\ (a, l) ->
                            actorReachesActor a actor l me per pl) foe
    foeDist = L.map (\ (_, l) -> (distance (me, l), l)) foeVisible
    -- If the player is a monster, monsters spot and attack him when adjacent.
    ploc = mloc (getPlayerBody state)
    traitorAdjacent = isAMonster pl && adjacent me ploc
    towardsPlayer = towards (me, ploc)
    -- Below, "foe" is the hero (or a monster) attacked by the actor.
    floc = case foeVisible of
             [] -> Nothing
             _  -> Just $ snd $ L.minimum foeDist
    anyFoeVisible  = isJust floc
    foeAdjacent    = maybe False (adjacent me) floc
    towardsFoe     = maybe (0, 0) (\ floc -> towards (me, floc)) floc
    onlyTowardsFoe m =
      anyFoeVisible .=> only (\ x -> distance (towardsFoe, x) <= 1) m
    greedyMonster  = niq mk < 5
    directedMonster = niq mk >= 5
    lootPresent    = (\ x -> not $ L.null $ titems $ lmap `at` x)
    onlyLootHere   = onlyMoves lootPresent me
    onlyKeepsDir   =
      only (\ x -> maybe True (\ d -> distance (neg d, x) > 1) mdir)
    onlyUnoccupied = onlyMoves (unoccupied (levelMonsterList delState)) me
    onlyAccessible = onlyMoves accessibleHere me
    accessibleHere = accessible lmap me
    onlySensible   = onlyMoves (\ l -> accessibleHere l || openableHere l) me
    -- Monsters don't see doors more secret than that. Enforced when actually
    -- opening doors, too, so that monsters don't cheat.
    openableHere   = (openable (niq mk) lmap)
    onlyOpenable   = onlyMoves openableHere me
    smells         = L.map fst $
                       L.sortBy (\ (_,s1) (_,s2) -> compare s2 s1) $
                       L.filter (\ (_,s) -> s > 0) $
                       L.map (\ x -> (x, nsmap ! (me `shift` x)
                                         - time `max` 0)) moves
    monsterStrategy =
      onlySensible $
        traitorAdjacent .=> return towardsPlayer
        .| foeAdjacent .=> return towardsFoe
        .| (greedyMonster && lootPresent me) .=> wait
        .| moveTowards
    moveTowards =
      onlyUnoccupied $
        nsight mk .=> onlyTowardsFoe moveFreely
        .| lootPresent me .=> wait
        .| nsmell mk .=> foldr (.|) reject (L.map return smells)
        .| onlyOpenable moveFreely
        .| moveFreely
    moveFreely = onlyLootHere moveRandomly
                 .| directedMonster .=> onlyKeepsDir moveRandomly
                 .| moveRandomly

onlyMoves :: (Dir -> Bool) -> Loc -> Strategy Dir -> Strategy Dir
onlyMoves p l = only (\ x -> p (l `shift` x))

moveRandomly :: Strategy Dir
moveRandomly = liftFrequency $ uniform moves

wait :: Strategy Dir
wait = return (0,0)
