#                       FUNCIÓ COMPLETE
#
# Aquesta funció llegeix els arxius de dades indicats d'un cert directori
# i informa sobre el nombre total d'observacions completes, sense cap NA.
# Retorna un objecte "dataframe" amb les columnes ID del monitor i nombre
# d'observacions completes.
#
#       Arguments:
#               - directory: string que indica el path on es troben els
#                       arxius a llegir a partir del directori de treball.
#               - id: vector d'enters amb els monitors a analitzar.


complete <- function(directory, id=1:332) {
        
        files <- list.files(directory, full.names=TRUE)  #Vector amb direccions de tots els arxius
        n_obs=vector("integer") #Inicialitzar vector on guardar el nombre casos complets per cada monitor
        
        for(i in id) {          
                good <- complete.cases(read.csv(files[i]))     #Llegeix l'arxiu del monitor "i" i retorna un vector logic amb els registres complets
                n_obs <- c(n_obs,sum(good))   #Suma el nombre de registres complets i n'emmagatzema el valor al vector inicialitzats
        }
        
        dataset<- data.frame("ID"=id,"nobs"=n_obs)   #Crea un dataframe amb el monitor i el nombre de casos complets.
        print(dataset)
}
                
                
                
        
