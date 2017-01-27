module App exposing (..)

import Html exposing (Html, text, div, img, h1, h4, iframe, audio, ul)
import Html.Attributes exposing (class, src, width, height, attribute, autoplay, controls)


type MediaProvider
    = Vimeo
    | MP3
    | YouTube


type alias MediaItem =
    { src : String
    , description : String
    , provider : MediaProvider
    }


type alias Model =
    { event : String
    , mediaItems : List MediaItem
    }


initialModel : Model
initialModel =
    { event = "VTI 2016"
    , mediaItems =
        [ { src = "193212488"
          , provider = Vimeo
          , description = "Break Dancing 2016"
          }
        , { src = "http://developer.mozilla.org/@api/deki/files/2926/=AudioTest_(1).ogg"
          , provider = MP3
          , description = "Descent into Catland"
          }
        , { src = "pavc6BMChPw"
          , provider = YouTube
          , description = "Funny Cat Doing Dharma! LOL"
          }
        ]
    }


init : String -> ( Model, Cmd Msg )
init eventName =
    ( initialModel, Cmd.none )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


viewMediaItem : MediaItem -> Html Msg
viewMediaItem item =
    case item.provider of
        Vimeo ->
            viewVideo item

        MP3 ->
            viewMp3 item

        YouTube ->
            viewYouTube item


viewVideo item =
    div
        [ class "video-item" ]
        [ h4
            []
            [ text <| item.description ]
        , iframe
            [ src <| "https://player.vimeo.com/video/" ++ item.src
            , width 640
            , height 360
            , attribute "frameborder" "0"
            , attribute "webkitallowfullscreen" "true"
            , attribute "mozallowfullscreen" "true"
            , attribute "allowfullscreen" "true"
            ]
            []
        ]


viewMp3 item =
    div
        [ class "audio-item" ]
        [ h4
            []
            [ text <| item.description ]
        , audio
            [ autoplay False, controls True, src item.src ]
            [ text "Your browser does not support the audio element" ]
        ]


viewYouTube item =
    div
        [ class "audio-item" ]
        [ h4
            []
            [ text <| item.description ]
        , iframe
            [ src <| "https://www.youtube.com/embed/" ++ item.src
            , width 560
            , height 315
            , attribute "frameborder" "0"
            , attribute "allowfullscreen" "true"
            ]
            []
        ]


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
