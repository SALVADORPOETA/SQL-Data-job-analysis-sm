FROM postgres:18

# Copiar script SQL y CSVs
COPY ./project_sql/init_tables.sql /docker-entrypoint-initdb.d/init_tables.sql
COPY ./csv_files /csv_files

EXPOSE 5432
