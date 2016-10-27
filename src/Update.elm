module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Players.Update


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        PlayersMsg subMsg ->
            let
                ( updatePlayers, cmd ) =
                    Players.Update.update subMsg model.players
                        in
                            ( { model | players = updatePlayers },
                            Cmd.map PlayersMsg cmd )
