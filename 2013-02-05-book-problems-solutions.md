# Prolog Self-Study

## Day 1: Self-Study

### Find
Some free Prolog tutorials

* [Prolog tutorial by J.R. Fisher](http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/contents.html)
* [Prolog tutorial by A. Aaby](http://www.lix.polytechnique.fr/~liberti/public/computing/prog/prolog/prolog-tutorial.html)
* [A short prolog tutorial](http://www.doc.gold.ac.uk/~mas02gw/prolog_tutorial/prologpages/)
* [Learn Prolog Now!](http://www.learnprolognow.org/lpnpage.php?pageid=online)
* Many more (just google it)

A support forum

* [Old Nabble - Gnu - Prolog forum](http://old.nabble.com/Gnu---Prolog-f1818.html)
* [Stack Overflow - Prolog tag](http://stackoverflow.com/tags/prolog/info)

One online reference for the Prolog version you're using
[GNU-Prolog Manual](http://stackoverflow.com/tags/prolog/info)

### Do

Make a simple knowledge base. Represent some of your favorite books and authors.

```prolog
wrote(charles_dickens, a_tale_of_two_cities).
wrote(j_r_r_tolkien, the_hobbit).
wrote(j_r_r_tolkien, the_lord_of_the_rings).
wrote(dan_brown, the_da_vinci_code).
wrote(dan_brown, angels_and_demons).
wrote(e_b_white, charlottes_web).
wrote(j_k_rowling, harry_potter).

% Find all books in your knowledge base written by one author.
wrote(dan_brown, What).

% Make a knowledge base representing musicians and instruments.
% Also represent musicians and their genre of music.
plays(bob_marley, guitar).
plays(kurt_cobain, guitar).
plays(eddie_van_halen, guitar).
plays(stevie_wonder, piano).
plays(ludwig_van_beethoven, piano).
plays(frederic_chopin, piano).
plays(franz_liszt, piano).
plays(ringo_starr, drums).
plays(travis_barker, drums).
plays(kesha, autotune).
genre(bob_marley, reggae).
genre(kurt_cobain, rock).
genre(eddie_van_halen, rock).
genre(stevie_wonder, soul).
genre(ludwig_van_beethoven, classical).
genre(frederic_chopin, classical).
genre(franz_liszt, classical).
genre(ringo_starr, rock).
genre(travis_barker, rock).
genre(kesha, pop).

% Find all musicians who play the guitar.
plays(Who, guitar).

% Bonus: Find all genres where guitar is played.
plays(X, guitar), genre(X, Genre).
```
