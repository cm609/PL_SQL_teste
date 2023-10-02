/*----========================embaralha nome =================================-------------
SELECT * FROM recadastro.recadtb_pessoa;

SELECT
    nome_pessoa,
    CASE nvl (FLAG_SEXO, '')
        WHEN 'F' THEN
            'MARIA ' || iden_pessoa
        ELSE
            'JOSE ' || iden_pessoa
    END nome_n,
    data_nascimento,
    to_date(data_nascimento + trunc(dbms_random.value(777, 1777))) AS data_nascimento_n,
    flag_sexo,
    flag_sexo flag_sexo_n, --CASE FLAG_SEXO WHEN 'F' THEN 'M' ELSE 'F' END FLAG_SEXO_N,
    desc_email,
    CASE nvl (FLAG_SEXO, '')
        WHEN 'F' THEN
            'maria'
            || iden_pessoa
            || '@email.com'
        ELSE
            'jose'
            || iden_pessoa
            || '@email.com'
    END desc_email_n,
    'MAE MARIA ' || iden_pessoa nome_mae_n,
    'PAI JOSE ' || iden_pessoa nome_pai_n,
    endr_logradouro,
    'DA RESIDENCIA ' || iden_pessoa endr_logradouro_n,
    numr_cep,
    '7800000' numr_cep_n,
    numr_rg,
    lpad(8,'0') NUMR_RG_N,
NOME_CONJUGE,
CASE NVL(NUMR_TELEFONE_CELULAR,'')
WHEN '0' THEN NULL
ELSE CASE FLAG_SEXO WHEN 'F' THEN 'ESPOSO MARIA ' || IDEN_PESSOA ELSE 'ESPOSA JOSE ' || IDEN_PESSOA END
END NOME_CONJUGE_N,

NUMR_TELEFONE_CELULAR,
CASE NVL(NUMR_TELEFONE_CELULAR,'')
WHEN '0' THEN NULL
ELSE '659' || RPAD(4,'0') || LPAD(4,'0')
END NUMR_TELEFONE_CELULAR_N,

NUMR_TELEFONE_COMERCIAL,
CASE NVL (NUMR_TELEFONE_COMERCIAL,'')
WHEN '0' THEN NULL
ELSE '659' || RPAD(4,'0') || LPAD(4,'0')
END NUMR_TELEFONE_COMERCIAL_N,

NUMR_TELEFONE_PESSOAL,
CASE NVL (NUMR_TELEFONE_PESSOAL,'')
WHEN '0' THEN NULL
ELSE '659' || rpad (4,'0' ) | | lpad (4,'0' )

END numr_telefone_pessoal_n
FROM
    recadastro.recadtb_pessoa
WHERE
    1 = 1

order by data_nascimento ; */
-------FAZER UM UPDATE DOS NOMES NÃO CRIPTOGRAFADOS (pRegistro   IN OUT recadastro.recadtb_pessoa%ROWTYPE)
--CREATE OR REPLACE PROCEDURE recadpr_embaralha_dados_pesso IS

DECLARE

CURSOR cpesquisa_nome IS
    SELECT
    IDEN_PESSOA,
    nome_pessoa,
    CASE nvl(flag_sexo, 'F')
        WHEN 'F' THEN
            'MARIA ' || iden_pessoa
        ELSE
            'JOSE ' || iden_pessoa
    END nome_n,
    data_nascimento,
    to_date(data_nascimento + trunc(dbms_random.value(777, 1777))) AS data_nascimento_n,
    flag_sexo,
    flag_sexo flag_sexo_n, --CASE FLAG_SEXO WHEN 'F' THEN 'M' ELSE 'F' END FLAG_SEXO_N,
    desc_email,
    CASE nvl(flag_sexo, 'F')
        WHEN 'F' THEN
            'maria'
            || iden_pessoa
            || '@email.com'
        ELSE
            'jose'
            || iden_pessoa
            || '@email.com'
    END desc_email_n,
    'MAE MARIA ' || iden_pessoa nome_mae_n,
    'PAI JOSE ' || iden_pessoa nome_pai_n,
    endr_logradouro,
    'DA RESIDENCIA ' || iden_pessoa endr_logradouro_n,
    numr_cep,
    '7800000' numr_cep_n,
    numr_rg,
    lpad(trunc(dbms_random.value(0, 99999999)), 8, '0') numr_rg_n,
    nome_conjuge,
    CASE nvl(nome_conjuge, '0')
        WHEN '0' THEN
            NULL
        ELSE
            CASE flag_sexo
                WHEN 'F' THEN
                    'ESPOSO MARIA ' || iden_pessoa
                ELSE
                    'ESPOSA JOSE ' || iden_pessoa
            END
    END nome_conjuge_n,
    numr_telefone_celular,
    CASE nvl(numr_telefone_celular, '0')
        WHEN '0' THEN
            NULL
        ELSE
            '659'
            || rpad(trunc(dbms_random.value(0, 9999)), 4, '0')
            || lpad(trunc(dbms_random.value(0, 9999)), 4, '0')
    END numr_telefone_celular_n,
    numr_telefone_comercial,
    CASE nvl(numr_telefone_comercial, '0')
        WHEN '0' THEN
            NULL
        ELSE
            '659'
            || rpad(trunc(dbms_random.value(0, 9999)), 4, '0')
            || lpad(trunc(dbms_random.value(0, 9999)), 4, '0')
    END numr_telefone_comercial_n,
    numr_telefone_pessoal,
    CASE nvl(numr_telefone_pessoal, '0')
        WHEN '0' THEN
            NULL
        ELSE
             '659'
            || rpad(trunc(dbms_random.value(0, 9999)), 4, '0')
            || lpad(trunc(dbms_random.value(0, 9999)), 4, '0')
    END numr_telefone_pessoal_n
FROM
    RECADASTRO.RECADTB_PESSOA
    --geral.gertb_pessoa
WHERE
    --RECADASTRO.RECADTB_PESSOA.IDEN_PESSOA IN (629722,629720);
    1 = 1
    AND length(nome_pessoa) NOT IN (
        12,
        13
    )
    AND ( nome_pessoa NOT LIKE 'JOSE%'
          AND nome_pessoa NOT LIKE 'MARIA%' );                                                                           

begin 
/*FOR c_pesquisa IN cpesquisa_nome LOOP UPDATE recadastro.recadtb_pessoa set
WHERE
    iden_pessoa = 1
            END LOOP;*/

    FOR c IN cpesquisa_nome LOOP
    
        BEGIN
    
            DBMS_OUTPUT.PUT_LINE('IDEN_PESSOA: ' || C.IDEN_PESSOA);
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE('nome_pessoa: ' || C.nome_pessoa);
            DBMS_OUTPUT.PUT_LINE('nome_n: ' || C.nome_n);
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE('desc_email: ' || C.desc_email);
            DBMS_OUTPUT.PUT_LINE('desc_email_n: ' || C.desc_email_n);
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
            DBMS_OUTPUT.PUT_LINE(' ');

            
            UPDATE   RECADASTRO.RECADTB_PESSOA P
            SET P.nome_pessoa = C.nome_n,
                P.desc_email = C.desc_email_n
            WHERE P.IDEN_PESSOA = C.IDEN_PESSOA;
            
            --COMMIT;
            
        
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('IDEN_PESSOA: ' || SQLERRM);
        END;

    END LOOP;


    /*Open cpesquisa_nome;--ABRE O CURSOR 
    FETCH cpesquisa_nome INTO pRegistro;--PASSA OS VALORES DA TABELA PARA DENTRO DA VARIAVEL REGISTRO 
    
    Close cpesquisa_nome;-- FINA
    
    
    
    
    
    EXCEPTION
    WHEN OTHERS THEN
        rollback;*/
end;
--uma tabela para registrar um indice de controle coluna-->nome, 



 
 



/*SELECT
    nome_pessoa,
    CASE NVL(FLAG_SEXO, '') --substitui os valores nulos do flag
        WHEN 'F' THEN --caso sexo seja feminino "F"
            'MARIA ' || iden_pessoa_geral --iden fica com MARIA 
        ELSE
            'JOSE ' || iden_pessoa_geral --senão iden fica como JOSE
    END nome_n,--nome do campo case 
    
    
    data_nascimento
    ,
    to_date(data_nascimento + trunc(dbms_random.value(777, 1777))) AS data_nascimento_n,
    flag_sexo,
    flag_sexo flag_sexo_n, --CASE FLAG_SEXO WHEN 'F' THEN 'M' ELSE 'F' END FLAG_SEXO_N,
    desc_email,
    --case para diferenciar os emails masculino e feminino
    CASE NVL(FLAG_SEXO, '')
        WHEN 'F' THEN --caso "F" edenta maria e o padrão de email
            'maria'
            || iden_pessoa_geral
            || '@email.com'
        ELSE
        --senão edenta jose ao email
            'jose'
            || iden_pessoa_geral
            || '@email.com'
    END desc_email_n,
    'MAE MARIA ' || iden_pessoa_geral nome_mae_n,
    'PAI JOSE ' || iden_pessoa_geral nome_pai_n,
    endr_logradouro,
    'DA RESIDENCIA ' || iden_pessoa endr_logradouro_n,
    numr_cep,
    '7800000' numr_cep_n,
    numr_rg,LPAD(8,'0') NUMR_RG_N,
NOME_CONJUGE,
CASE NVL
WHEN '0' THEN NULL
ELSE CASE FLAG_SEXO WHEN 'F' THEN 'ESPOSO MARIA ' || IDEN_PESSOA_GERAL ELSE 'ESPOSA JOSE ' || IDEN_PESSOA_GERAL END
END NOME_CONJUGE_N,

NUMR_TELEFONE_CELULAR,
CASE NVL
WHEN '0' THEN NULL
ELSE '659' || RPAD(4,'0' )|| LPAD(4,'0')
END NUMR_TELEFONE_CELULAR_N,

--NUMR_TELEFONE_COMERCIAL,
---CASE NVL
--WHEN '0' THEN NULL
--ELSE '659' || RPAD),4,'0') || LPAD),4,'0')
--END NUMR_TELEFONE_COMERCIAL_N,

--NUMR_TELEFONE_PESSOAL,
--CASE NVL
--WHEN '0' THEN NULL
--ELSE '659' || rpad ),
--4,
--'0' ) | | lpad ),
--4,
--'0' )
--END numr_telefone_pessoal_n
FROM
    recadastro.recadtb_pessoa
WHERE
    1 = 1;*/
    
    
