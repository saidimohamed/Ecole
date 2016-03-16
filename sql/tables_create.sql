create table code_classe(code varchar(20) not null, nom varchar(20) not null, primary key (code));
create table annee_scolaire(code varchar(20) not null, designation varchar(20) not null, primary key (code));
create table matiere(code varchar(20) not null, designation varchar(20) not null, primary key(code));
create table eleve(nom varchar(20) not null, prenom varchar(20) not null, matricule varchar(40) not null, adresse varchar(100) not null, date_naissance date not null, primary key (matricule));
create table moyenne(matricule varchar(40) not null, annee_scolaire varchar(20) not null, trimestre int not null, moyenne double not null, primary key (matricule, annee_scolaire, trimestre));
create table note(code_matiere varchar(20) not null, note double not null, matricule varchar(40) not null, annee_scolaire varchar(20) not null, trimestre int not null, primary key (code_matiere, matricule, annee_scolaire, trimestre));
create table presence (matricule varchar(40) not null, valeur int not null, date date not null, seance int not null, primary key (matricule,date,seance));
create table classe(matricule varchar(40) not null, annee_scolaire varchar(20) not null, code_classe varchar(20) not null, primary key (matricule, annee_scolaire, code_classe));

alter table classe add constraint fk_classe_matricule foreign key (matricule) references eleve(matricule);
alter table classe add constraint fk_classe_annee foreign key (annee_scolaire) references annee_scolaire(code);
alter table classe add constraint fk_classe_code_classe foreign key (code_classe) references code_classe(code);

alter table note add constraint fk_note_matiere foreign key (code_matiere) references matiere(code);
alter table note add constraint fk_note_matricule foreign key (matricule) references eleve(matricule);
alter table note add constraint fk_note_annee foreign key (annee_scolaire) references annee_scolaire(code);

alter table presence add constraint fk_precense_matricule foreign key (matricule) references eleve(matricule);
