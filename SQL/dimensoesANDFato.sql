create table if not exists DIM_TEMPO(
    id serial primary key, 
    ano integer not null unique
    );

create table if not exists DIM_LOCAL(id serial primary key,
    ibge_code integer not null unique, 
    municipio varchar(100) not null, 
    uf varchar(30) not null,
	regiao varchar(50) not null
    );

create table if not exists DIM_BENEFICIO(
    id serial primary key, 
    descricao varchar(100) not null unique
    );

create table if not exists FATO(
    tempo_id integer, local_id integer, 
    beneficio_id integer, quantidade integer, 
    valor numeric, 
	valorAnual numeric, 
    populacaoAno integer,
	foreign key(tempo_id) references DIM_TEMPO(id),
	foreign key(local_id) references DIM_LOCAL(id),
	foreign key(beneficio_id) references DIM_BENEFICIO(id),
	primary key(tempo_id, local_id, beneficio_id)
);


