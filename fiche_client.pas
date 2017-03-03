PROGRAM fiche_client;

uses crt;

TYPE
	Tclient = record
		nom : string;
		prenom : string;
		adresse : string;
		cp : string;
		ville : string;
End;

procedure nom(var ficher_client : Textfile ;var client :Tclient );

	Begin
		writeln('entrer le nom du client');
		readln(client.nom);
		writeln(ficher_client,client.nom);
	End;

procedure prenom(var ficher_client : Textfile ;var client :Tclient );

	Begin
		writeln('entrer le prenom du client');
		readln(client.prenom);
		writeln(ficher_client,client.prenom);
	End;

procedure adresse(var ficher_client : Textfile ;var client :Tclient );

	Begin
		writeln('entrer l''adresse du client');
		readln(client.adresse);
		writeln(ficher_client,client.adresse);
	End;

procedure cp(var ficher_client : Textfile ;var client :Tclient );

	Begin
		writeln('entrer le code postal du client');
		readln(client.cp);
		client.nom:=copy(client.cp,1,5);
		writeln(ficher_client,client.cp);
		close(ficher_client);
	End;

procedure ville(var ficher_client : Textfile ;var client :Tclient );

	Begin
		writeln('entrer la ville du client');
		readln(client.ville);
		writeln(ficher_client,client.ville);
	End;

procedure nouvelle_fiche(var ficher_client : Textfile ;var client :Tclient ;compteur :integer);

	Begin
		{$I-}   { disable i/o error checking }
		append(ficher_client);
		{$I+}   { enable again i/o error checking - important }
		If (IOResult <> 0) Then
			rewrite(ficher_client);
		writeln(ficher_client,'');
		write (ficher_client,'Client');
		writeln (ficher_client,compteur);
		ville (ficher_client ,client);
		nom (ficher_client ,client);
		prenom (ficher_client ,client);
		adresse (ficher_client ,client);
		cp (ficher_client ,client);

	End;

procedure lire_les_fiche(var ficher_client : Textfile ; var client :Tclient );

	Var
		s :string;
	BEGIN
        {$I-}   { disable i/o error checking }
		reset(ficher_client);
		{$I+}   { enable again i/o error checking - important }
		If not (IOResult <> 0) Then
			Begin
				while not Eof(ficher_client) do
		           	begin
		            	ReadLn(ficher_client,s);
		            	WriteLn(s);
		            end;
		        writeln;
		        close(ficher_client);
		    End
		ELSE
	    	writeln('erreur il n''y as aucune fiche client');
    END;

Var
	ficher_client : Textfile ;
	choix : string;
	client : Tclient;
	compteur : integer;

Begin
	compteur:=0;
	Assign(ficher_client,'fiche_client.txt');
	REPEAT
		REPEAT
			clrscr;
			writeln('1 : Lire les fiche client');
			writeln('2 : Ecrire une nouvelle fiche');
			writeln('0 : quitter le programme');
			choix:=ReadKey;
		UNTIL (choix='1') OR (choix='2') OR (choix='0');
			IF (choix='1') THEN
				lire_les_fiche(ficher_client ,client);
			IF (choix='2') THEN
				Begin
					nouvelle_fiche(ficher_client ,client,compteur);
					compteur:=compteur+1;
				End;
		write('appuyer sur entrer pour continuer');
		readln;
	UNTIL (choix='0');
	writeln('merci d''avoir utiliser ce programme !');
	readln;
END.

