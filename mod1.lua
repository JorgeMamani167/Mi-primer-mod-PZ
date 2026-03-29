-- Esta función contiene todo lo que queremos que pase
local function IniciarMiMod(playerIndex, player)
    
    -- 1. DEFINIR COORDENADAS (Ejemplo: Una calle en Rosewood)
    local posX = 8151
    local posY = 11252
    local posZ = 0 -- 0 es la planta baja, 1 es el primer piso, etc.

    -- 2. TELETRANSPORTAR AL JUGADOR
    player:setX(posX)
    player:setY(posY)
    player:setZ(posZ)
    player:setLx(posX) -- Esto fuerza a la cámara a actualizar la posición
    player:setLy(posY)
    player:setLz(posZ)

    -- 3. MOSTRAR UN MENSAJE
    -- El personaje dirá esto como un texto flotante sobre su cabeza
    player:Say("¡Bienvenido a mi primer mod, a sobrevivir!")

    -- 4. ELEGIR EL ARMA
    -- Los ítems en Zomboid usan el formato "Modulo.Nombre". 
    -- "Base" es el módulo por defecto del juego. "Axe" es el hacha.
    local miArma = "Base.Axe" 

    -- 5. DAR EL ARMA AL INVENTARIO DEL JUGADOR
    player:getInventory():AddItem(miArma)

    -- 6. APARECER EL ARMA EN EL SUELO (CERCA)
    -- Para poner algo en el suelo, necesitamos ubicar la "casilla" (Square) del mapa.
    -- Le sumamos +1 a la X para que aparezca un pasito al lado tuyo y no exactamente debajo.
    local casillaDelSuelo = getCell():getGridSquare(posX + 1, posY, posZ)
    
    if casillaDelSuelo then
        -- Los números 0.5, 0.5, 0 son para centrar el ítem visualmente en la casilla
        casillaDelSuelo:AddWorldInventoryItem(miArma, 0.5, 0.5, 0)
    end

end

-- 7. CONECTAR LA FUNCIÓN AL JUEGO
-- Esto le dice al juego: "Cuando termines de crear al jugador, ejecuta mi función".
Events.OnCreatePlayer.Add(IniciarMiMod)
