module App exposing (..)

import Html exposing (Html, text, div, img, h1, h4, iframe, audio, ul)
import ViewHelpers exposing (viewVideo, viewMediaItem)
import Model exposing (Model, initialModel)
import Types exposing (Msg)


init : String -> ( Model, Cmd Msg )
init eventName =
    ( initialModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    let
        mediaItemsList =
            List.map viewMediaItem model.mediaItems
    in
        div []
            [ h1 [] [ text model.event ]
            , ul []
                mediaItemsList
            ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
