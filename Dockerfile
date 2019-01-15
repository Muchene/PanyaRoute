FROM osrm/osrm-backend:v5.20.0

RUN mkdir -p /opt/proute/osrm_data && cd /opt/proute/osrm_data

RUN wget http://download.geofabrik.de/africa/kenya-latest.osm.pbf  

RUN osrm-extract -p /opt/car.lua kenya-latest.osm.pbf 
RUN osrm-partition kenya-latest.osrm 
RUN osrm-customize kenya-latest.osrm

CMD osrm-routed --algorithm mld /opt/proute/data/kenya-latest.osrm

