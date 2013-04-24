egyptian_fraction_delphi
========================

Small code sample in Delphi to demonstrate how to compute egyptian fractions.

Description text currently only in french.

Fractions Egyptiennes
=====================


Les Egyptiens (2.000 AC) utilisaient une technique particulière pour calculer le
quotient de 2 nombres, par exemple 253 à diviser par 27. Ils établissaient
certains multiples du dénominateur, en multipliant le nombre obtenu par 2,
jusqu'à l'obtention d'un nombre supérieur au numérateur :


```delphi
   27   1  
   54   2  
  108   4  
  216   8  
  512  16  
```

```delphi
    253          
   -216 (=8*27)  
   ----          
     37          
    -27 (=1*27)  
   ----          
     10          
```

On peut conclure que 

```delphi
  253 = 10 + (1 * 27) + (8 * 27)
```
ou que 
```delphi
  253 / 27 = 9 + 10 / 27
```
et 10 / 27 éait exprimé sous la forme d'une somme de fractions à numérateur
unitaire (seule exception: 2 / 3 était aussi accepté) et à dénominateur
différents. Donc: 
```delphi
  253 / 27 = 9 + 1 / 3 + 1 / 27
```
 
Intérét des fractions égyptiennes de nos jours ?  
================================================

Les fractions égyptiennes rendent les comparaisons de fractions plus simples.
Exemple: 3/4 est-il plus grand que 4/5 ? Pour le savoir, nous passons à la
représentation décimale : 

```delphi
  3 / 4 = 0,75
  4 / 5 = 0,8
  0,75 < 0,8
```

ou réduisons au même dénominateur : 

```delphi
  3 / 4 = 15 / 20
  4 / 5 = 16 / 20
  15 / 20 < 16 / 20
```

En utilisant les fractions éyptiennes, la réponse est immédiate: 

```delphi
  3/4 = 1/2 + 1/4
  4/5 = 1/2 + 1/4 + 1/20
```

Autre avantage: imaginons que vous deviez partager 4 tartes entre 5 personnes.
Il est évident que nous distribuerions des morceaux de tailles différentes à
chacun mais dont la valeur totale serait chaque fois de 4/5ème de tarte.
Ceci est juste d'un pont de vue mathématique mais risque sans doute de ne
pas convaincre un enfant qu'il n'a pas reçu moins que son copain. Avec les
fractions égyptiennes, chacun recevrait une moitié de tarte; laissant ainsi
intacte une tarte et demie. De ce qui reste, on couperait des quarts qui
seraient distribués à tous et finalement le quart restant serait divisé
en 5 parts égales.
 
Code
====

```delphi
  var
    Plus: integer;
    N, D, a: integer;
    Tmp: integer;
  begin
    LabelResult.Caption := '';
    N := StrToInt(Edit1.Text);
    D := StrToInt(Edit2.Text);
    Plus := 0;
    if D = 0 then begin LabelResult.Caption := 'Impossible : division par 0'; Exit; end
    else LabelResult.Caption := 'Résultat de ' + Edit1.Text + '/' + Edit2.Text + ' : ';
    while N > D do
      begin
        Plus := Plus + 1;
        N := N - D;
      end;
    if Plus <> 0 then LabelResult.Caption := LabelResult.Caption + IntToStr(Plus);
    a := 2;
    while not ((N = 0) or (a > 200)) do
      begin
        Tmp := a * N - D;
        while not (Tmp >= 0) do
          begin
            INC(a);
            Tmp := a * N - D;
          end;
        if Plus = 0 then LabelResult.Caption := LabelResult.Caption + '1/' + IntToStr(a)
        else LabelResult.Caption := LabelResult.Caption + ' + 1/' + IntToStr(a);
        Inc(Plus);
        N := Tmp;
        D := a * D;
        INC(a); {évite d'avoir 2 fois le même dénominateur}
      end;
  end;
```

--------------------------------------------------------------------------------

Dark Skull Software <br/>
http://www.darkskull.net
