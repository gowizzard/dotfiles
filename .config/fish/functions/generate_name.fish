# Generates random container names in Docker style (e.g. "elegant_torvalds").
#
# Ported from the original Moby/Docker names generator:
#   https://github.com/moby/moby/blob/master/internal/namesgenerator/names-generator.go
#
# Fun fact: "boring_wozniak" is explicitly excluded because Steve Wozniak is not boring!
function generate_name
    set -l adjectives admiring adoring affectionate agitated amazing angry awesome beautiful blissful bold boring brave busy charming clever compassionate competent condescending confident cool cranky crazy dazzling determined distracted dreamy eager ecstatic elastic elated elegant eloquent epic exciting fervent festive flamboyant focused friendly frosty funny gallant gifted goofy gracious great happy hardcore heuristic hopeful hungry infallible inspiring intelligent interesting jolly jovial keen kind laughing loving lucid magical modest musing mystifying naughty nervous nice nifty nostalgic objective optimistic peaceful pedantic pensive practical priceless quirky quizzical recursing relaxed reverent romantic sad serene sharp silly sleepy stoic strange stupefied suspicious sweet tender thirsty trusting unruffled upbeat vibrant vigilant vigorous wizardly wonderful xenodochial youthful zealous zen

    set -l scientists albattani allen almeida agnesi archimedes ardinghelli aryabhata austin babbage banach banzai bardeen bartik bassi beaver bell benz bhabha bhaskara black blackburn blackwell bohr booth borg bose bouman boyd brahmagupta brattain brown buck burnell cannon carson cartwright carver cerf chandrasekhar chaplygin chatelet chatterjee chebyshev cohen chaum clarke colden cori cray curran curie darwin davinci dewdney dhawan diffie dijkstra dirac driscoll dubinsky easley edison einstein elbakyan elgamal elion ellis engelbart euclid euler faraday feistel fermat fermi feynman franklin gagarin galileo galois ganguly gates gauss germain goldberg goldstine goldwasser golick goodall gould greider grothendieck haibt hamilton haslett hawking hellman heyrovsky hodgkin hofstadter hoover hopper hugle hypatia ishizaka jackson jang jemison jennings jepsen johnson joliot jones kalam kapitsa kare keldysh keller kepler khayyam khorana kilby kirch knuth kowalevski lalande lamarr lamport leakey leavitt lederberg lehmann lewin lichterman liskov lovelace lumiere mahavira margulis matsumoto maxwell mayer mccarthy mcclintock mclaren mclean mcnulty mendel mendeleev meitner meninsky merkle mestorf mirzakhani montalcini moore morse moser murdock napier nash neumann newton nightingale nobel noether northcutt noyce panini pare pascal pasteur payne perlman pike poincare poitras proskuriakova ptolemy raman ramanujan ride ritchie rhodes robinson roentgen rosalind rubin saha sammet sanderson satoshi shamir shannon shaw shirley shockley shtern sinoussi snyder solomon spence stallman stonebraker sutherland swanson swartz swirles taussig tesla tharp thompson torvalds tu turing varahamihira vaughan villani visvesvaraya volhard wescoff wilbur wiles williams williamson wilson wing wozniak wright wu yalow yonath zhukovsky

    set -l adj $adjectives[(random 1 (count $adjectives))]
    set -l name $scientists[(random 1 (count $scientists))]

    # Steve Wozniak is not boring
    while test "$adj" = "boring" -a "$name" = "wozniak"
        set adj $adjectives[(random 1 (count $adjectives))]
        set name $scientists[(random 1 (count $scientists))]
    end

    echo {$adj}_{$name}
end
