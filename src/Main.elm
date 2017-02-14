module Main exposing (..)

import App exposing (..)
import Model exposing (Model)
import Html exposing (programWithFlags)
import Types exposing (Msg)


main : Program String Model Msg
main =
    programWithFlags { view = view, init = init, update = update, subscriptions = subscriptions }
