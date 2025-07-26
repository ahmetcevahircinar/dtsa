function [shortestPathLength,shortestPath] = enen(data)

data(data==0) = realmax;
N_cities = size(data,1);

shortestPathLength = realmax;

for i = 1:N_cities
    
    startCity = i;

    path = startCity;
    
    distanceTraveled = 0;
    distancesNew = data;
    
    currentCity = startCity; 
    
    for j = 1:N_cities-1
        
        [minDist,nextCity] = min(distancesNew(:,currentCity));
        if (length(nextCity) > 1)
            nextCity = nextCity(1);
        end
        
        path(end+1,1) = nextCity;
        distanceTraveled = distanceTraveled +...
                    data(currentCity,nextCity);
        
        distancesNew(currentCity,:) = realmax;        
        currentCity = nextCity;
        
    end
    
    path(end+1,1) = startCity;
    distanceTraveled = distanceTraveled +...
        data(currentCity,startCity);
    
    if (distanceTraveled < shortestPathLength)
        shortestPathLength = distanceTraveled;
        shortestPath = path; 
    end     
end
end