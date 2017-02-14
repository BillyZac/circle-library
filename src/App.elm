module App exposing (..)

import Html exposing (Html, text, div, img, h1, h4, iframe, audio, ul)
import ViewHelpers exposing (viewVideo, viewMediaItem)
import Model exposing (Model, initialModel)
import Types exposing (Msg)
import Http exposing (..)


init : String -> ( Model, Cmd Msg )
init eventName =
    ( initialModel, getEvents )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Types.GetEvents ->
            ( model, getEvents )

        Types.NewEvents (Ok json) ->
            let
                _ =
                    Debug.log "Fetch succeeded" json
            in
                ( model, Cmd.none )

        Types.NewEvents (Err error) ->
            let
                _ =
                    Debug.log "Fetch failed" error
            in
                ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )


getEvents : Cmd Msg
getEvents =
    "https://runkit.io/billyzac/5848387e51a98e00145131e9/branches/master"
        |> Http.getString
        |> Http.send Types.NewEvents


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
