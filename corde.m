function [x,k] = corde(f,m,x0,toll,nmax)
    % Inizializzazione delle variabili
    k=0; % Contatore delle iterazioni
    err=toll+1; % Errore iniziale (messo a toll+1 per entrare nel ciclo while)
    x=x0; % Punto di partenza dell'iterazione

    % Ciclo principale dell'algoritmo delle corde
    while (k<nmax && err>toll)
        fx=feval(f,x); % Calcola il valore della funzione in x
        tolf=toll*abs(m); % Calcola la tolleranza sulla funzione

        % Se il valore assoluto di f(x) è minore o uguale alla tolleranza,
        % allora abbiamo trovato un'approssimazione accettabile dello zero della funzione e si esce dal ciclo
        if abs(fx)<=tolf
           break
        end

        % Altrimenti, si calcola il nuovo punto x1 con il metodo delle corde: x1 = x - f(x)/m
        % dove m è una stima del valore della derivata di f in x
        x1=x-fx/m;

        % Si calcola l'errore come la differenza in valore assoluto tra x1 e x
        err=abs(x1-x);

        % Si aggiorna x con il nuovo punto x1 e si incrementa il contatore delle iterazioni
        x=x1;
        k=k+1;
    end
end
