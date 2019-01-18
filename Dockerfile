FROM osrm/osrm-backend:v5.20.0

WORKDIR /opt/proute/data 

RUN wget http://download.geofabrik.de/africa/kenya-latest.osm.pbf  

RUN osrm-extract -p /opt/car.lua kenya-latest.osm.pbf 
RUN osrm-partition kenya-latest.osrm 
RUN osrm-customize kenya-latest.osrm

CMD osrm-routed --algorithm mld ./kenya-latest.osrm

