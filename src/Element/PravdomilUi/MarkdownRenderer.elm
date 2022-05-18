module Element.PravdomilUi.MarkdownRenderer exposing (..)

import Element.PravdomilUi exposing (..)
import Element.PravdomilUi.Theme
import Html.Attributes
import Markdown.Block
import Markdown.Html
import Markdown.Renderer


renderer : Element.PravdomilUi.Theme.Theme msg a -> Markdown.Renderer.Renderer (Element msg)
renderer theme =
    { heading = heading theme
    , paragraph = paragraph theme []
    , blockQuote = blockQuote theme []
    , html = Markdown.Html.oneOf []
    , text = text
    , codeSpan = text >> codeSpan theme []
    , strong = paragraph theme [ fontBold ]
    , emphasis = paragraph theme [ fontItalic ]
    , strikethrough = paragraph theme [ fontStrike ]
    , hardLineBreak = lineBreak
    , link = link_ theme
    , image = image_ theme
    , unorderedList = unorderedList theme
    , orderedList = orderedList theme
    , codeBlock = .body >> text >> List.singleton >> codeBlock theme []
    , thematicBreak = horizontalLine theme []
    , table = column []
    , tableHeader = column []
    , tableBody = column []
    , tableRow = row []
    , tableHeaderCell = \_ a -> paragraph theme [] a
    , tableCell = \_ a -> paragraph theme [] a
    }


heading : Element.PravdomilUi.Theme.Theme msg a -> { level : Markdown.Block.HeadingLevel, rawText : String, children : List (Element msg) } -> Element msg
heading theme a =
    case a.level of
        Markdown.Block.H1 ->
            heading1 theme [ paddingEach 0 0 16 0, id (idFromString a.rawText) ] a.children

        Markdown.Block.H2 ->
            heading2 theme [ paddingEach 0 0 16 0, id (idFromString a.rawText) ] a.children

        Markdown.Block.H3 ->
            heading3 theme [ paddingEach 0 0 16 0, id (idFromString a.rawText) ] a.children

        Markdown.Block.H4 ->
            heading4 theme [ paddingEach 0 0 16 0, id (idFromString a.rawText) ] a.children

        Markdown.Block.H5 ->
            heading5 theme [ paddingEach 0 0 16 0, id (idFromString a.rawText) ] a.children

        Markdown.Block.H6 ->
            heading6 theme [ paddingEach 0 0 16 0, id (idFromString a.rawText) ] a.children


link_ : Element.PravdomilUi.Theme.Theme msg a -> { title : Maybe String, destination : String } -> List (Element msg) -> Element msg
link_ theme a b =
    let
        titleAttr : Attribute msg
        titleAttr =
            a.title |> Maybe.map (Html.Attributes.title >> htmlAttribute) |> Maybe.withDefault noneAttribute
    in
    link theme
        [ titleAttr ]
        { label = paragraph theme [] b
        , url = a.destination
        }


image_ : Element.PravdomilUi.Theme.Theme msg a -> { alt : String, src : String, title : Maybe String } -> Element msg
image_ _ a =
    let
        titleAttr : Attribute msg
        titleAttr =
            a.title |> Maybe.map (Html.Attributes.title >> htmlAttribute) |> Maybe.withDefault noneAttribute
    in
    image [ width (shrink |> maximum 512), titleAttr ]
        { description = a.alt
        , src = a.src
        }


unorderedList : Element.PravdomilUi.Theme.Theme msg a -> List (Markdown.Block.ListItem (Element msg)) -> Element msg
unorderedList theme a =
    column [ spacing 16, paddingEach 4 0 0 0 ]
        (a
            |> List.map
                (\(Markdown.Block.ListItem b c) ->
                    row [ spacing 8 ]
                        [ el [ alignTop ]
                            (case b of
                                Markdown.Block.IncompleteTask ->
                                    inputDefaultCheckbox False

                                Markdown.Block.CompletedTask ->
                                    inputDefaultCheckbox True

                                Markdown.Block.NoTask ->
                                    text "•"
                            )
                        , paragraph theme [] c
                        ]
                )
        )


orderedList : Element.PravdomilUi.Theme.Theme msg a -> Int -> List (List (Element msg)) -> Element msg
orderedList theme startIndex a =
    column [ spacing 16, paddingEach 4 0 0 0 ]
        (a
            |> List.indexedMap
                (\i b ->
                    row [ spacing 8 ]
                        [ el [ alignTop ]
                            (text (String.fromInt (i + startIndex) ++ "."))
                        , paragraph theme [] b
                        ]
                )
        )


idFromString : String -> String
idFromString a =
    a |> String.replace " " "-"
