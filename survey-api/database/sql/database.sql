create table employee (
  id serial primary key not null,
  full_name varchar(255) not null,
  gender boolean not null,
  active boolean not null DEFAULT False,
  position varchar(255) not null,
  is_admin boolean not null DEFAULT False,
  created_at timestamptz not null DEFAULT NOW(),
  updated_at timestamptz not null DEFAULT NOW()
);

create table account (
  id serial primary key not null,
  username varchar(50) not null,
  password varchar(50) not null, -- will add encrypted password here
  full_name varchar(255) not null,
  created_at timestamptz not null DEFAULT NOW(),
  updated_at timestamptz not null DEFAULT NOW()
);

create type review_status as ENUM ('done', 'pending');

create table reviewer_reviewee (
  id serial primary key not null,
  reviewer_id integer not null, -- will add foreign key to employee
  reviewee_id integer not null, -- will add foreign key to employee
  status review_status not null DEFAULT 'pending',
  created_at timestamptz not null DEFAULT NOW(),
  updated_at timestamptz not null DEFAULT NOW()
);

create table performance (
  id serial primary key not null,
  content text not null,
  rating integer not null,
  employee_id integer not null, -- will add foreign key to employee
  created_at timestamptz not null DEFAULT NOW(),
  updated_at timestamptz not null DEFAULT NOW()
);

