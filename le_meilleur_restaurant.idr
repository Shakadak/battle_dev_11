castRating : String -> List Double
castRating = map cast . words

getRatings : Nat -> IO (List String)
getRatings n = traverse id $ replicate n getLine

averageRating : List Double -> Double
averageRating xs = (sum xs) / (the Double $ cast $ List.length xs)

ratingQty : IO Nat
ratingQty = cast <$> getLine

selectRating : List Double -> Integer
selectRating = the Integer . cast . ceiling . foldl1 max

main : IO ()
main = do
  qty <- ratingQty
  ratings <- getRatings qty
  let bestRating = selectRating $ map (averageRating . castRating) ratings
  print bestRating
