function [x, k] = secanti(f, x0, x1, toll, nmax)
  % x0, x1: i primi due punti di partenza per l'iterazione
  % f: la funzione di cui si vogliono trovare gli zeri
  % tolx: la tolleranza sull'errore assoluto tra due iterazioni successive
  % nmax: il numero massimo di iterazioni consentite

  k = 0; % Contatore per le iterazioni
  fx0 = feval(f,x0); % Calcolo del valore della funzione nel primo punto
  err = abs(x1-x0); % Errore iniziale basato sulla differenza tra i primi due punti

  % Iterazione principale del metodo delle secanti
  while (k < nmax && err > toll)
      fx1 = feval(f,x1); % Calcolo del valore della funzione nel secondo punto
      dfx1 = (fx1 - fx0) / (x1 - x0); % Calcolo dell'approssimazione della derivata nel secondo punto
      tolf = toll * abs(dfx1); % Calcolo della tolleranza sulla funzione

      % Se il valore assoluto di f(x1) è minore della tolleranza, esce dal ciclo
      if abs(fx1) <= tolf
         break
      end

      x2 = x1 - (fx1 / dfx1); % Calcolo del nuovo punto basato sul metodo delle secanti
      err = abs(x2 - x1); % Calcolo dell'errore assoluto

      % Aggiornamento dei punti e del valore della funzione
      x0 = x1; 
      x1 = x2;
      fx0 = fx1;

      k = k + 1; % Incremento del contatore delle iterazioni
  end

  x = x1; % Assegnazione del risultato
end
