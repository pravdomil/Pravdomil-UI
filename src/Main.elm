module Main exposing (..)

import Elm.Docs as Docs
import ElmUi
import Interop.JavaScript as JavaScript
import Json.Decode as Decode
import Task exposing (Task)


main : Program () () ()
main =
    case uiModule of
        Ok b ->
            JavaScript.cli (Task.succeed b)

        Err b ->
            JavaScript.cli (Task.fail (Decode.errorToString b))



--


uiModule : Result Decode.Error String
uiModule =
    ElmUi.docs
        |> Decode.decodeString (Decode.list Docs.decoder)
        |> Result.map modulesToString


modulesToString : List Docs.Module -> String
modulesToString a =
    let
        header : String
        header =
            ([]
                ++ [ "module Ui.Base exposing (..)"
                   , ""
                   , "import Ui.Style as A"
                   ]
                ++ (a |> List.map (\v -> "import " ++ v.name))
                ++ [ ""
                   , ""
                   ]
                ++ base
            )
                |> String.join "\n"

        base : List String
        base =
            [ "rem a = round (A.rootEm * a)"
            , "rem_ a = A.rootEm * a"
            , ""
            , "p a = Element.paragraph (spacing A.baseLineSpacing :: a)"
            , "textColumn a = Element.textColumn (spacing A.baseLineSpacing :: width fill :: a)" -- https://github.com/mdgriffith/elm-ui/issues/286
            , ""
            , "--"
            , ""
            ]
    in
    a
        |> List.map moduleToString
        |> String.join "\n\n--\n\n"
        |> (++) header



--


moduleToString : Docs.Module -> String
moduleToString a =
    [ case List.map (aliasToString a) a.aliases of
        [] ->
            []

        v ->
            v ++ [ "" ]
    , List.filterMap (valueToString a) a.values
    ]
        |> List.concat
        |> String.join "\n"


valueToString : Docs.Module -> Docs.Value -> Maybe String
valueToString module_ a =
    let
        ignored : List String
        ignored =
            [ "paragraph"
            , "textColumn"
            ]
    in
    if List.member a.name ignored then
        Nothing

    else if a.name == "roundEach" then
        Just (toName module_.name a.name ++ " topLeft topRight bottomLeft bottomRight = " ++ module_.name ++ "." ++ a.name ++ " { topLeft = topLeft, topRight = topRight, bottomLeft = bottomLeft, bottomRight = bottomRight }")

    else if String.endsWith "Each" a.name then
        Just (toName module_.name a.name ++ " minX maxX minY maxY = " ++ module_.name ++ "." ++ a.name ++ " { left = minX, right = maxX, top = minY, bottom = maxY }")

    else
        Just (toName module_.name a.name ++ " = " ++ module_.name ++ "." ++ a.name)


aliasToString : Docs.Module -> Docs.Alias -> String
aliasToString module_ a =
    let
        args : String
        args =
            case a.args of
                [] ->
                    ""

                _ ->
                    " " ++ String.join " " a.args
    in
    "type alias " ++ a.name ++ args ++ " = " ++ module_.name ++ "." ++ a.name ++ args



--


toName : String -> String -> String
toName moduleName a =
    case moduleName of
        "Element" ->
            a

        "Element.Background" ->
            "bg" ++ firstToUpper a

        "Element.Border" ->
            "border" ++ firstToUpper a

        "Element.Events" ->
            a

        "Element.Font" ->
            "font" ++ firstToUpper a

        "Element.Input" ->
            "input" ++ firstToUpper a

        "Element.Keyed" ->
            "keyed" ++ firstToUpper a

        "Element.Lazy" ->
            a

        "Element.Region" ->
            "region" ++ firstToUpper a

        _ ->
            a


firstToUpper : String -> String
firstToUpper a =
    a
        |> String.uncons
        |> Maybe.map (\( v, vv ) -> String.cons (Char.toUpper v) vv)
        |> Maybe.withDefault ""
