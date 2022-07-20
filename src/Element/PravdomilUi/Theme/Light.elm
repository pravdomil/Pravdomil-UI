module Element.PravdomilUi.Theme.Light exposing (..)

import Element.PravdomilUi exposing (..)
import Element.PravdomilUi.Theme


theme : Element.PravdomilUi.Theme.Style {} -> Element.PravdomilUi.Theme.Theme msg {}
theme a =
    let
        focusShadow =
            { color = a.primary |> toRgb |> (\v -> { v | alpha = 0.4 }) |> fromRgb
            , offset = ( 0, 0 )
            , blur = 0
            , size = 4
            }
    in
    { options =
        [ focusStyle { backgroundColor = Nothing, borderColor = Nothing, shadow = Just focusShadow }
        ]
    , page =
        [ bgColor a.black10
        , fontColor a.black90
        , fontSize 16
        , fontFamily a.fontFamily
        ]
    , paragraph =
        [ spacing 8
        ]
    , textColumn =
        [ spacing 8
        ]
    , link =
        [ fontColor a.primary
        , borderRounded 4
        , focused [ borderShadow focusShadow ]
        ]
    , heading1 =
        [ fontSize 32
        ]
    , heading2 =
        [ fontSize 28
        ]
    , heading3 =
        [ fontSize 24
        ]
    , heading4 =
        [ fontSize 20
        ]
    , heading5 =
        [ fontSize 16
        ]
    , heading6 =
        [ fontSize 16
        ]
    , horizontalLine =
        [ borderWidthEach 0 0 0 1
        , borderColor a.black30
        ]
    , horizontalLineContainer =
        [ paddingXY 0 16
        ]
    , label =
        [ fontColor a.black60
        , fontSize 14
        ]
    , button =
        [ spacing 8
        , padding 8
        , bgColor a.primary
        , fontColor a.black0
        , borderRounded 8
        ]
    , input =
        [ spacing 8
        , padding 8
        , bgColor a.black0
        , fontColor a.black90
        , borderColor a.black40
        , borderWidth 1
        , borderRounded 4
        ]
    , inputPlaceholder =
        [ fontColor a.black60
        , fontSize 14
        ]
    , blockQuote =
        [ spacing 16
        , paddingEach 32 0 0 0
        ]
    , codeSpan =
        [ padding 2
        , borderRounded 4
        , bgColor a.black20
        , fontFamily a.monospaceFontFamily
        ]
    , codeBlock =
        [ width fill
        , padding 8
        , borderRounded 4
        , bgColor a.black20
        , fontFamily a.monospaceFontFamily
        ]
    }



--


style : Element.PravdomilUi.Theme.Style {}
style =
    { black100 = rgb 0 0 0
    , black90 = rgb 0.12 0.14 0.15
    , black80 = rgb 0.19 0.22 0.24
    , black70 = rgb 0.28 0.31 0.33
    , black60 = rgb 0.41 0.45 0.48
    , black50 = rgb 0.67 0.7 0.73
    , black40 = rgb 0.8 0.82 0.84
    , black30 = rgb 0.86 0.88 0.89
    , black20 = rgb 0.9 0.92 0.93
    , black10 = rgb 0.96 0.97 0.97
    , black0 = rgb 1 1 1

    --
    , primary = rgb 0.05 0.43 0.99
    , secondary = rgb 0.41 0.45 0.48

    --
    , danger = rgb 0.86 0.21 0.27
    , info = rgb 0.05 0.79 0.94
    , success = rgb 0.1 0.53 0.33
    , warning = rgb 1 0.76 0.03

    --
    , fontFamily =
        [ fontTypeface "system-ui"
        , fontTypeface "-apple-system"
        , fontTypeface "Segoe UI"
        , fontTypeface "Roboto"
        , fontTypeface "Helvetica Neue"
        , fontTypeface "Arial"
        , fontTypeface "Noto Sans"
        , fontTypeface "Liberation Sans"
        , fontSansSerif
        , fontTypeface "Apple Color Emoji"
        , fontTypeface "Segoe UI Emoji"
        , fontTypeface "Segoe UI Symbol"
        , fontTypeface "Noto Color Emoji"
        ]
    , monospaceFontFamily =
        [ fontTypeface "SFMono-Regular"
        , fontTypeface "Menlo"
        , fontTypeface "Monaco"
        , fontTypeface "Consolas"
        , fontTypeface "Liberation Mono"
        , fontTypeface "Courier New"
        , fontMonospace
        ]

    --
    , shadow =
        \v ->
            { offset = ( 0, v / 3 )
            , size = 0
            , blur = v
            , color = rgba 0 0 0 0.2
            }
    }
