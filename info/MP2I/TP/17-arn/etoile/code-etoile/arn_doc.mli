(* Documentation des arbres Rouge-Noirs *)

(** Arbres Rouge-Noirs.

    Ce module realise des arbres rouges-noirs (auto-equilibrant)
    fonctionnels. Les operations de Recherche, Insertion et 
    Suppression y sont garanties en temps logarithmique en 
    le nombre d'elements. 
    
    Toutes les fonctions presentes dans l'implementation sont
    documentees ici, y compris celles qui ne sont que des 
    auxiliaires a d'autres fonctions plus utiles.

    NB : Ceci n'est donc {b pas} un bon exemple d'interface : 
    absolument rien n'est cache, rien n'est abstrait. Pire encore,
    certains commentaires sont des explications pour aider a
    implementer alors que l'interface doit justement abstraire
    l'implementation. Mais cela me permet de garder le .ml
    relativement court, en deplacant la documentation en dehors.
    
    En resume, ceci n'est pas une bonne interface, mais c'est un bon enonce de TP/DM. *)


(** Type des couleurs des noeuds*)
type couleur =
    Rouge 
  | Noir 
  | Doublenoir (* etat temporaire de la suppression *)


(** Type des Arbres Rouges-Noirs d'etiquettes de type ['a] *)
type 'a arn =
    Nil of couleur (* Noires sauf temporairement durant la suppression *)
  | Node of couleur * 'a arn * 'a * 'a arn



(** {2 Initialisateurs} *)


(** [empty ()] est Arbre Rouge-Noir correct vide. *)
val empty : unit -> 'a arn



(** {2 Accesseurs} *)


(** {7 Proprietes d'un noeud} *)

(** Ces fonctions confondent noeud et arbre : 
    autrement dit, elles s'appliquent au noeud-racine. *)

(** [etiquette n] est l'étiquette du noeud [n] *)
val etiquette : 'a arn -> 'a

(** [gauche n] est l'enfant gauche du noeud [n] *)
val gauche : 'a arn -> 'a arn

(** [droite n] est l'enfant droite du noeud [n] *)
val droite : 'a arn -> 'a arn

(** [est_rouge n] vaut [true] ssi le noeud [n] est Rouge *)
val est_rouge : 'a arn -> bool

(** [est_noir n] vaut [true] ssi le noeud [n] est Noir. Sur un arbre vide, renvoie [true] *)
val est_noir : 'a arn -> bool

(** [est_doublenoir n] vaut [true] ssi le noeud [n] est Doublenoir. Fonctionne aussi sur les arbres vides. *)
val est_doublenoir : 'a arn -> bool

(** [est_feuille n] vaut [true] ssi le noeud [n] est une feuille *)
val est_feuille : 'a arn -> bool


(** {7 Proprietes d'un arbre} *)

(** [hauteur a] est la hauteur du (sous-) arbre 
    rouge-noir (presque) correct [a]. *)
val hauteur : 'a arn -> int

(** [hauteur_noire a] est la hauteur noire du (sous-) arbre 
    rouge-noir (presque) correct [a]. *)
val hauteur_noire : 'a arn -> int

(** [recherche x a] vaut [true] ssi [x] est présent dans le 
    (sous-) arbre rouge-noir (presque) correct [a]. *)
val recherche : 'a -> 'a arn -> bool

(** [minimum a] est l'étiquette minimale d'un (sous-) arbre
    rouge-noir (presque) correct [a]. *)
val minimum : 'a arn -> 'a

(** [maximum a] est l'étiquette maximale d'un (sous-) arbre
    rouge-noir (presque) correct [a]. *)
val maximum : 'a arn -> 'a



(** {2 Transformateurs} *)


(** {7 Recoloriages} *)

(** [devient_rouge n] recolorie [n] en Rouge. *)
val devient_rouge : 'a arn -> 'a arn

(** [devient_noir n] recolorie [n] en Noir. *)
val devient_noir : 'a arn -> 'a arn

(** [noircir n] recolorie [n] en lui ajoutant un 
    niveau de Noir. *)
val noircir : 'a arn -> 'a arn

(** [noircir n] recolorie [n] en lui enlevant un 
    niveau de Noir. *)
val eclaircir : 'a arn -> 'a arn


(** {7 Rotations} *)

(** Applique une rotation droite. *)
val rotation_droite : 'a arn -> 'a arn

(** Applique une rotation gauche. *)
val rotation_gauche : 'a arn -> 'a arn


(** {7 Insertion} *)

(** Pour les fonctions auxiliaires, on suppose qu'il existe 
    un seul enchainement de rouges dans l'arbre : [p] et 
    son fils [x]. Le pere [pp] de [p] est donc noir.
    On note [f] l'adelphe de [p]. Dans les fonctions 
    suivantes, [pp] est la racine de l'arbre : c'est a dire
    que l'enchainement de rouges est a profondeur 1 puis 2. *)

(** Resout le probleme d'enchainement rouge
    dans le Cas 1 : 
    si [p] et [f] sont rouges. 
    
    NB : ce cas recolorie la [pp] en Rouge et peut
    donc creer un probleme plus haut. *)
val ins_cas1 : 'a arn -> 'a arn

(** Resout le probleme d'enchainement rouge 
    dans le Cas 2a : si [f] est noir, 
    si [p] est fils gauche, et [x] fils gauche. *)
val ins_cas2a : 'a arn -> 'a arn

(** Resout le probleme d'enchainement rouge 
    dans le Cas 2b : si [f] est noir, 
    si [p] est fils gauche, et [x] fils droit.
    
    Resoud le probleme d'enchainement rouges. *)
val ins_cas2a : 'a arn -> 'a arn

(** Resout le probleme d'enchainement rouge 
    dans le Cas 3a : si [f] est noir, 
    si [p] est fils droit, et [x] fils droit. *)
val ins_cas3a : 'a arn -> 'a arn

(** Resout le probleme d'enchainement rouge 
    dans le Cas 3b : si [f] est noir, 
    si [p] est fils droit, et [x] fils gauche. *)
val ins_cas3b : 'a arn -> 'a arn

(** Transforme un sous-arbre rouge-noir 
    presque correct en rouge en un sous-arbre
    rouge-noir correct.

    Plus precisement, sous l'hypothese qu'il
    existe au plus un enchainement de deux rouges,
    et qu'ils sont situes a profondeur 1 puis 2, 
    [corrige_rouge] corrige ce probleme.
    
    NB : la racine peut devenir rouge, et donc creer un
    enchainement de rouges plus haut dans l'arbre. *)
val corrige_rouge : 'a arn -> 'a arn

(** Insere l'element dans un arbre.
    et corrige l'enchainement de rouges grace a [corrige_rouge].
  
    Invariant : apres un appel a insere_aux sur un sous-arbre
              rouge-noir presque correct en rouge, l'element 
              est insere
              ET il n'y a pas d'enchainement de rouge.
              Par contre la racine a pu devenir rouge. *)
val insere_aux : 'a -> 'a arn -> 'a arn

(** Insere un element dans un arbre 
    a l'aide de [insere_aux].
    Renvoie un arbre rouge-noir correct,
    i.e. garantit le maintien des proprietes d'ARN. *)
val insere : 'a -> 'a arn -> 'a arn


(** {7 Suppression} *)

(** Pour les fonctions auxiliaires, on suppose qu'il existe 
    un seul enchainement Doublenoir dans l'arbre : [x] . 
    On note. Le pere [p] le pere de [x] et [f] son frere.
    On note [f] le frere de [p]. On note [g] et [d]
    les eventuels enfants gauches et droits de [f].
    Dans les fonctions suivantes, [p] est la racine 
    de l'arbre : c'est a dire que le Doublenoir 
    est a profondeur 1. *)


(** Resout le probleme de DoubleNoir dans
  le cas ou [f = Nil] 
  
  Indication : dans quelles conditions ce cas peut-il arriver ? *)
val suppr_casfNil : 'a arn -> 'a arn
     
(** Resout le probleme de Doublenoir dans
    le cas1a : si [x] est fils gauche,
    si [f] est noir et si [g] et [d] sont noirs. 
    
    NB : ce cas noircit [p], et peut donc
    creer un Doublenoir plus haut. *)
val suppr_cas1a : 'a arn -> 'a arn

(** Resout le probleme de Doublenoir dans
    le cas1b : si [x] est fils gauche,
    si [f] est noir et si [d] est rouge. *)
val suppr_cas1b : 'a arn -> 'a arn

(** Resout le probleme de Doublenoir dans
    le cas1c : si [x] est fils gauche,
    si [f] est noir, si [g] est rouge
    et si [d] est noir. *)
val suppr_cas1c : 'a arn -> 'a arn

(** Resout le probleme de Doublenoir dans
    le cas1a : si [x] est fils droit,
    si [f] est noir et si [g] et [d] sont noirs. 
    
    NB : ce cas noircit [p], et peut donc
    creer un Doublenoir plus haut. *)
val suppr_cas3a : 'a arn -> 'a arn

(** Resout le probleme de Doublenoir dans
    le cas1b : si [x] est fils droit,
    si [f] est noir et si [g] est rouge. *)
val suppr_cas3b : 'a arn -> 'a arn

(** Resout le probleme de Doublenoir dans
    le cas3c : si [x] est fils droit,
    si [f] est noir, si [g] est noir
    et si [d] est rouge. *)
val suppr_cas3c : 'a arn -> 'a arn

(** Resout le probleme de Doublenoir dans
    le cas2 : si [x] est fils gauche et
    si [f] est rouge. *)
val suppr_cas2 : 'a arn -> 'a arn

(** Resout le probleme de Doublenoir dans
    le cas4 : si [x] est fils droit et
    si [f] est rouge. *)
val suppr_cas4 : 'a arn -> 'a arn

(** Corrige un noeud Doublenoir.
    Plus precisement, sous l'hypothese qu'il
    existe au plus un noeud Doublenoir,
    et qu'ils est situéà profondeur 1, 
    [corrige_rouge] soit corrige ce probleme,
    soit déplace le Doublenoir à profondeur 0. *)
val corrige_doublenoir : 'a arn -> 'a arn



(** Supprime un element d'un arbre
    et corrige/fait remonter le doublenoir eventuel
    à la racine grace a [corrige_doublenoir] .
    Invariant : après un appel à [supprime_aux],
    l'élément est supprime et s'il y a un Doublenoir
    c'est uniquement à la racine. *)
val supprime_aux : 'a -> 'a arn -> 'a arn

(** Supprime un element d'un arbre 
    l'aide de [supprime_aux].
    i.e. garantit le maintient des proprietes d'ARN.
    Renvoie un arbre rouge-noir noir *)
val supprime : 'a -> 'a arn -> 'a
