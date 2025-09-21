--Oppgave 2)

    --Oppgave 2 a) finner alle planeter som har Proxima Centauri som stjerne
    select p.navn
    from planet as p inner join stjerne as s on (p.stjerne = s.navn)
    where s.navn like 'Proxima Centauri';

    --Oppgave 2 b) finner årstall det ble oppdaget planeter i bane rundt TRAPPIST-1 og Kepler-154.
    select distinct oppdaget        
    from planet as p inner join stjerne s on (p.stjerne = s.navn)
    where s.navn like 'TRAPPIST-1' or s.navn like 'Kepler-154';

    --Oppgave 2 c) finner antall planeter som ikke har Oppgitt masse.
    select count(planet)
    from planet
    where masse is null;

    --Oppgave 2 d) finner antall planeter fra 2020 med større masse enn gjennomsnitt.
    select navn, masse
    from planet
    where oppdaget = '2020' and masse > (select avg(masse) from planet);

    --Oppgave 2 e) antall år mellom første og siste oppdaget planet.
    select max(oppdaget) - min(oppdaget)
    from planet;

--Oppgave 3) 
    --Oppgave 3 a) finner alle planeter med masse mellom 3 og 10 og som inneholder H2O.
    select p.navn
    from planet as p inner join materie as m on (p.navn = m.planet)
    where p.masse >= 3 and p.masse <= 10 and m.molekyl like 'H2O';

    --Oppgave 3 b) finner alle planeter som går i bane rundt stjerne med avstand mindre eller lik masse * 12 og som inneholder hydrogen.
    select p.navn 
    from planet as p inner join stjerne as s on (p.stjerne = s.navn)
    join materie as m on (m.planet = p.navn)
    where s.avstand <= s.masse * 12 and m.molekyl like 'H';

    --Oppgave 3 c) finne alle 2 planeter i samme solsystem med masse > 10 og avstand < 50.
    select p1.navn as planet_1, p2.navn as planet_2
    from planet as p1 join planet as p2 on (p1.stjerne = p2.stjerne and p1.navn <> p2.navn) -- passer på at vi ikke bruke samme planet.
    join stjerne as s on (p1.stjerne = s.navn)
    where p1.masse > 10 and p2.masse > 10 and s.avstand < 50;

--Oppgave 4)
    /*
    Grunnen til at Nils sin spørring ikke funker er fordi han bruker inner join på tabellene planet og stjerne.
    natural join setter sammen kolonner med samme navn. dvs i dette tilfellet blir planet.navn, planet.masse og sottet sammen 
    med stjerne.navn og stjerne.masse. så de eneste radene som blir med i resultatet er de radene hvor stjernen sin masse og navn
    er likt planeten sit navn og masse. derfor er det ingen rader med i resultatet
    */



