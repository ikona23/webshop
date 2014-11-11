#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8
Product.delete_all
Product.create(:title => 'PŘÍRODNÍ PEDIG, ŠÉNY, PÁSKY / balení 250 g',
  :description => 
    %{<p>
        <em>Velice jemný pedig.</em> Vhodný na pletení zvonečků a jiných miniatur.
Kombinujete malé a velké zvonečky? Mohlo by vás zajímat zvýhodněné balení
"zvonečkového" pedigu: malé zvonečkové balení - 1 + 1,5 mmvelké zvonečkové
balení - 1 + 1,5 + 2 mm Pletení zvonečků vám ulehčí naše dřevěné formy.
Vybírat můžete ze čtyř velikostí... S výška 3,3 cm dolní průměr 3 cmM výška
 5,5 cm dolní průměr 4,5 cm L výška 7
      </p>},
  :image_url =>   '/assets/pedig1.gif',
  :price => 200)
# . . .
Product.create(:title => 'PŘÍRODNÍ PEDIG, ŠÉNY, PÁSKY / balení 350 g',
  :description =>
    %{<p>
       <em>Velice jemný pedig.</em>Vhodný na pletení zvonečků a jiných miniatur.
Kombinujete malé a velké zvonečky? Mohlo by vás zajímat zvýhodněné balení
"zvonečkového" pedigu: malé zvonečkové balení - 1 + 1,5 mmvelké zvonečkové
balení - 1 + 1,5 + 2 mm Pletení zvonečků vám ulehčí naše dřevěné formy.
Vybírat můžete ze čtyř velikostí... S výška 3,3 cm dolní průměr 3 cmM výška
 5,5 cm dolní průměr 4,5 cm L výška 7
      </p>},
  :image_url => '/assets/pedig1.gif',
  :price => 300)
# . . .

Product.create(:title => 'PŘÍRODNÍ PEDIG, ŠÉNY, PÁSKY / balení 450 g',
  :description => 
    %{<p>
        <em>Velice jemný pedig.</em>Vhodný na pletení zvonečků a jiných miniatur.
Kombinujete malé a velké zvonečky? Mohlo by vás zajímat zvýhodněné balení
"zvonečkového" pedigu: malé zvonečkové balení - 1 + 1,5 mmvelké zvonečkové
balení - 1 + 1,5 + 2 mm Pletení zvonečků vám ulehčí naše dřevěné formy.
Vybírat můžete ze čtyř velikostí... S výška 3,3 cm dolní průměr 3 cmM výška
 5,5 cm dolní průměr 4,5 cm L výška 7
      </p>},
  :image_url => '/assets/pedig1.gif',
  :price => 502)
