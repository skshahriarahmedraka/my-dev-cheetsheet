## sql
    Table accounts as A {
    id bigserial [pk]
    owner varchar [not null] 
    balance bigint [not null]
    created_at timestampz [not null, default: `now()` ]
    
    Indexes {
        owner 
    }
    }

    Table enties {
    id bigserial [pk]
    account_id bigint [ref: > A.id]
    amount bigint [not null , note:'can be positive or negative']
    created_at timestampz [not null, default:`now()`]
    
    Indexes {
        account_id 
    }
    }

    Table transfers {
    id bigserial [pk]
    from_account_id bigint [ref: > A.id]
    to_account_id bigint [ref: > A.id]
    amount bigint [not null , note: 'must be positive' ]
    created_at timestamtz [not null , default:`now()`]
    
    Indexes {
        from_account_id 
        to_account_id 
        (from_account_id,to_account_id)
    }  
    
    }


