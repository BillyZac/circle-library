module App exposing (..)

import Html exposing (Html, text, div, img, h1, h4, iframe, audio, ul)
import ViewHelpers exposing (viewVideo, viewMediaItem, viewEvent)
import Model exposing (Model, initialModel)
import Types exposing (Msg, Event)
import Http exposing (..)
import Json.Decode as Decode exposing (Decoder, field, succeed)


init : String -> ( Model, Cmd Msg )
init eventName =
    ( initialModel, getEvents )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Types.GetEvents ->
            ( model, getEvents )

        Types.NewEvents (Ok events) ->
            let
                _ =
                    Debug.log "Fetch succeeded" events
            in
                ( { model | events = events }, Cmd.none )

        Types.NewEvents (Err error) ->
            let
                _ =
                    Debug.log "Fetch failed" error
            in
                ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )


eventsUrl : String
eventsUrl =
    "https://runkit.io/billyzac/5848387e51a98e00145131e9/branches/master"


getEvents : Cmd Msg
getEvents =
    (Decode.list eventDecoder)
        |> Http.get eventsUrl
        |> Http.send Types.NewEvents



-- DECODERS


eventDecoder : Decoder Event
eventDecoder =
    Decode.map2 Event
        (field "name" Decode.string)
        (field "id" Decode.int)


view : Model -> Html Msg
view model =
    let
        mediaItemsList =
            List.map viewMediaItem model.mediaItems
    in
        div [] (List.map viewEvent model.events)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
