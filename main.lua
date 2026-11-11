SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomVouchers", 
    path = "CustomVouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/_10hourburstman.lua"))()
    assert(SMODS.load_file("jokers/2011x.lua"))()
    assert(SMODS.load_file("jokers/_2017x.lua"))()
    assert(SMODS.load_file("jokers/_7zip.lua"))()
    assert(SMODS.load_file("jokers/guy.lua"))()
    assert(SMODS.load_file("jokers/ak48.lua"))()
    assert(SMODS.load_file("jokers/alephnull.lua"))()
    assert(SMODS.load_file("jokers/andthefacedrooledthensaiddurr.lua"))()
    assert(SMODS.load_file("jokers/apocalypsebird.lua"))()
    assert(SMODS.load_file("jokers/asgoredreemurr.lua"))()
    assert(SMODS.load_file("jokers/asgoresburgentruck.lua"))()
    assert(SMODS.load_file("jokers/averagejokerforgejoker.lua"))()
    assert(SMODS.load_file("jokers/averageshedletskyplayer.lua"))()
    assert(SMODS.load_file("jokers/average_vanilla_jokerforge_joker.lua"))()
    assert(SMODS.load_file("jokers/azure.lua"))()
    assert(SMODS.load_file("jokers/badegg.lua"))()
    assert(SMODS.load_file("jokers/banana.lua"))()
    assert(SMODS.load_file("jokers/bear5.lua"))()
    assert(SMODS.load_file("jokers/beer.lua"))()
    assert(SMODS.load_file("jokers/beginner_balatro_player.lua"))()
    assert(SMODS.load_file("jokers/bigbird.lua"))()
    assert(SMODS.load_file("jokers/bigmisser.lua"))()
    assert(SMODS.load_file("jokers/billcipher.lua"))()
    assert(SMODS.load_file("jokers/blazethecat.lua"))()
    assert(SMODS.load_file("jokers/blindfoldedjoker.lua"))()
    assert(SMODS.load_file("jokers/bluestormyuri.lua"))()
    assert(SMODS.load_file("jokers/bluudud.lua"))()
    assert(SMODS.load_file("jokers/brooke.lua"))()
    assert(SMODS.load_file("jokers/brookestage2.lua"))()
    assert(SMODS.load_file("jokers/brookestage3.lua"))()
    assert(SMODS.load_file("jokers/bubblyproto.lua"))()
    assert(SMODS.load_file("jokers/burningblaze.lua"))()
    assert(SMODS.load_file("jokers/burntjokerslittlecousin.lua"))()
    assert(SMODS.load_file("jokers/candle.lua"))()
    assert(SMODS.load_file("jokers/captaintrotter.lua"))()
    assert(SMODS.load_file("jokers/caretaker.lua"))()
    assert(SMODS.load_file("jokers/cashier.lua"))()
    assert(SMODS.load_file("jokers/catbox.lua"))()
    assert(SMODS.load_file("jokers/cementful.lua"))()
    assert(SMODS.load_file("jokers/chaosemerald.lua"))()
    assert(SMODS.load_file("jokers/chara.lua"))()
    assert(SMODS.load_file("jokers/charliesinferno.lua"))()
    assert(SMODS.load_file("jokers/chattydee.lua"))()
    assert(SMODS.load_file("jokers/cheftwo.lua"))()
    assert(SMODS.load_file("jokers/chips.lua"))()
    assert(SMODS.load_file("jokers/chubby_baby_chubby_baby_so_cute.lua"))()
    assert(SMODS.load_file("jokers/chud.lua"))()
    assert(SMODS.load_file("jokers/cinderblock.lua"))()
    assert(SMODS.load_file("jokers/clock.lua"))()
    assert(SMODS.load_file("jokers/clover.lua"))()
    assert(SMODS.load_file("jokers/codecorruption.lua"))()
    assert(SMODS.load_file("jokers/combatdummy.lua"))()
    assert(SMODS.load_file("jokers/combatking.lua"))()
    assert(SMODS.load_file("jokers/comykel.lua"))()
    assert(SMODS.load_file("jokers/contradictions.lua"))()
    assert(SMODS.load_file("jokers/costco.lua"))()
    assert(SMODS.load_file("jokers/costcomembershipcard.lua"))()
    assert(SMODS.load_file("jokers/cream.lua"))()
    assert(SMODS.load_file("jokers/crow.lua"))()
    assert(SMODS.load_file("jokers/cryingjoker.lua"))()
    assert(SMODS.load_file("jokers/danceordie.lua"))()
    assert(SMODS.load_file("jokers/davidbaszucki.lua"))()
    assert(SMODS.load_file("jokers/deckfixingatitsfinest.lua"))()
    assert(SMODS.load_file("jokers/dess.lua"))()
    assert(SMODS.load_file("jokers/devilmario.lua"))()
    assert(SMODS.load_file("jokers/diablo.lua"))()
    assert(SMODS.load_file("jokers/dieofdeath.lua"))()
    assert(SMODS.load_file("jokers/dirtybubble.lua"))()
    assert(SMODS.load_file("jokers/disappearingact.lua"))()
    assert(SMODS.load_file("jokers/discord.lua"))()
    assert(SMODS.load_file("jokers/divadayo.lua"))()
    assert(SMODS.load_file("jokers/doctorrobotnik.lua"))()
    assert(SMODS.load_file("jokers/doesbadthingsguy.lua"))()
    assert(SMODS.load_file("jokers/dontplaybalatroat3am.lua"))()
    assert(SMODS.load_file("jokers/dougadougdougstory.lua"))()
    assert(SMODS.load_file("jokers/elpendriveazul.lua"))()
    assert(SMODS.load_file("jokers/ellierose.lua"))()
    assert(SMODS.load_file("jokers/emerson.lua"))()
    assert(SMODS.load_file("jokers/end.lua"))()
    assert(SMODS.load_file("jokers/error54.lua"))()
    assert(SMODS.load_file("jokers/father.lua"))()
    assert(SMODS.load_file("jokers/fire.lua"))()
    assert(SMODS.load_file("jokers/fishermanjoker.lua"))()
    assert(SMODS.load_file("jokers/fleshcousin.lua"))()
    assert(SMODS.load_file("jokers/flintlock.lua"))()
    assert(SMODS.load_file("jokers/flopera.lua"))()
    assert(SMODS.load_file("jokers/flowers.lua"))()
    assert(SMODS.load_file("jokers/flushtrojoker.lua"))()
    assert(SMODS.load_file("jokers/fourest.lua"))()
    assert(SMODS.load_file("jokers/friend.lua"))()
    assert(SMODS.load_file("jokers/funyconfessions.lua"))()
    assert(SMODS.load_file("jokers/furnace.lua"))()
    assert(SMODS.load_file("jokers/gangle.lua"))()
    assert(SMODS.load_file("jokers/gasa4player.lua"))()
    assert(SMODS.load_file("jokers/goldenchance.lua"))()
    assert(SMODS.load_file("jokers/goodmorning.lua"))()
    assert(SMODS.load_file("jokers/guest666.lua"))()
    assert(SMODS.load_file("jokers/guinevere.lua"))()
    assert(SMODS.load_file("jokers/guncylinder.lua"))()
    assert(SMODS.load_file("jokers/harken.lua"))()
    assert(SMODS.load_file("jokers/harlequincontraption.lua"))()
    assert(SMODS.load_file("jokers/heartstealinggirl.lua"))()
    assert(SMODS.load_file("jokers/henrystickmin.lua"))()
    assert(SMODS.load_file("jokers/homelesschance.lua"))()
    assert(SMODS.load_file("jokers/hotdog.lua"))()
    assert(SMODS.load_file("jokers/howoldareyou.lua"))()
    assert(SMODS.load_file("jokers/huntinhumans.lua"))()
    assert(SMODS.load_file("jokers/hyper_sonic.lua"))()
    assert(SMODS.load_file("jokers/ihavetwosides.lua"))()
    assert(SMODS.load_file("jokers/igaku.lua"))()
    assert(SMODS.load_file("jokers/imgonnaeatthisglass.lua"))()
    assert(SMODS.load_file("jokers/indigo.lua"))()
    assert(SMODS.load_file("jokers/inky.lua"))()
    assert(SMODS.load_file("jokers/insideeachmealisamysteryemerald.lua"))()
    assert(SMODS.load_file("jokers/investigativeiris.lua"))()
    assert(SMODS.load_file("jokers/ithor.lua"))()
    assert(SMODS.load_file("jokers/jabibifactory.lua"))()
    assert(SMODS.load_file("jokers/jabibixd.lua"))()
    assert(SMODS.load_file("jokers/jackpotoverdose.lua"))()
    assert(SMODS.load_file("jokers/jax.lua"))()
    assert(SMODS.load_file("jokers/johndoe.lua"))()
    assert(SMODS.load_file("jokers/jokerraritybug.lua"))()
    assert(SMODS.load_file("jokers/jokeofakind.lua"))()
    assert(SMODS.load_file("jokers/joker150.lua"))()
    assert(SMODS.load_file("jokers/jokerforge.lua"))()
    assert(SMODS.load_file("jokers/jokerforgeshowcasechannel.lua"))()
    assert(SMODS.load_file("jokers/judgementbird.lua"))()
    assert(SMODS.load_file("jokers/killerkyle.lua"))()
    assert(SMODS.load_file("jokers/kitchenwizard.lua"))()
    assert(SMODS.load_file("jokers/kj.lua"))()
    assert(SMODS.load_file("jokers/knowyourhomers.lua"))()
    assert(SMODS.load_file("jokers/kookoo.lua"))()
    assert(SMODS.load_file("jokers/lampert.lua"))()
    assert(SMODS.load_file("jokers/lettherebelight.lua"))()
    assert(SMODS.load_file("jokers/letstakealook.lua"))()
    assert(SMODS.load_file("jokers/litany.lua"))()
    assert(SMODS.load_file("jokers/lockercombowheel.lua"))()
    assert(SMODS.load_file("jokers/lodsofmonechance.lua"))()
    assert(SMODS.load_file("jokers/lordx.lua"))()
    assert(SMODS.load_file("jokers/loveshot.lua"))()
    assert(SMODS.load_file("jokers/luisgamercool23.lua"))()
    assert(SMODS.load_file("jokers/mafioso.lua"))()
    assert(SMODS.load_file("jokers/manbehindthetree.lua"))()
    assert(SMODS.load_file("jokers/managergangle.lua"))()
    assert(SMODS.load_file("jokers/metalsonic.lua"))()
    assert(SMODS.load_file("jokers/minigun.lua"))()
    assert(SMODS.load_file("jokers/minimumrage.lua"))()
    assert(SMODS.load_file("jokers/misterretrigger.lua"))()
    assert(SMODS.load_file("jokers/moneyman.lua"))()
    assert(SMODS.load_file("jokers/motobug.lua"))()
    assert(SMODS.load_file("jokers/mr.lua"))()
    assert(SMODS.load_file("jokers/mrnaneinf.lua"))()
    assert(SMODS.load_file("jokers/neometalsonic.lua"))()
    assert(SMODS.load_file("jokers/neptune.lua"))()
    assert(SMODS.load_file("jokers/niku.lua"))()
    assert(SMODS.load_file("jokers/noli.lua"))()
    assert(SMODS.load_file("jokers/hallucination.lua"))()
    assert(SMODS.load_file("jokers/nothingburger.lua"))()
    assert(SMODS.load_file("jokers/ohungi.lua"))()
    assert(SMODS.load_file("jokers/paceandtheshadow.lua"))()
    assert(SMODS.load_file("jokers/orby.lua"))()
    assert(SMODS.load_file("jokers/papershredder.lua"))()
    assert(SMODS.load_file("jokers/patitofi8.lua"))()
    assert(SMODS.load_file("jokers/pest.lua"))()
    assert(SMODS.load_file("jokers/philiptheeverlasting.lua"))()
    assert(SMODS.load_file("jokers/pizzaguy.lua"))()
    assert(SMODS.load_file("jokers/prangeguy.lua"))()
    assert(SMODS.load_file("jokers/punishingbird.lua"))()
    assert(SMODS.load_file("jokers/randomclover.lua"))()
    assert(SMODS.load_file("jokers/rangersguests.lua"))()
    assert(SMODS.load_file("jokers/reddy.lua"))()
    assert(SMODS.load_file("jokers/reginaldcopperbottom.lua"))()
    assert(SMODS.load_file("jokers/repoker.lua"))()
    assert(SMODS.load_file("jokers/retrynow.lua"))()
    assert(SMODS.load_file("jokers/revolver.lua"))()
    assert(SMODS.load_file("jokers/rewriteprime.lua"))()
    assert(SMODS.load_file("jokers/rice.lua"))()
    assert(SMODS.load_file("jokers/righthandman.lua"))()
    assert(SMODS.load_file("jokers/ripoffcryptidmembershipcard.lua"))()
    assert(SMODS.load_file("jokers/robloxegor.lua"))()
    assert(SMODS.load_file("jokers/rock.lua"))()
    assert(SMODS.load_file("jokers/rocketlauncher.lua"))()
    assert(SMODS.load_file("jokers/rouxlskaard.lua"))()
    assert(SMODS.load_file("jokers/saucequest31.lua"))()
    assert(SMODS.load_file("jokers/saucescondimentpack.lua"))()
    assert(SMODS.load_file("jokers/shadowthehedgehog.lua"))()
    assert(SMODS.load_file("jokers/sinnoh.lua"))()
    assert(SMODS.load_file("jokers/sixsevennn.lua"))()
    assert(SMODS.load_file("jokers/skidandpump.lua"))()
    assert(SMODS.load_file("jokers/slasher.lua"))()
    assert(SMODS.load_file("jokers/sonicthehedgehog.lua"))()
    assert(SMODS.load_file("jokers/soul.lua"))()
    assert(SMODS.load_file("jokers/sparetrousersenthusiast.lua"))()
    assert(SMODS.load_file("jokers/specimen009.lua"))()
    assert(SMODS.load_file("jokers/spellbook.lua"))()
    assert(SMODS.load_file("jokers/springtrap.lua"))()
    assert(SMODS.load_file("jokers/spud.lua"))()
    assert(SMODS.load_file("jokers/starved.lua"))()
    assert(SMODS.load_file("jokers/stocks.lua"))()
    assert(SMODS.load_file("jokers/supersonic.lua"))()
    assert(SMODS.load_file("jokers/surgethetenrec.lua"))()
    assert(SMODS.load_file("jokers/tailsdoll.lua"))()
    assert(SMODS.load_file("jokers/tailsthefox.lua"))()
    assert(SMODS.load_file("jokers/thanos.lua"))()
    assert(SMODS.load_file("jokers/theboss.lua"))()
    assert(SMODS.load_file("jokers/thechosenone.lua"))()
    assert(SMODS.load_file("jokers/thecursechallenge.lua"))()
    assert(SMODS.load_file("jokers/thedarklord.lua"))()
    assert(SMODS.load_file("jokers/thegreatfloccinaucinihilipilification.lua"))()
    assert(SMODS.load_file("jokers/thespectre.lua"))()
    assert(SMODS.load_file("jokers/thetouchofmidas.lua"))()
    assert(SMODS.load_file("jokers/thewheel.lua"))()
    assert(SMODS.load_file("jokers/theedgeman.lua"))()
    assert(SMODS.load_file("jokers/thisismassammunition.lua"))()
    assert(SMODS.load_file("jokers/true.lua"))()
    assert(SMODS.load_file("jokers/twotime.lua"))()
    assert(SMODS.load_file("jokers/u.lua"))()
    assert(SMODS.load_file("jokers/ultimatechimera.lua"))()
    assert(SMODS.load_file("jokers/velvet.lua"))()
    assert(SMODS.load_file("jokers/virtualboy.lua"))()
    assert(SMODS.load_file("jokers/visageoffalsehope.lua"))()
    assert(SMODS.load_file("jokers/wspeed.lua"))()
    assert(SMODS.load_file("jokers/wallter.lua"))()
    assert(SMODS.load_file("jokers/waterbottle.lua"))()
    assert(SMODS.load_file("jokers/wdwario.lua"))()
    assert(SMODS.load_file("jokers/wetcementvendingmachine.lua"))()
    assert(SMODS.load_file("jokers/whalesshedletsky.lua"))()
    assert(SMODS.load_file("jokers/whatllbefellas.lua"))()
    assert(SMODS.load_file("jokers/wheeloffortunewillnothit.lua"))()
    assert(SMODS.load_file("jokers/whippedcoffeecookie.lua"))()
    assert(SMODS.load_file("jokers/whitepumpkin.lua"))()
    assert(SMODS.load_file("jokers/whowantstoholdthetungstencube.lua"))()
    assert(SMODS.load_file("jokers/workclockchance.lua"))()
    assert(SMODS.load_file("jokers/yixi.lua"))()
    assert(SMODS.load_file("jokers/youareanidiot.lua"))()
    assert(SMODS.load_file("jokers/hmmtodayiwill.lua"))()
    assert(SMODS.load_file("jokers/theroaringknight.lua"))()
    assert(SMODS.load_file("jokers/rouxlskaardsthrouple.lua"))()
    assert(SMODS.load_file("jokers/badware.lua"))()
    assert(SMODS.load_file("jokers/cookieware.lua"))()
    assert(SMODS.load_file("jokers/devilware.lua"))()
    assert(SMODS.load_file("jokers/aspxnoli.lua"))()
    assert(SMODS.load_file("jokers/desperationmarch.lua"))()
    assert(SMODS.load_file("jokers/sniperrifle.lua"))()
    assert(SMODS.load_file("jokers/mlgchance.lua"))()
    assert(SMODS.load_file("jokers/pursuer.lua"))()
    assert(SMODS.load_file("jokers/clipboard.lua"))()
    assert(SMODS.load_file("jokers/killdroid.lua"))()
    assert(SMODS.load_file("jokers/playmygame.lua"))()
    assert(SMODS.load_file("jokers/heisntlaughing.lua"))()
    assert(SMODS.load_file("jokers/oneyplays.lua"))()
    assert(SMODS.load_file("jokers/kitsunamithefennec.lua"))()
    assert(SMODS.load_file("jokers/steponup.lua"))()
    assert(SMODS.load_file("jokers/ralseiplushownersvsspamtonplushowners.lua"))()
    assert(SMODS.load_file("jokers/goldtoothjoker.lua"))()
    assert(SMODS.load_file("jokers/one.lua"))()
    assert(SMODS.load_file("jokers/three.lua"))()
    assert(SMODS.load_file("jokers/kolossos.lua"))()
    assert(SMODS.load_file("jokers/four.lua"))()
    assert(SMODS.load_file("jokers/five.lua"))()
    assert(SMODS.load_file("jokers/johnforsaken.lua"))()
    assert(SMODS.load_file("jokers/ecla17.lua"))()
    assert(SMODS.load_file("jokers/oopsbluesmileygrosmichel.lua"))()
    assert(SMODS.load_file("jokers/silverthehedgehog.lua"))()
    assert(SMODS.load_file("jokers/dusekkar.lua"))()
    assert(SMODS.load_file("jokers/kaiandspeedadventures64.lua"))()
    assert(SMODS.load_file("jokers/freddythehedgehog.lua"))()
    assert(SMODS.load_file("jokers/bear5thehedgehog.lua"))()
    assert(SMODS.load_file("jokers/amyrose.lua"))()
    assert(SMODS.load_file("jokers/capcutfireeffect.lua"))()
    assert(SMODS.load_file("jokers/spamton.lua"))()
    assert(SMODS.load_file("jokers/smileygraph.lua"))()
    assert(SMODS.load_file("jokers/vipdoor.lua"))()
    assert(SMODS.load_file("jokers/viproom.lua"))()
    assert(SMODS.load_file("jokers/cruelking.lua"))()
    assert(SMODS.load_file("jokers/fatalerror.lua"))()
    assert(SMODS.load_file("jokers/zombie.lua"))()
    assert(SMODS.load_file("jokers/grossmichael.lua"))()
    assert(SMODS.load_file("jokers/whereswaldo.lua"))()
    assert(SMODS.load_file("jokers/onebouncesurvivor.lua"))()
    assert(SMODS.load_file("jokers/fireboyandwatergirl.lua"))()
    assert(SMODS.load_file("jokers/season17.lua"))()
    assert(SMODS.load_file("jokers/gramholo.lua"))()
    assert(SMODS.load_file("jokers/whatisthisdiddybluddoinonthecalc.lua"))()
    assert(SMODS.load_file("jokers/scp067.lua"))()
    assert(SMODS.load_file("jokers/aceface.lua"))()
    assert(SMODS.load_file("jokers/theancients.lua"))()
    assert(SMODS.load_file("jokers/greed.lua"))()
    assert(SMODS.load_file("jokers/solitude.lua"))()
    assert(SMODS.load_file("jokers/fear.lua"))()
    assert(SMODS.load_file("jokers/hatred.lua"))()
    assert(SMODS.load_file("jokers/blocktalesplayer.lua"))()
    assert(SMODS.load_file("jokers/mac0.lua"))()
    assert(SMODS.load_file("jokers/maninthemirror.lua"))()
    assert(SMODS.load_file("jokers/offthewall.lua"))()
    assert(SMODS.load_file("jokers/beauty.lua"))()
    assert(SMODS.load_file("jokers/meatshow.lua"))()
    assert(SMODS.load_file("jokers/loveneverfeltsogood.lua"))()
    assert(SMODS.load_file("jokers/thefirerises.lua"))()
    assert(SMODS.load_file("jokers/imissthequiet.lua"))()
    assert(SMODS.load_file("jokers/youmustanswer.lua"))()
    assert(SMODS.load_file("jokers/minds.lua"))()
    assert(SMODS.load_file("jokers/ididthat.lua"))()
    assert(SMODS.load_file("jokers/scars.lua"))()
    assert(SMODS.load_file("jokers/sinister.lua"))()
    assert(SMODS.load_file("jokers/feelthatdread.lua"))()
    assert(SMODS.load_file("jokers/runaway.lua"))()
    assert(SMODS.load_file("jokers/redhanded.lua"))()
    assert(SMODS.load_file("jokers/dontcomeback.lua"))()
    assert(SMODS.load_file("jokers/starface.lua"))()
    assert(SMODS.load_file("jokers/springer.lua"))()
    assert(SMODS.load_file("jokers/skinwalker.lua"))()
    assert(SMODS.load_file("jokers/flesh.lua"))()
    assert(SMODS.load_file("jokers/guardian.lua"))()
    assert(SMODS.load_file("jokers/random.lua"))()
    assert(SMODS.load_file("jokers/america.lua"))()
    assert(SMODS.load_file("jokers/icecreamtreat.lua"))()
    assert(SMODS.load_file("jokers/hearttoheart.lua"))()
    assert(SMODS.load_file("jokers/californianfriday.lua"))()
    assert(SMODS.load_file("jokers/anchorfromthesky.lua"))()
    assert(SMODS.load_file("jokers/bottle.lua"))()
    assert(SMODS.load_file("jokers/brimstone.lua"))()
    assert(SMODS.load_file("jokers/canadianriot.lua"))()
    assert(SMODS.load_file("jokers/copperwirewrappedrock.lua"))()
    assert(SMODS.load_file("jokers/blackholeraygun.lua"))()
    assert(SMODS.load_file("jokers/poserskatana.lua"))()
    assert(SMODS.load_file("jokers/football.lua"))()
    assert(SMODS.load_file("jokers/freezeray.lua"))()
    assert(SMODS.load_file("jokers/grandjavelin.lua"))()
    assert(SMODS.load_file("jokers/grandvolley.lua"))()
    assert(SMODS.load_file("jokers/hitman.lua"))()
    assert(SMODS.load_file("jokers/honeybun.lua"))()
    assert(SMODS.load_file("jokers/mazinsonic.lua"))()
    assert(SMODS.load_file("jokers/jokerforgeautosaves.lua"))()
    assert(SMODS.load_file("jokers/milk.lua"))()
    assert(SMODS.load_file("jokers/nokia.lua"))()
    assert(SMODS.load_file("jokers/honk.lua"))()
    assert(SMODS.load_file("jokers/oldspeakers.lua"))()
    assert(SMODS.load_file("jokers/nut.lua"))()
    assert(SMODS.load_file("jokers/pinger.lua"))()
    assert(SMODS.load_file("jokers/piratecannon.lua"))()
    assert(SMODS.load_file("jokers/polishartillery.lua"))()
    assert(SMODS.load_file("jokers/pm9evilgun.lua"))()
    assert(SMODS.load_file("jokers/smallpebble.lua"))()
    assert(SMODS.load_file("jokers/stomp.lua"))()
    assert(SMODS.load_file("jokers/taser.lua"))()
    assert(SMODS.load_file("jokers/toygeargun.lua"))()
    assert(SMODS.load_file("jokers/unrelentingforce.lua"))()
    assert(SMODS.load_file("jokers/vampireknives.lua"))()
    assert(SMODS.load_file("jokers/wakeupcall.lua"))()
    assert(SMODS.load_file("jokers/whatistherockcooking.lua"))()
    assert(SMODS.load_file("jokers/allexpensespaidfreeislandgetawaybrochure.lua"))()
    assert(SMODS.load_file("jokers/audacity.lua"))()
    assert(SMODS.load_file("jokers/ashurasenku.lua"))()
    assert(SMODS.load_file("jokers/backwardslongjump.lua"))()
    assert(SMODS.load_file("jokers/bucketofstuds.lua"))()
    assert(SMODS.load_file("jokers/contractorjudgement.lua"))()
    assert(SMODS.load_file("jokers/amuletofthewhiteking.lua"))()
    assert(SMODS.load_file("jokers/dunk.lua"))()
    assert(SMODS.load_file("jokers/dwarfer.lua"))()
    assert(SMODS.load_file("jokers/eyepatch.lua"))()
    assert(SMODS.load_file("jokers/energydrink.lua"))()
    assert(SMODS.load_file("jokers/fireforce.lua"))()
    assert(SMODS.load_file("jokers/ilovebeingpartoftheeconomyitswhatiwasborntodo.lua"))()
    assert(SMODS.load_file("jokers/porchthiefjoker.lua"))()
    assert(SMODS.load_file("jokers/agenericgenericplatformer.lua"))()
    assert(SMODS.load_file("jokers/hollyjollyjoker.lua"))()
    assert(SMODS.load_file("jokers/goldenshedletsky.lua"))()
    assert(SMODS.load_file("jokers/rolledupjoker.lua"))()
    assert(SMODS.load_file("jokers/gleeco.lua"))()
    assert(SMODS.load_file("jokers/whatcoulditbe.lua"))()
    assert(SMODS.load_file("jokers/unlikeyou.lua"))()
    assert(SMODS.load_file("jokers/atlantalowpressureedit.lua"))()
    assert(SMODS.load_file("jokers/tripwire.lua"))()
    assert(SMODS.load_file("jokers/greensans.lua"))()
    assert(SMODS.load_file("jokers/weathergirl.lua"))()
    assert(SMODS.load_file("jokers/nomoreinnocence.lua"))()
    assert(SMODS.load_file("jokers/kendricklamar.lua"))()
    assert(SMODS.load_file("jokers/fleetwaysupersonic.lua"))()
    assert(SMODS.load_file("jokers/abberantjohndoe.lua"))()
    assert(SMODS.load_file("jokers/theghostofjanedoe.lua"))()
    assert(SMODS.load_file("jokers/theguideshedletsky.lua"))()
    assert(SMODS.load_file("jokers/crazyblox1x1x1x1.lua"))()
    assert(SMODS.load_file("jokers/_26folk.lua"))()
    assert(SMODS.load_file("jokers/autopsyreport.lua"))()
    assert(SMODS.load_file("jokers/hwando.lua"))()
    assert(SMODS.load_file("jokers/mcpicklepounder.lua"))()
    assert(SMODS.load_file("jokers/yuri.lua"))()
    assert(SMODS.load_file("jokers/greenapples.lua"))()
    assert(SMODS.load_file("jokers/reminisce.lua"))()
    assert(SMODS.load_file("jokers/outcast.lua"))()
    assert(SMODS.load_file("jokers/rotaway.lua"))()
    assert(SMODS.load_file("jokers/karma.lua"))()
    assert(SMODS.load_file("jokers/rememberme.lua"))()
    assert(SMODS.load_file("jokers/haveyoueverplayedbalatrowithyourlifeontheline.lua"))()
    assert(SMODS.load_file("jokers/justleaving.lua"))()
    assert(SMODS.load_file("jokers/deathgrip.lua"))()
    assert(SMODS.load_file("jokers/fffharshtruths.lua"))()
    assert(SMODS.load_file("jokers/shegoncallmebabyboo.lua"))()
    assert(SMODS.load_file("jokers/yujiitadori.lua"))()
    assert(SMODS.load_file("jokers/satorugojo.lua"))()
    assert(SMODS.load_file("jokers/ryomensukuna.lua"))()
    assert(SMODS.load_file("jokers/sans.lua"))()
    assert(SMODS.load_file("jokers/papyrus.lua"))()
    assert(SMODS.load_file("jokers/spaghetti.lua"))()
    assert(SMODS.load_file("jokers/badtime.lua"))()
    assert(SMODS.load_file("jokers/harutashigemo.lua"))()
    assert(SMODS.load_file("jokers/naoyazenin.lua"))()
    assert(SMODS.load_file("jokers/deltarunetomorrow.lua"))()
    assert(SMODS.load_file("jokers/yutaokkotsuandrika.lua"))()
    assert(SMODS.load_file("jokers/yutadomain.lua"))()
    assert(SMODS.load_file("jokers/megumifushiguro.lua"))()
    assert(SMODS.load_file("jokers/megumidomain.lua"))()
    assert(SMODS.load_file("jokers/mahoraga.lua"))()
    assert(SMODS.load_file("jokers/yujidomain.lua"))()
    assert(SMODS.load_file("jokers/gojodomain.lua"))()
    assert(SMODS.load_file("jokers/sukunadomain.lua"))()
    assert(SMODS.load_file("jokers/kyle.lua"))()
    assert(SMODS.load_file("jokers/stoned.lua"))()
    assert(SMODS.load_file("jokers/reallystoned.lua"))()
    assert(SMODS.load_file("jokers/inkdemon.lua"))()
    assert(SMODS.load_file("jokers/nobarakugisaki.lua"))()
    assert(SMODS.load_file("jokers/togeinumaki.lua"))()
    assert(SMODS.load_file("jokers/utahimeiori.lua"))()
    assert(SMODS.load_file("jokers/maizenin.lua"))()
    assert(SMODS.load_file("jokers/kokichimuta.lua"))()
    assert(SMODS.load_file("jokers/fumihikotakaba.lua"))()
    assert(SMODS.load_file("jokers/reggiestar.lua"))()
    assert(SMODS.load_file("jokers/jacker.lua"))()
    assert(SMODS.load_file("jokers/ryuishigori.lua"))()
    assert(SMODS.load_file("jokers/remi.lua"))()
    assert(SMODS.load_file("jokers/uraume.lua"))()
    assert(SMODS.load_file("jokers/hajimekashimo.lua"))()
    assert(SMODS.load_file("jokers/jiroawasaka.lua"))()
    assert(SMODS.load_file("jokers/nowwhyonearthinthetoiletaretherepliers.lua"))()
    assert(SMODS.load_file("jokers/fgteevspliers.lua"))()
    assert(SMODS.load_file("jokers/iorihazenoki.lua"))()
    assert(SMODS.load_file("jokers/iceman.lua"))()
    assert(SMODS.load_file("jokers/kinjihakari.lua"))()
    assert(SMODS.load_file("jokers/mahito.lua"))()
    assert(SMODS.load_file("jokers/transfiguredhuman.lua"))()
    assert(SMODS.load_file("jokers/bodyrepel.lua"))()
    assert(SMODS.load_file("jokers/mahitoinstantspiritbodyofdistortedkilling.lua"))()
    assert(SMODS.load_file("jokers/polymorphicsoulisomer.lua"))()
    assert(SMODS.load_file("jokers/mahitodomain.lua"))()
    assert(SMODS.load_file("jokers/atrain.lua"))()
    assert(SMODS.load_file("jokers/subarutheauramonster.lua"))()
    assert(SMODS.load_file("jokers/akihayakawa.lua"))()
    assert(SMODS.load_file("jokers/pochitatheheroofhell.lua"))()
    assert(SMODS.load_file("jokers/himeno.lua"))()
    assert(SMODS.load_file("jokers/angeldevil.lua"))()
    assert(SMODS.load_file("jokers/beam.lua"))()
    assert(SMODS.load_file("jokers/princi.lua"))()
end
-- load the consumables
if true then
    assert(SMODS.load_file("consumables/yoyleberry.lua"))()
    assert(SMODS.load_file("consumables/_10hourburst.lua"))()
    assert(SMODS.load_file("consumables/bananapeel.lua"))()
    assert(SMODS.load_file("consumables/barbequesauce.lua"))()
    assert(SMODS.load_file("consumables/bullet.lua"))()
    assert(SMODS.load_file("consumables/dillrelish.lua"))()
    assert(SMODS.load_file("consumables/everysauce.lua"))()
    assert(SMODS.load_file("consumables/fireflower.lua"))()
    assert(SMODS.load_file("consumables/jobapplication.lua"))()
    assert(SMODS.load_file("consumables/ketchup.lua"))()
    assert(SMODS.load_file("consumables/mayochup.lua"))()
    assert(SMODS.load_file("consumables/mayonnaise.lua"))()
    assert(SMODS.load_file("consumables/mustard.lua"))()
    assert(SMODS.load_file("consumables/necrobloxicon.lua"))()
    assert(SMODS.load_file("consumables/roblox.lua"))()
    assert(SMODS.load_file("consumables/rulescard.lua"))()
    assert(SMODS.load_file("consumables/siracha.lua"))()
    assert(SMODS.load_file("consumables/sweetrelish.lua"))()
    assert(SMODS.load_file("consumables/thunderousclouds.lua"))()
    assert(SMODS.load_file("consumables/wetcement.lua"))()
    assert(SMODS.load_file("consumables/windowsshifts.lua"))()
    assert(SMODS.load_file("consumables/ctrlz.lua"))()
    assert(SMODS.load_file("consumables/altf4.lua"))()
    assert(SMODS.load_file("consumables/ctrlcandctrlv.lua"))()
    assert(SMODS.load_file("consumables/killdroidsmissile.lua"))()
    assert(SMODS.load_file("consumables/callcruelking.lua"))()
    assert(SMODS.load_file("consumables/icestorm.lua"))()
    assert(SMODS.load_file("consumables/chocolatesyrup.lua"))()
    assert(SMODS.load_file("consumables/shiftx5.lua"))()
    assert(SMODS.load_file("consumables/ctrl.lua"))()
    assert(SMODS.load_file("consumables/ctrl2.lua"))()
    assert(SMODS.load_file("consumables/ctrl0.lua"))()
    assert(SMODS.load_file("consumables/windowsctrlshiftb.lua"))()
    assert(SMODS.load_file("consumables/ctrlshiftaltwindowsl.lua"))()
    assert(SMODS.load_file("consumables/ctrlb.lua"))()
    assert(SMODS.load_file("consumables/ctrli.lua"))()
    assert(SMODS.load_file("consumables/ctrlu.lua"))()
    assert(SMODS.load_file("consumables/ctrlf.lua"))()
    assert(SMODS.load_file("consumables/f5.lua"))()
    assert(SMODS.load_file("consumables/thechineseroom.lua"))()
    assert(SMODS.load_file("consumables/theworldamyedition.lua"))()
    assert(SMODS.load_file("consumables/thefoolamyedition.lua"))()
    assert(SMODS.load_file("consumables/strengthamyedition.lua"))()
    assert(SMODS.load_file("consumables/theemperoramyedition.lua"))()
    assert(SMODS.load_file("consumables/themoonamyedition.lua"))()
end
--load the sets
assert(SMODS.load_file("consumables/sets.lua"))()
-- load the enhancements
if true then
    assert(SMODS.load_file("enhancements/orange.lua"))()
    assert(SMODS.load_file("enhancements/blue.lua"))()
    assert(SMODS.load_file("enhancements/burning.lua"))()
    assert(SMODS.load_file("enhancements/corrupted.lua"))()
    assert(SMODS.load_file("enhancements/drenched.lua"))()
    assert(SMODS.load_file("enhancements/eczema.lua"))()
    assert(SMODS.load_file("enhancements/electric.lua"))()
    assert(SMODS.load_file("enhancements/hashtag.lua"))()
    assert(SMODS.load_file("enhancements/meat.lua"))()
    assert(SMODS.load_file("enhancements/frozen.lua"))()
    assert(SMODS.load_file("enhancements/crystalized.lua"))()
end

-- load the seals
if true then
    assert(SMODS.load_file("seals/rage_seal.lua"))()
    assert(SMODS.load_file("seals/chud.lua"))()
    assert(SMODS.load_file("seals/discord_ping.lua"))()
    assert(SMODS.load_file("seals/marked.lua"))()
    assert(SMODS.load_file("seals/greenseal.lua"))()
    assert(SMODS.load_file("seals/yellowseal.lua"))()
    assert(SMODS.load_file("seals/lavenderseal.lua"))()
end

-- load the editions
if true then
    assert(SMODS.load_file("editions/scorched.lua"))()
    assert(SMODS.load_file("editions/aluminum_foil.lua"))()
    assert(SMODS.load_file("editions/reinforced_foil.lua"))()
    assert(SMODS.load_file("editions/perishable.lua"))()
end

-- load the vouchers
if true then
    assert(SMODS.load_file("vouchers/recycling_bin.lua"))()
    assert(SMODS.load_file("vouchers/trash_bin.lua"))()
    assert(SMODS.load_file("vouchers/vipgamepass.lua"))()
end

-- load the decks
if true then
    assert(SMODS.load_file("decks/bucket_of_doomed_souls_deck.lua"))()
    assert(SMODS.load_file("decks/conveyor_belt_sushi_deck.lua"))()
    assert(SMODS.load_file("decks/the_deck_that_takes_a_century_to_beat.lua"))()
    assert(SMODS.load_file("decks/chance_deck.lua"))()
    assert(SMODS.load_file("decks/refrigerator_deck.lua"))()
    assert(SMODS.load_file("decks/zombie_apocalypse_deck.lua"))()
    assert(SMODS.load_file("decks/lost_silver_deck.lua"))()
    assert(SMODS.load_file("decks/one_bounce_deck.lua"))()
    assert(SMODS.load_file("decks/sauces_optimal_deck.lua"))()
    assert(SMODS.load_file("decks/metaverse_deck.lua"))()
    assert(SMODS.load_file("decks/kyle_deck.lua"))()
    assert(SMODS.load_file("decks/_cigarettes_deck.lua"))()
    assert(SMODS.load_file("decks/shibuya_incident_deck.lua"))()
    assert(SMODS.load_file("decks/arbys_deck.lua"))()
end



assert(SMODS.load_file("rarities.lua"))()


-- load boosters
assert(SMODS.load_file("boosters.lua"))()
--load sounds
assert(SMODS.load_file("sounds.lua"))()
SMODS.ObjectType({
    key = "sauce_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true,
        ["j_sauce_chips"] = true,
        ["j_sauce_orby"] = true,
        ["j_sauce_icecreamtreat"] = true,
        ["j_sauce_honeybun"] = true,
        ["j_sauce_milk"] = true,
        ["j_sauce_nut"] = true,
        ["j_sauce_energydrink"] = true,
        ["j_sauce_greenapples"] = true,
        ["j_sauce_spaghetti"] = true
    },
})

SMODS.ObjectType({
    key = "sauce_roblox",
    cards = {
        ["j_sauce__10hourburstman"] = true,
        ["j_sauce_averageshedletskyplayer"] = true,
        ["j_sauce_azure"] = true,
        ["j_sauce_banana"] = true,
        ["j_sauce_bluudud"] = true,
        ["j_sauce_bubblyproto"] = true,
        ["j_sauce_captaintrotter"] = true,
        ["j_sauce_caretaker"] = true,
        ["j_sauce_cashier"] = true,
        ["j_sauce_cementful"] = true,
        ["j_sauce_cinderblock"] = true,
        ["j_sauce_combatdummy"] = true,
        ["j_sauce_combatking"] = true,
        ["j_sauce_divadayo"] = true,
        ["j_sauce_emerson"] = true,
        ["j_sauce_father"] = true,
        ["j_sauce_fleshcousin"] = true,
        ["j_sauce_funyconfessions"] = true,
        ["j_sauce_gasa4player"] = true,
        ["j_sauce_goldenchance"] = true,
        ["j_sauce_guest666"] = true,
        ["j_sauce_harken"] = true,
        ["j_sauce_homelesschance"] = true,
        ["j_sauce_hotdog"] = true,
        ["j_sauce_investigativeiris"] = true,
        ["j_sauce_ithor"] = true,
        ["j_sauce_johndoe"] = true,
        ["j_sauce_killerkyle"] = true,
        ["j_sauce_kitchenwizard"] = true,
        ["j_sauce_kookoo"] = true,
        ["j_sauce_lampert"] = true,
        ["j_sauce_litany"] = true,
        ["j_sauce_lodsofmonechance"] = true,
        ["j_sauce_loveshot"] = true,
        ["j_sauce_luisgamercool23"] = true,
        ["j_sauce_mafioso"] = true,
        ["j_sauce_mr"] = true,
        ["j_sauce_noli"] = true,
        ["j_sauce_hallucination"] = true,
        ["j_sauce_orby"] = true,
        ["j_sauce_patitofi8"] = true,
        ["j_sauce_pest"] = true,
        ["j_sauce_philiptheeverlasting"] = true,
        ["j_sauce_rangersguests"] = true,
        ["j_sauce_reddy"] = true,
        ["j_sauce_revolver"] = true,
        ["j_sauce_robloxegor"] = true,
        ["j_sauce_slasher"] = true,
        ["j_sauce_soul"] = true,
        ["j_sauce_specimen009"] = true,
        ["j_sauce_spud"] = true,
        ["j_sauce_thegreatfloccinaucinihilipilification"] = true,
        ["j_sauce_thespectre"] = true,
        ["j_sauce_theedgeman"] = true,
        ["j_sauce_thisismassammunition"] = true,
        ["j_sauce_twotime"] = true,
        ["j_sauce_visageoffalsehope"] = true,
        ["j_sauce_wallter"] = true,
        ["j_sauce_wetcementvendingmachine"] = true,
        ["j_sauce_whalesshedletsky"] = true,
        ["j_sauce_workclockchance"] = true,
        ["j_sauce_devilware"] = true,
        ["j_sauce_johnforsaken"] = true,
        ["j_sauce_dusekkar"] = true,
        ["j_sauce_vipdoor"] = true,
        ["j_sauce_theancients"] = true,
        ["j_sauce_greed"] = true,
        ["j_sauce_solitude"] = true,
        ["j_sauce_fear"] = true,
        ["j_sauce_hatred"] = true,
        ["j_sauce_blocktalesplayer"] = true,
        ["j_sauce_mac0"] = true,
        ["j_sauce_springer"] = true,
        ["j_sauce_skinwalker"] = true,
        ["j_sauce_flesh"] = true,
        ["j_sauce_random"] = true,
        ["j_sauce_america"] = true,
        ["j_sauce_icecreamtreat"] = true,
        ["j_sauce_hearttoheart"] = true,
        ["j_sauce_californianfriday"] = true,
        ["j_sauce_anchorfromthesky"] = true,
        ["j_sauce_bottle"] = true,
        ["j_sauce_brimstone"] = true,
        ["j_sauce_canadianriot"] = true,
        ["j_sauce_copperwirewrappedrock"] = true,
        ["j_sauce_blackholeraygun"] = true,
        ["j_sauce_poserskatana"] = true,
        ["j_sauce_football"] = true,
        ["j_sauce_freezeray"] = true,
        ["j_sauce_grandjavelin"] = true,
        ["j_sauce_grandvolley"] = true,
        ["j_sauce_hitman"] = true,
        ["j_sauce_honeybun"] = true,
        ["j_sauce_milk"] = true,
        ["j_sauce_nokia"] = true,
        ["j_sauce_honk"] = true,
        ["j_sauce_oldspeakers"] = true,
        ["j_sauce_nut"] = true,
        ["j_sauce_pinger"] = true,
        ["j_sauce_piratecannon"] = true,
        ["j_sauce_polishartillery"] = true,
        ["j_sauce_pm9evilgun"] = true,
        ["j_sauce_smallpebble"] = true,
        ["j_sauce_stomp"] = true,
        ["j_sauce_taser"] = true,
        ["j_sauce_toygeargun"] = true,
        ["j_sauce_unrelentingforce"] = true,
        ["j_sauce_vampireknives"] = true,
        ["j_sauce_wakeupcall"] = true,
        ["j_sauce_whatistherockcooking"] = true,
        ["j_sauce_allexpensespaidfreeislandgetawaybrochure"] = true,
        ["j_sauce_audacity"] = true,
        ["j_sauce_ashurasenku"] = true,
        ["j_sauce_bucketofstuds"] = true,
        ["j_sauce_contractorjudgement"] = true,
        ["j_sauce_amuletofthewhiteking"] = true,
        ["j_sauce_dunk"] = true,
        ["j_sauce_dwarfer"] = true,
        ["j_sauce_eyepatch"] = true,
        ["j_sauce_energydrink"] = true,
        ["j_sauce_fireforce"] = true,
        ["j_sauce_goldenshedletsky"] = true,
        ["j_sauce_abberantjohndoe"] = true,
        ["j_sauce_theghostofjanedoe"] = true,
        ["j_sauce_theguideshedletsky"] = true,
        ["j_sauce_crazyblox1x1x1x1"] = true,
        ["j_sauce__26folk"] = true
    },
})

SMODS.ObjectType({
    key = "sauce_sonic",
    cards = {
        ["j_sauce_2011x"] = true,
        ["j_sauce__2017x"] = true,
        ["j_sauce_bigmisser"] = true,
        ["j_sauce_blazethecat"] = true,
        ["j_sauce_cream"] = true,
        ["j_sauce_diablo"] = true,
        ["j_sauce_elpendriveazul"] = true,
        ["j_sauce_end"] = true,
        ["j_sauce_furnace"] = true,
        ["j_sauce_indigo"] = true,
        ["j_sauce_lordx"] = true,
        ["j_sauce_metalsonic"] = true,
        ["j_sauce_motobug"] = true,
        ["j_sauce_niku"] = true,
        ["j_sauce_paceandtheshadow"] = true,
        ["j_sauce_rewriteprime"] = true,
        ["j_sauce_shadowthehedgehog"] = true,
        ["j_sauce_sonicthehedgehog"] = true,
        ["j_sauce_starved"] = true,
        ["j_sauce_surgethetenrec"] = true,
        ["j_sauce_tailsdoll"] = true,
        ["j_sauce_tailsthefox"] = true,
        ["j_sauce_kitsunamithefennec"] = true,
        ["j_sauce_silverthehedgehog"] = true,
        ["j_sauce_freddythehedgehog"] = true,
        ["j_sauce_bear5thehedgehog"] = true,
        ["j_sauce_amyrose"] = true,
        ["j_sauce_fatalerror"] = true,
        ["j_sauce_beauty"] = true,
        ["j_sauce_meatshow"] = true,
        ["j_sauce_thefirerises"] = true,
        ["j_sauce_imissthequiet"] = true,
        ["j_sauce_youmustanswer"] = true,
        ["j_sauce_minds"] = true,
        ["j_sauce_ididthat"] = true,
        ["j_sauce_scars"] = true,
        ["j_sauce_sinister"] = true,
        ["j_sauce_feelthatdread"] = true,
        ["j_sauce_runaway"] = true,
        ["j_sauce_redhanded"] = true,
        ["j_sauce_dontcomeback"] = true,
        ["j_sauce_mazinsonic"] = true,
        ["j_sauce_gleeco"] = true,
        ["j_sauce_whatcoulditbe"] = true,
        ["j_sauce_unlikeyou"] = true,
        ["j_sauce_tripwire"] = true,
        ["j_sauce_fleetwaysupersonic"] = true,
        ["j_sauce_reminisce"] = true,
        ["j_sauce_outcast"] = true,
        ["j_sauce_rotaway"] = true,
        ["j_sauce_karma"] = true,
        ["j_sauce_rememberme"] = true,
        ["j_sauce_justleaving"] = true,
        ["j_sauce_deathgrip"] = true,
        ["j_sauce_fffharshtruths"] = true
    },
})

SMODS.ObjectType({
    key = "sauce_sauce_jokers",
    cards = {
        ["j_sauce__7zip"] = true,
        ["j_sauce_guy"] = true,
        ["j_sauce_alephnull"] = true,
        ["j_sauce_andthefacedrooledthensaiddurr"] = true,
        ["j_sauce_apocalypsebird"] = true,
        ["j_sauce_asgoredreemurr"] = true,
        ["j_sauce_averagejokerforgejoker"] = true,
        ["j_sauce_average_vanilla_jokerforge_joker"] = true,
        ["j_sauce_badegg"] = true,
        ["j_sauce_banana"] = true,
        ["j_sauce_bear5"] = true,
        ["j_sauce_beer"] = true,
        ["j_sauce_beginner_balatro_player"] = true,
        ["j_sauce_bigbird"] = true,
        ["j_sauce_billcipher"] = true,
        ["j_sauce_blindfoldedjoker"] = true,
        ["j_sauce_bluestormyuri"] = true,
        ["j_sauce_burningblaze"] = true,
        ["j_sauce_burntjokerslittlecousin"] = true,
        ["j_sauce_candle"] = true,
        ["j_sauce_captaintrotter"] = true,
        ["j_sauce_caretaker"] = true,
        ["j_sauce_cashier"] = true,
        ["j_sauce_catbox"] = true,
        ["j_sauce_cementful"] = true,
        ["j_sauce_charliesinferno"] = true,
        ["j_sauce_chips"] = true,
        ["j_sauce_chubby_baby_chubby_baby_so_cute"] = true,
        ["j_sauce_chud"] = true,
        ["j_sauce_clock"] = true,
        ["j_sauce_clover"] = true,
        ["j_sauce_combatdummy"] = true,
        ["j_sauce_combatking"] = true,
        ["j_sauce_comykel"] = true,
        ["j_sauce_costco"] = true,
        ["j_sauce_costcomembershipcard"] = true,
        ["j_sauce_danceordie"] = true,
        ["j_sauce_deckfixingatitsfinest"] = true,
        ["j_sauce_devilmario"] = true,
        ["j_sauce_dirtybubble"] = true,
        ["j_sauce_dougadougdougstory"] = true,
        ["j_sauce_ellierose"] = true,
        ["j_sauce_emerson"] = true,
        ["j_sauce_error54"] = true,
        ["j_sauce_fishermanjoker"] = true,
        ["j_sauce_fleshcousin"] = true,
        ["j_sauce_flopera"] = true,
        ["j_sauce_fourest"] = true,
        ["j_sauce_friend"] = true,
        ["j_sauce_furnace"] = true,
        ["j_sauce_gasa4player"] = true,
        ["j_sauce_guinevere"] = true,
        ["j_sauce_guncylinder"] = true,
        ["j_sauce_harken"] = true,
        ["j_sauce_harlequincontraption"] = true,
        ["j_sauce_henrystickmin"] = true,
        ["j_sauce_hotdog"] = true,
        ["j_sauce_howoldareyou"] = true,
        ["j_sauce_huntinhumans"] = true,
        ["j_sauce_hyper_sonic"] = true,
        ["j_sauce_igaku"] = true,
        ["j_sauce_imgonnaeatthisglass"] = true,
        ["j_sauce_insideeachmealisamysteryemerald"] = true,
        ["j_sauce_ithor"] = true,
        ["j_sauce_jabibifactory"] = true,
        ["j_sauce_jabibixd"] = true,
        ["j_sauce_jackpotoverdose"] = true,
        ["j_sauce_jokerraritybug"] = true,
        ["j_sauce_joker150"] = true,
        ["j_sauce_jokerforgeshowcasechannel"] = true,
        ["j_sauce_judgementbird"] = true,
        ["j_sauce_kj"] = true,
        ["j_sauce_knowyourhomers"] = true,
        ["j_sauce_kookoo"] = true,
        ["j_sauce_lampert"] = true,
        ["j_sauce_letstakealook"] = true,
        ["j_sauce_litany"] = true,
        ["j_sauce_loveshot"] = true,
        ["j_sauce_manbehindthetree"] = true,
        ["j_sauce_managergangle"] = true,
        ["j_sauce_misterretrigger"] = true,
        ["j_sauce_moneyman"] = true,
        ["j_sauce_mr"] = true,
        ["j_sauce_neptune"] = true,
        ["j_sauce_nothingburger"] = true,
        ["j_sauce_ohungi"] = true,
        ["j_sauce_patitofi8"] = true,
        ["j_sauce_pest"] = true,
        ["j_sauce_philiptheeverlasting"] = true,
        ["j_sauce_pizzaguy"] = true,
        ["j_sauce_punishingbird"] = true,
        ["j_sauce_rangersguests"] = true,
        ["j_sauce_reddy"] = true,
        ["j_sauce_reginaldcopperbottom"] = true,
        ["j_sauce_revolver"] = true,
        ["j_sauce_righthandman"] = true,
        ["j_sauce_robloxegor"] = true,
        ["j_sauce_rock"] = true,
        ["j_sauce_saucequest31"] = true,
        ["j_sauce_saucescondimentpack"] = true,
        ["j_sauce_skidandpump"] = true,
        ["j_sauce_soul"] = true,
        ["j_sauce_sparetrousersenthusiast"] = true,
        ["j_sauce_specimen009"] = true,
        ["j_sauce_spellbook"] = true,
        ["j_sauce_spud"] = true,
        ["j_sauce_starved"] = true,
        ["j_sauce_supersonic"] = true,
        ["j_sauce_tailsdoll"] = true,
        ["j_sauce_tailsthefox"] = true,
        ["j_sauce_thanos"] = true,
        ["j_sauce_theboss"] = true,
        ["j_sauce_thechosenone"] = true,
        ["j_sauce_thecursechallenge"] = true,
        ["j_sauce_thedarklord"] = true,
        ["j_sauce_thetouchofmidas"] = true,
        ["j_sauce_thewheel"] = true,
        ["j_sauce_theedgeman"] = true,
        ["j_sauce_true"] = true,
        ["j_sauce_velvet"] = true,
        ["j_sauce_virtualboy"] = true,
        ["j_sauce_visageoffalsehope"] = true,
        ["j_sauce_wspeed"] = true,
        ["j_sauce_wallter"] = true,
        ["j_sauce_waterbottle"] = true,
        ["j_sauce_wdwario"] = true,
        ["j_sauce_wetcementvendingmachine"] = true,
        ["j_sauce_whatllbefellas"] = true,
        ["j_sauce_wheeloffortunewillnothit"] = true,
        ["j_sauce_whowantstoholdthetungstencube"] = true,
        ["j_sauce_yixi"] = true,
        ["j_sauce_hmmtodayiwill"] = true,
        ["j_sauce_theroaringknight"] = true,
        ["j_sauce_rouxlskaardsthrouple"] = true,
        ["j_sauce_badware"] = true,
        ["j_sauce_cookieware"] = true,
        ["j_sauce_devilware"] = true,
        ["j_sauce_aspxnoli"] = true,
        ["j_sauce_desperationmarch"] = true,
        ["j_sauce_sniperrifle"] = true,
        ["j_sauce_mlgchance"] = true,
        ["j_sauce_pursuer"] = true,
        ["j_sauce_clipboard"] = true,
        ["j_sauce_killdroid"] = true,
        ["j_sauce_playmygame"] = true,
        ["j_sauce_heisntlaughing"] = true,
        ["j_sauce_oneyplays"] = true,
        ["j_sauce_kitsunamithefennec"] = true,
        ["j_sauce_steponup"] = true,
        ["j_sauce_ralseiplushownersvsspamtonplushowners"] = true,
        ["j_sauce_goldtoothjoker"] = true,
        ["j_sauce_one"] = true,
        ["j_sauce_three"] = true,
        ["j_sauce_kolossos"] = true,
        ["j_sauce_four"] = true,
        ["j_sauce_five"] = true,
        ["j_sauce_ecla17"] = true,
        ["j_sauce_oopsbluesmileygrosmichel"] = true,
        ["j_sauce_silverthehedgehog"] = true,
        ["j_sauce_kaiandspeedadventures64"] = true,
        ["j_sauce_freddythehedgehog"] = true,
        ["j_sauce_bear5thehedgehog"] = true,
        ["j_sauce_amyrose"] = true,
        ["j_sauce_capcutfireeffect"] = true,
        ["j_sauce_spamton"] = true,
        ["j_sauce_smileygraph"] = true,
        ["j_sauce_vipdoor"] = true,
        ["j_sauce_viproom"] = true,
        ["j_sauce_cruelking"] = true,
        ["j_sauce_fatalerror"] = true,
        ["j_sauce_zombie"] = true,
        ["j_sauce_grossmichael"] = true,
        ["j_sauce_whereswaldo"] = true,
        ["j_sauce_onebouncesurvivor"] = true,
        ["j_sauce_fireboyandwatergirl"] = true,
        ["j_sauce_season17"] = true,
        ["j_sauce_gramholo"] = true,
        ["j_sauce_whatisthisdiddybluddoinonthecalc"] = true,
        ["j_sauce_scp067"] = true,
        ["j_sauce_aceface"] = true,
        ["j_sauce_theancients"] = true,
        ["j_sauce_greed"] = true,
        ["j_sauce_solitude"] = true,
        ["j_sauce_fear"] = true,
        ["j_sauce_hatred"] = true,
        ["j_sauce_blocktalesplayer"] = true,
        ["j_sauce_mac0"] = true,
        ["j_sauce_maninthemirror"] = true,
        ["j_sauce_offthewall"] = true,
        ["j_sauce_beauty"] = true,
        ["j_sauce_meatshow"] = true,
        ["j_sauce_loveneverfeltsogood"] = true,
        ["j_sauce_thefirerises"] = true,
        ["j_sauce_imissthequiet"] = true,
        ["j_sauce_youmustanswer"] = true,
        ["j_sauce_minds"] = true,
        ["j_sauce_ididthat"] = true,
        ["j_sauce_scars"] = true,
        ["j_sauce_sinister"] = true,
        ["j_sauce_feelthatdread"] = true,
        ["j_sauce_runaway"] = true,
        ["j_sauce_redhanded"] = true,
        ["j_sauce_dontcomeback"] = true,
        ["j_sauce_starface"] = true,
        ["j_sauce_springer"] = true,
        ["j_sauce_skinwalker"] = true,
        ["j_sauce_flesh"] = true,
        ["j_sauce_guardian"] = true,
        ["j_sauce_random"] = true,
        ["j_sauce_america"] = true,
        ["j_sauce_icecreamtreat"] = true,
        ["j_sauce_hearttoheart"] = true,
        ["j_sauce_californianfriday"] = true,
        ["j_sauce_anchorfromthesky"] = true,
        ["j_sauce_bottle"] = true,
        ["j_sauce_brimstone"] = true,
        ["j_sauce_canadianriot"] = true,
        ["j_sauce_copperwirewrappedrock"] = true,
        ["j_sauce_blackholeraygun"] = true,
        ["j_sauce_poserskatana"] = true,
        ["j_sauce_football"] = true,
        ["j_sauce_freezeray"] = true,
        ["j_sauce_grandjavelin"] = true,
        ["j_sauce_grandvolley"] = true,
        ["j_sauce_hitman"] = true,
        ["j_sauce_honeybun"] = true,
        ["j_sauce_mazinsonic"] = true,
        ["j_sauce_jokerforgeautosaves"] = true,
        ["j_sauce_milk"] = true,
        ["j_sauce_nokia"] = true,
        ["j_sauce_honk"] = true,
        ["j_sauce_oldspeakers"] = true,
        ["j_sauce_nut"] = true,
        ["j_sauce_pinger"] = true,
        ["j_sauce_piratecannon"] = true,
        ["j_sauce_polishartillery"] = true,
        ["j_sauce_pm9evilgun"] = true,
        ["j_sauce_smallpebble"] = true,
        ["j_sauce_stomp"] = true,
        ["j_sauce_taser"] = true,
        ["j_sauce_toygeargun"] = true,
        ["j_sauce_unrelentingforce"] = true,
        ["j_sauce_vampireknives"] = true,
        ["j_sauce_wakeupcall"] = true,
        ["j_sauce_whatistherockcooking"] = true,
        ["j_sauce_allexpensespaidfreeislandgetawaybrochure"] = true,
        ["j_sauce_audacity"] = true,
        ["j_sauce_ashurasenku"] = true,
        ["j_sauce_backwardslongjump"] = true,
        ["j_sauce_bucketofstuds"] = true,
        ["j_sauce_contractorjudgement"] = true,
        ["j_sauce_amuletofthewhiteking"] = true,
        ["j_sauce_dunk"] = true,
        ["j_sauce_dwarfer"] = true,
        ["j_sauce_eyepatch"] = true,
        ["j_sauce_energydrink"] = true,
        ["j_sauce_fireforce"] = true,
        ["j_sauce_ilovebeingpartoftheeconomyitswhatiwasborntodo"] = true,
        ["j_sauce_porchthiefjoker"] = true,
        ["j_sauce_agenericgenericplatformer"] = true,
        ["j_sauce_goldenshedletsky"] = true,
        ["j_sauce_rolledupjoker"] = true,
        ["j_sauce_gleeco"] = true,
        ["j_sauce_whatcoulditbe"] = true,
        ["j_sauce_unlikeyou"] = true,
        ["j_sauce_atlantalowpressureedit"] = true,
        ["j_sauce_tripwire"] = true,
        ["j_sauce_greensans"] = true,
        ["j_sauce_weathergirl"] = true,
        ["j_sauce_nomoreinnocence"] = true,
        ["j_sauce_kendricklamar"] = true,
        ["j_sauce_fleetwaysupersonic"] = true,
        ["j_sauce_abberantjohndoe"] = true,
        ["j_sauce_theghostofjanedoe"] = true,
        ["j_sauce_theguideshedletsky"] = true,
        ["j_sauce_crazyblox1x1x1x1"] = true,
        ["j_sauce__26folk"] = true,
        ["j_sauce_autopsyreport"] = true,
        ["j_sauce_hwando"] = true,
        ["j_sauce_mcpicklepounder"] = true,
        ["j_sauce_yuri"] = true,
        ["j_sauce_greenapples"] = true,
        ["j_sauce_reminisce"] = true,
        ["j_sauce_outcast"] = true,
        ["j_sauce_rotaway"] = true,
        ["j_sauce_karma"] = true,
        ["j_sauce_rememberme"] = true,
        ["j_sauce_haveyoueverplayedbalatrowithyourlifeontheline"] = true,
        ["j_sauce_justleaving"] = true,
        ["j_sauce_deathgrip"] = true,
        ["j_sauce_fffharshtruths"] = true,
        ["j_sauce_shegoncallmebabyboo"] = true,
        ["j_sauce_yujiitadori"] = true,
        ["j_sauce_satorugojo"] = true,
        ["j_sauce_ryomensukuna"] = true,
        ["j_sauce_sans"] = true,
        ["j_sauce_papyrus"] = true,
        ["j_sauce_spaghetti"] = true,
        ["j_sauce_badtime"] = true,
        ["j_sauce_harutashigemo"] = true,
        ["j_sauce_naoyazenin"] = true,
        ["j_sauce_deltarunetomorrow"] = true,
        ["j_sauce_yutaokkotsuandrika"] = true,
        ["j_sauce_yutadomain"] = true,
        ["j_sauce_megumifushiguro"] = true,
        ["j_sauce_megumidomain"] = true,
        ["j_sauce_mahoraga"] = true,
        ["j_sauce_yujidomain"] = true,
        ["j_sauce_gojodomain"] = true,
        ["j_sauce_sukunadomain"] = true,
        ["j_sauce_kyle"] = true,
        ["j_sauce_stoned"] = true,
        ["j_sauce_reallystoned"] = true,
        ["j_sauce_inkdemon"] = true,
        ["j_sauce_nobarakugisaki"] = true,
        ["j_sauce_togeinumaki"] = true,
        ["j_sauce_utahimeiori"] = true,
        ["j_sauce_maizenin"] = true,
        ["j_sauce_kokichimuta"] = true,
        ["j_sauce_fumihikotakaba"] = true,
        ["j_sauce_reggiestar"] = true,
        ["j_sauce_jacker"] = true,
        ["j_sauce_ryuishigori"] = true,
        ["j_sauce_remi"] = true,
        ["j_sauce_uraume"] = true,
        ["j_sauce_hajimekashimo"] = true,
        ["j_sauce_jiroawasaka"] = true,
        ["j_sauce_nowwhyonearthinthetoiletaretherepliers"] = true,
        ["j_sauce_fgteevspliers"] = true,
        ["j_sauce_iorihazenoki"] = true,
        ["j_sauce_iceman"] = true,
        ["j_sauce_kinjihakari"] = true,
        ["j_sauce_mahito"] = true,
        ["j_sauce_transfiguredhuman"] = true,
        ["j_sauce_bodyrepel"] = true,
        ["j_sauce_mahitoinstantspiritbodyofdistortedkilling"] = true,
        ["j_sauce_polymorphicsoulisomer"] = true,
        ["j_sauce_mahitodomain"] = true,
        ["j_sauce_atrain"] = true,
        ["j_sauce_subarutheauramonster"] = true,
        ["j_sauce_akihayakawa"] = true,
        ["j_sauce_pochitatheheroofhell"] = true,
        ["j_sauce_himeno"] = true,
        ["j_sauce_angeldevil"] = true,
        ["j_sauce_beam"] = true,
        ["j_sauce_princi"] = true
    },
})

SMODS.ObjectType({
    key = "sauce_gun",
    cards = {
        ["j_sauce_ak48"] = true,
        ["j_sauce_flintlock"] = true,
        ["j_sauce_minigun"] = true,
        ["j_sauce_rocketlauncher"] = true,
        ["j_sauce_sniperrifle"] = true,
        ["j_sauce_america"] = true,
        ["j_sauce_californianfriday"] = true,
        ["j_sauce_blackholeraygun"] = true,
        ["j_sauce_freezeray"] = true,
        ["j_sauce_piratecannon"] = true,
        ["j_sauce_pm9evilgun"] = true,
        ["j_sauce_taser"] = true,
        ["j_sauce_toygeargun"] = true
    },
})

SMODS.ObjectType({
    key = "sauce_shed",
    cards = {
        ["j_sauce_averageshedletskyplayer"] = true,
        ["j_sauce_thisismassammunition"] = true,
        ["j_sauce_whalesshedletsky"] = true,
        ["j_sauce_johnforsaken"] = true,
        ["j_sauce_goldenshedletsky"] = true,
        ["j_sauce_theguideshedletsky"] = true
    },
})

SMODS.ObjectType({
    key = "sauce_sinisterminds",
    cards = {
        ["j_sauce_bigmisser"] = true,
        ["j_sauce_beauty"] = true,
        ["j_sauce_meatshow"] = true,
        ["j_sauce_thefirerises"] = true,
        ["j_sauce_imissthequiet"] = true,
        ["j_sauce_youmustanswer"] = true,
        ["j_sauce_minds"] = true,
        ["j_sauce_ididthat"] = true,
        ["j_sauce_scars"] = true,
        ["j_sauce_sinister"] = true,
        ["j_sauce_feelthatdread"] = true,
        ["j_sauce_runaway"] = true,
        ["j_sauce_redhanded"] = true,
        ["j_sauce_dontcomeback"] = true,
        ["j_sauce_gleeco"] = true,
        ["j_sauce_whatcoulditbe"] = true,
        ["j_sauce_unlikeyou"] = true,
        ["j_sauce_reminisce"] = true,
        ["j_sauce_outcast"] = true,
        ["j_sauce_rotaway"] = true,
        ["j_sauce_karma"] = true,
        ["j_sauce_rememberme"] = true,
        ["j_sauce_justleaving"] = true,
        ["j_sauce_deathgrip"] = true,
        ["j_sauce_fffharshtruths"] = true
    },
})

SMODS.ObjectType({
    key = "sauce_vocaloid",
    cards = {
        ["j_sauce_contradictions"] = true,
        ["j_sauce_divadayo"] = true,
        ["j_sauce_fire"] = true,
        ["j_sauce_flopera"] = true,
        ["j_sauce_harlequincontraption"] = true,
        ["j_sauce_heartstealinggirl"] = true,
        ["j_sauce_igaku"] = true,
        ["j_sauce_minimumrage"] = true,
        ["j_sauce_retrynow"] = true,
        ["j_sauce_yixi"] = true,
        ["j_sauce_desperationmarch"] = true,
        ["j_sauce_ilovebeingpartoftheeconomyitswhatiwasborntodo"] = true,
        ["j_sauce_weathergirl"] = true
    },
})

SMODS.ObjectType({
    key = "sauce_gracescape",
    cards = {
        ["j_sauce_kookoo"] = true,
        ["j_sauce_litany"] = true,
        ["j_sauce_springer"] = true,
        ["j_sauce_skinwalker"] = true,
        ["j_sauce_flesh"] = true,
        ["j_sauce_guardian"] = true,
        ["j_sauce_random"] = true
    },
})

SMODS.ObjectType({
    key = "sauce_sin",
    cards = {
        ["j_sauce_greed"] = true,
        ["j_sauce_solitude"] = true,
        ["j_sauce_fear"] = true,
        ["j_sauce_hatred"] = true
    },
})

SMODS.ObjectType({
    key = "sauce_ia",
    cards = {
        ["j_sauce_icecreamtreat"] = true,
        ["j_sauce_hearttoheart"] = true,
        ["j_sauce_californianfriday"] = true,
        ["j_sauce_anchorfromthesky"] = true,
        ["j_sauce_bottle"] = true,
        ["j_sauce_brimstone"] = true,
        ["j_sauce_canadianriot"] = true,
        ["j_sauce_copperwirewrappedrock"] = true,
        ["j_sauce_blackholeraygun"] = true,
        ["j_sauce_poserskatana"] = true,
        ["j_sauce_football"] = true,
        ["j_sauce_freezeray"] = true,
        ["j_sauce_grandjavelin"] = true,
        ["j_sauce_grandvolley"] = true,
        ["j_sauce_hitman"] = true,
        ["j_sauce_honeybun"] = true,
        ["j_sauce_milk"] = true,
        ["j_sauce_nokia"] = true,
        ["j_sauce_honk"] = true,
        ["j_sauce_oldspeakers"] = true,
        ["j_sauce_nut"] = true,
        ["j_sauce_pinger"] = true,
        ["j_sauce_piratecannon"] = true,
        ["j_sauce_polishartillery"] = true,
        ["j_sauce_pm9evilgun"] = true,
        ["j_sauce_smallpebble"] = true,
        ["j_sauce_stomp"] = true,
        ["j_sauce_taser"] = true,
        ["j_sauce_toygeargun"] = true,
        ["j_sauce_unrelentingforce"] = true,
        ["j_sauce_vampireknives"] = true,
        ["j_sauce_wakeupcall"] = true,
        ["j_sauce_whatistherockcooking"] = true,
        ["j_sauce_allexpensespaidfreeislandgetawaybrochure"] = true,
        ["j_sauce_audacity"] = true,
        ["j_sauce_ashurasenku"] = true,
        ["j_sauce_bucketofstuds"] = true,
        ["j_sauce_contractorjudgement"] = true,
        ["j_sauce_amuletofthewhiteking"] = true,
        ["j_sauce_dunk"] = true,
        ["j_sauce_dwarfer"] = true,
        ["j_sauce_eyepatch"] = true,
        ["j_sauce_energydrink"] = true,
        ["j_sauce_fireforce"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end