PGDMP     .    *    	            x            d2jk9l8821mdop     11.6 (Ubuntu 11.6-1.pgdg16.04+1)    12.0 1    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16533    d2jk9l8821mdop    DATABASE     �   CREATE DATABASE d2jk9l8821mdop WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE d2jk9l8821mdop;
                qzqvhzymsbdlxy    false            �           0    0    DATABASE d2jk9l8821mdop    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE d2jk9l8821mdop FROM PUBLIC;
                   qzqvhzymsbdlxy    false    4044            �           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO qzqvhzymsbdlxy;
                   postgres    false    677            �            1255    13604864    getname(integer)    FUNCTION       CREATE FUNCTION public.getname(val integer DEFAULT 5) RETURNS TABLE(product_name character varying, qty_per_unit character varying)
    LANGUAGE plpgsql
    AS $$
	 	BEGIN
			RETURN QUERY
				SELECT products.product_name,products.qty_per_unit
				from products LIMIT val;
			END;
	 $$;
 +   DROP FUNCTION public.getname(val integer);
       public          qzqvhzymsbdlxy    false            �            1259    13604445 	   customers    TABLE     �  CREATE TABLE public.customers (
    id integer NOT NULL,
    company character varying(500) DEFAULT NULL::character varying,
    last_name character varying(500) DEFAULT NULL::character varying,
    first_name character varying(500) DEFAULT NULL::character varying,
    email_address character varying(500) DEFAULT NULL::character varying,
    job_title character varying(500) DEFAULT NULL::character varying,
    business_phone character varying(25) DEFAULT NULL::character varying,
    home_phone character varying(25) DEFAULT NULL::character varying,
    mobile_phone character varying(25) DEFAULT NULL::character varying,
    fax_number character varying(25) DEFAULT NULL::character varying,
    address character varying(500) DEFAULT NULL::character varying,
    city character varying(500) DEFAULT NULL::character varying,
    state_province character varying(500) DEFAULT NULL::character varying,
    zip_postal_code character varying(15) DEFAULT NULL::character varying,
    country_region character varying(500) DEFAULT NULL::character varying,
    web_page character varying(500) DEFAULT NULL::character varying,
    notes character varying(500) DEFAULT NULL::character varying,
    attachments character varying(500) DEFAULT NULL::character varying
);
    DROP TABLE public.customers;
       public            qzqvhzymsbdlxy    false            �            1259    13604495    employee_privileges    TABLE     q   CREATE TABLE public.employee_privileges (
    employee_id integer NOT NULL,
    privilege_id integer NOT NULL
);
 '   DROP TABLE public.employee_privileges;
       public            qzqvhzymsbdlxy    false            �            1259    13604468 	   employees    TABLE     �  CREATE TABLE public.employees (
    id integer NOT NULL,
    company character varying(500) DEFAULT NULL::character varying,
    last_name character varying(500) DEFAULT NULL::character varying,
    first_name character varying(500) DEFAULT NULL::character varying,
    email_address character varying(500) DEFAULT NULL::character varying,
    job_title character varying(500) DEFAULT NULL::character varying,
    business_phone character varying(25) DEFAULT NULL::character varying,
    home_phone character varying(25) DEFAULT NULL::character varying,
    mobile_phone character varying(25) DEFAULT NULL::character varying,
    fax_number character varying(25) DEFAULT NULL::character varying,
    address character varying(500) DEFAULT NULL::character varying,
    city character varying(500) DEFAULT NULL::character varying,
    state_province character varying(500) DEFAULT NULL::character varying,
    zip_postal_code character varying(15) DEFAULT NULL::character varying,
    country_region character varying(500) DEFAULT NULL::character varying,
    web_page character varying(500) DEFAULT NULL::character varying,
    notes character varying(500) DEFAULT NULL::character varying,
    attachments character varying(500) DEFAULT NULL::character varying
);
    DROP TABLE public.employees;
       public            qzqvhzymsbdlxy    false            �            1259    13604498    inventory_transaction_types    TABLE     |   CREATE TABLE public.inventory_transaction_types (
    id integer NOT NULL,
    type_name character varying(500) NOT NULL
);
 /   DROP TABLE public.inventory_transaction_types;
       public            qzqvhzymsbdlxy    false            �            1259    13604607    inventory_transactions    TABLE     �  CREATE TABLE public.inventory_transactions (
    id integer NOT NULL,
    transaction_type integer NOT NULL,
    transaction_created_date timestamp without time zone,
    transaction_modified_date timestamp without time zone,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    purchase_order_id integer,
    customer_order_id integer,
    comments character varying(255) DEFAULT NULL::character varying
);
 *   DROP TABLE public.inventory_transactions;
       public            qzqvhzymsbdlxy    false            �            1259    13604611    invoices    TABLE     &  CREATE TABLE public.invoices (
    id integer NOT NULL,
    order_id integer,
    invoice_date timestamp without time zone,
    due_date timestamp without time zone,
    tax numeric(19,4) DEFAULT 0.0000,
    shipping numeric(19,4) DEFAULT 0.0000,
    amount_due numeric(19,4) DEFAULT 0.0000
);
    DROP TABLE public.invoices;
       public            qzqvhzymsbdlxy    false            �            1259    13604620    order_details    TABLE     �  CREATE TABLE public.order_details (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer,
    quantity numeric(18,4) DEFAULT 0.0000 NOT NULL,
    unit_price numeric(19,4) DEFAULT 0.0000,
    discount numeric(19,4) DEFAULT '0'::numeric NOT NULL,
    status_id integer,
    date_allocated timestamp without time zone,
    purchase_order_id integer,
    inventory_id integer
);
 !   DROP TABLE public.order_details;
       public            qzqvhzymsbdlxy    false            �            1259    13604617    order_details_status    TABLE     w   CREATE TABLE public.order_details_status (
    id integer NOT NULL,
    status_name character varying(500) NOT NULL
);
 (   DROP TABLE public.order_details_status;
       public            qzqvhzymsbdlxy    false            �            1259    13604534    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    employee_id integer,
    customer_id integer,
    order_date timestamp without time zone,
    shipped_date timestamp without time zone,
    shipper_id integer,
    ship_name character varying(500) DEFAULT NULL::character varying,
    ship_address character varying(500) DEFAULT NULL::character varying,
    ship_city character varying(500) DEFAULT NULL::character varying,
    ship_state_province character varying(500) DEFAULT NULL::character varying,
    ship_zip_postal_code character varying(500) DEFAULT NULL::character varying,
    ship_country_region character varying(500) DEFAULT NULL::character varying,
    shipping_fee numeric(19,4) DEFAULT 0.0000,
    taxes numeric(19,4) DEFAULT 0.0000,
    payment_type character varying(500) DEFAULT NULL::character varying,
    paid_date timestamp without time zone,
    notes character varying(500) DEFAULT NULL::character varying,
    tax_rate numeric(19,4) DEFAULT '0'::numeric,
    tax_status_id integer,
    status_id integer DEFAULT 0
);
    DROP TABLE public.orders;
       public            qzqvhzymsbdlxy    false            �            1259    13604529    orders_status    TABLE     p   CREATE TABLE public.orders_status (
    id integer NOT NULL,
    status_name character varying(500) NOT NULL
);
 !   DROP TABLE public.orders_status;
       public            qzqvhzymsbdlxy    false            �            1259    13604524    orders_tax_status    TABLE     x   CREATE TABLE public.orders_tax_status (
    id integer NOT NULL,
    tax_status_name character varying(500) NOT NULL
);
 %   DROP TABLE public.orders_tax_status;
       public            qzqvhzymsbdlxy    false            �            1259    13604491 
   privileges    TABLE     �   CREATE TABLE public.privileges (
    id integer NOT NULL,
    privilege_name character varying(500) DEFAULT NULL::character varying
);
    DROP TABLE public.privileges;
       public            qzqvhzymsbdlxy    false            �            1259    13604552    products    TABLE     6  CREATE TABLE public.products (
    supplier_ids character varying(500) DEFAULT NULL::character varying,
    id integer NOT NULL,
    product_code character varying(25) DEFAULT NULL::character varying,
    product_name character varying(500) DEFAULT NULL::character varying,
    description character varying(500) DEFAULT NULL::character varying,
    standard_cost numeric(19,4) DEFAULT 0.0000,
    list_price numeric(19,4) DEFAULT 0.0000 NOT NULL,
    reorder_level integer,
    target_level integer,
    quantity_per_unit character varying(500) DEFAULT NULL::character varying,
    discontinued numeric(19,4) DEFAULT '0'::numeric NOT NULL,
    minimum_reorder_quantity integer,
    category character varying(500) DEFAULT NULL::character varying,
    attachments character varying(500) DEFAULT NULL::character varying
);
    DROP TABLE public.products;
       public            qzqvhzymsbdlxy    false            �            1259    13604626    purchase_order_details    TABLE     a  CREATE TABLE public.purchase_order_details (
    id integer NOT NULL,
    purchase_order_id integer NOT NULL,
    product_id integer,
    quantity numeric(18,4) NOT NULL,
    unit_cost numeric(19,4) NOT NULL,
    date_received timestamp without time zone,
    posted_to_inventory numeric(19,4) DEFAULT '0'::numeric NOT NULL,
    inventory_id integer
);
 *   DROP TABLE public.purchase_order_details;
       public            qzqvhzymsbdlxy    false            �            1259    13604568    purchase_order_status    TABLE     �   CREATE TABLE public.purchase_order_status (
    id integer NOT NULL,
    status character varying(500) DEFAULT NULL::character varying
);
 )   DROP TABLE public.purchase_order_status;
       public            qzqvhzymsbdlxy    false            �            1259    13604595    purchase_orders    TABLE     �  CREATE TABLE public.purchase_orders (
    id integer NOT NULL,
    supplier_id integer,
    created_by integer,
    submitted_date timestamp without time zone,
    creation_date timestamp without time zone,
    status_id integer DEFAULT 0,
    expected_date timestamp without time zone,
    shipping_fee numeric(19,4) DEFAULT 0.0000 NOT NULL,
    taxes numeric(19,4) DEFAULT 0.0000 NOT NULL,
    payment_date timestamp without time zone,
    payment_amount numeric(19,4) DEFAULT 0.0000,
    payment_method character varying(500) DEFAULT NULL::character varying,
    notes character varying(500) DEFAULT NULL::character varying,
    approved_by integer,
    approved_date timestamp without time zone,
    submitted_by integer
);
 #   DROP TABLE public.purchase_orders;
       public            qzqvhzymsbdlxy    false            �            1259    13604630    sales_reports    TABLE     (  CREATE TABLE public.sales_reports (
    group_by character varying(500) NOT NULL,
    display character varying(500) DEFAULT NULL::character varying,
    title character varying(500) DEFAULT NULL::character varying,
    filter_row_source character varying(500) DEFAULT NULL::character varying
);
 !   DROP TABLE public.sales_reports;
       public            qzqvhzymsbdlxy    false            �            1259    13604501    shippers    TABLE     �  CREATE TABLE public.shippers (
    id integer NOT NULL,
    company character varying(500) DEFAULT NULL::character varying,
    last_name character varying(500) DEFAULT NULL::character varying,
    first_name character varying(500) DEFAULT NULL::character varying,
    email_address character varying(500) DEFAULT NULL::character varying,
    job_title character varying(500) DEFAULT NULL::character varying,
    business_phone character varying(25) DEFAULT NULL::character varying,
    home_phone character varying(25) DEFAULT NULL::character varying,
    mobile_phone character varying(25) DEFAULT NULL::character varying,
    fax_number character varying(25) DEFAULT NULL::character varying,
    address character varying(500) DEFAULT NULL::character varying,
    city character varying(500) DEFAULT NULL::character varying,
    state_province character varying(500) DEFAULT NULL::character varying,
    zip_postal_code character varying(15) DEFAULT NULL::character varying,
    country_region character varying(500) DEFAULT NULL::character varying,
    web_page character varying(500) DEFAULT NULL::character varying,
    notes character varying(500) DEFAULT NULL::character varying,
    attachments character varying(500) DEFAULT NULL::character varying
);
    DROP TABLE public.shippers;
       public            qzqvhzymsbdlxy    false            �            1259    13604639    strings    TABLE     �   CREATE TABLE public.strings (
    string_id integer NOT NULL,
    string_data character varying(255) DEFAULT NULL::character varying
);
    DROP TABLE public.strings;
       public            qzqvhzymsbdlxy    false            �            1259    13604572 	   suppliers    TABLE     �  CREATE TABLE public.suppliers (
    id integer NOT NULL,
    company character varying(500) DEFAULT NULL::character varying,
    last_name character varying(500) DEFAULT NULL::character varying,
    first_name character varying(500) DEFAULT NULL::character varying,
    email_address character varying(500) DEFAULT NULL::character varying,
    job_title character varying(500) DEFAULT NULL::character varying,
    business_phone character varying(25) DEFAULT NULL::character varying,
    home_phone character varying(25) DEFAULT NULL::character varying,
    mobile_phone character varying(25) DEFAULT NULL::character varying,
    fax_number character varying(25) DEFAULT NULL::character varying,
    address character varying(500) DEFAULT NULL::character varying,
    city character varying(500) DEFAULT NULL::character varying,
    state_province character varying(500) DEFAULT NULL::character varying,
    zip_postal_code character varying(15) DEFAULT NULL::character varying,
    country_region character varying(500) DEFAULT NULL::character varying,
    web_page character varying(500) DEFAULT NULL::character varying,
    notes character varying(500) DEFAULT NULL::character varying,
    attachments character varying(500) DEFAULT NULL::character varying
);
    DROP TABLE public.suppliers;
       public            qzqvhzymsbdlxy    false            �          0    13604445 	   customers 
   TABLE DATA           �   COPY public.customers (id, company, last_name, first_name, email_address, job_title, business_phone, home_phone, mobile_phone, fax_number, address, city, state_province, zip_postal_code, country_region, web_page, notes, attachments) FROM stdin;
    public          qzqvhzymsbdlxy    false    196   �W       �          0    13604495    employee_privileges 
   TABLE DATA           H   COPY public.employee_privileges (employee_id, privilege_id) FROM stdin;
    public          qzqvhzymsbdlxy    false    199   z[       �          0    13604468 	   employees 
   TABLE DATA           �   COPY public.employees (id, company, last_name, first_name, email_address, job_title, business_phone, home_phone, mobile_phone, fax_number, address, city, state_province, zip_postal_code, country_region, web_page, notes, attachments) FROM stdin;
    public          qzqvhzymsbdlxy    false    197   �[       �          0    13604498    inventory_transaction_types 
   TABLE DATA           D   COPY public.inventory_transaction_types (id, type_name) FROM stdin;
    public          qzqvhzymsbdlxy    false    200   �]       �          0    13604607    inventory_transactions 
   TABLE DATA           �   COPY public.inventory_transactions (id, transaction_type, transaction_created_date, transaction_modified_date, product_id, quantity, purchase_order_id, customer_order_id, comments) FROM stdin;
    public          qzqvhzymsbdlxy    false    209   *^       �          0    13604611    invoices 
   TABLE DATA           c   COPY public.invoices (id, order_id, invoice_date, due_date, tax, shipping, amount_due) FROM stdin;
    public          qzqvhzymsbdlxy    false    210   /c       �          0    13604620    order_details 
   TABLE DATA           �   COPY public.order_details (id, order_id, product_id, quantity, unit_price, discount, status_id, date_allocated, purchase_order_id, inventory_id) FROM stdin;
    public          qzqvhzymsbdlxy    false    212   �d       �          0    13604617    order_details_status 
   TABLE DATA           ?   COPY public.order_details_status (id, status_name) FROM stdin;
    public          qzqvhzymsbdlxy    false    211   5g       �          0    13604534    orders 
   TABLE DATA           !  COPY public.orders (id, employee_id, customer_id, order_date, shipped_date, shipper_id, ship_name, ship_address, ship_city, ship_state_province, ship_zip_postal_code, ship_country_region, shipping_fee, taxes, payment_type, paid_date, notes, tax_rate, tax_status_id, status_id) FROM stdin;
    public          qzqvhzymsbdlxy    false    204   �g       �          0    13604529    orders_status 
   TABLE DATA           8   COPY public.orders_status (id, status_name) FROM stdin;
    public          qzqvhzymsbdlxy    false    203   #l       �          0    13604524    orders_tax_status 
   TABLE DATA           @   COPY public.orders_tax_status (id, tax_status_name) FROM stdin;
    public          qzqvhzymsbdlxy    false    202   al       �          0    13604491 
   privileges 
   TABLE DATA           8   COPY public.privileges (id, privilege_name) FROM stdin;
    public          qzqvhzymsbdlxy    false    198   �l       �          0    13604552    products 
   TABLE DATA           �   COPY public.products (supplier_ids, id, product_code, product_name, description, standard_cost, list_price, reorder_level, target_level, quantity_per_unit, discontinued, minimum_reorder_quantity, category, attachments) FROM stdin;
    public          qzqvhzymsbdlxy    false    205   �l       �          0    13604626    purchase_order_details 
   TABLE DATA           �   COPY public.purchase_order_details (id, purchase_order_id, product_id, quantity, unit_cost, date_received, posted_to_inventory, inventory_id) FROM stdin;
    public          qzqvhzymsbdlxy    false    213   �r       �          0    13604568    purchase_order_status 
   TABLE DATA           ;   COPY public.purchase_order_status (id, status) FROM stdin;
    public          qzqvhzymsbdlxy    false    206   �t       �          0    13604595    purchase_orders 
   TABLE DATA           �   COPY public.purchase_orders (id, supplier_id, created_by, submitted_date, creation_date, status_id, expected_date, shipping_fee, taxes, payment_date, payment_amount, payment_method, notes, approved_by, approved_date, submitted_by) FROM stdin;
    public          qzqvhzymsbdlxy    false    208   =u       �          0    13604630    sales_reports 
   TABLE DATA           T   COPY public.sales_reports (group_by, display, title, filter_row_source) FROM stdin;
    public          qzqvhzymsbdlxy    false    214   �v       �          0    13604501    shippers 
   TABLE DATA           �   COPY public.shippers (id, company, last_name, first_name, email_address, job_title, business_phone, home_phone, mobile_phone, fax_number, address, city, state_province, zip_postal_code, country_region, web_page, notes, attachments) FROM stdin;
    public          qzqvhzymsbdlxy    false    201   �w       �          0    13604639    strings 
   TABLE DATA           9   COPY public.strings (string_id, string_data) FROM stdin;
    public          qzqvhzymsbdlxy    false    215   /x       �          0    13604572 	   suppliers 
   TABLE DATA           �   COPY public.suppliers (id, company, last_name, first_name, email_address, job_title, business_phone, home_phone, mobile_phone, fax_number, address, city, state_province, zip_postal_code, country_region, web_page, notes, attachments) FROM stdin;
    public          qzqvhzymsbdlxy    false    207   }       9           2606    13604533     orders_status orders_status_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.orders_status
    ADD CONSTRAINT orders_status_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.orders_status DROP CONSTRAINT orders_status_pkey;
       public            qzqvhzymsbdlxy    false    203            7           2606    13604528 (   orders_tax_status orders_tax_status_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.orders_tax_status
    ADD CONSTRAINT orders_tax_status_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.orders_tax_status DROP CONSTRAINT orders_tax_status_pkey;
       public            qzqvhzymsbdlxy    false    202            �   �  x����r�F�����198���p26����:��^�K�b��fFxwOy�<B�#o�'��ըIDd�/�H�o��׍��lQ|�BPB��P��S��R���t:�-��*^����|�x�6��("KBc8�S������΂�6��c����ZZd(�L��D�=���&G��A���2�A]�o��8C�D�-h�H�0h؎jh�2��')q{��H��2��� �ӆ�ֻ�c����0ُ Sz�Z�����)�C����WR�&�l�S��q�	�7­�L�dz��k�������3�d����X6*@���`���}�=rY�������3����_:�@2Mp{uH땴�m�,r�?��ޣ�z.�\*�Q$0[&�Inab�H���ܑhT���/�o�k�"f����0��*S���k�Y�}�&!��Ke,�T����/��p�t�	�9j���͇����|c&/�w2kV?p�1j�R+�������y��uђ��v�E����J	h�ͬVG4�;�M����ⲱ��!*�"��E�fG28	��>߮�aD�8x���p$��9�atDA���n$Ol#nXbC�`�ߥ��s)<'�c3�wR�����^5�g�-���=����|����a��	��
`��d��x���U]������aj?y{��g,�]�%�c�S	��s��������)�kG�&W0fpCR�o+Q�9|Ъ�!ΑvC�	���zs��~�U!p�|�n��y����<�#��KB�\������=x8O�B���&?��&��Tjǅx]X�>�{��I3:pz|��9٠h6��:�&t�������h���:�9p
CX��Q5؍��˺�9p"lϧ� �(fϩ߮�'��՛́�_���,�����������f��_��ξ�<��      �      x�3�4����� m       �   @  x����o�0ǟ���/�D�Yڲ��J�D��[��/��J�&��v���wI��.B�D��X�ώ����݃��>z��{�!YW�(�'�0C����3o�|�L�ɩ9���G�Wz����px��u�{�><��>@:����3���1��F��chFާ�:��-4�%�
�āfc-� M���: u't(*Z���~}��F��cZeo��q`�ӄ��L��)��"�:��	�{	h�K�I���MT��K�JH�+�DbV9�t@��rJ�
�7ƣ�	2�B��0����px,��?�V����3�FO������Z �V Z�]j�gS�z��M��N}�Eu��s��c�lX��>26�z���+�C�e��_�p���|�?�:Pg������@����DR g�f��TPLu!Ő�m�r��xd/�4OP�&T�İ�f�تd�Rw�P��$�U�.d�v9��
X?�ʞ�O�l���鼶b�}tQ��Zg�	 ���"�����Kcl���/]�Vsɵ�%��0��U.Ȍ�'�h%YrI3��TgjG������d�`���F��Ԇ      �   /   x�3�(-J�H,NM�2���I�2���S� �L8��KR�b���� �X      �   �  x��Y��$7�g�b �>C�W��?p�q{��|X��oJ��&�2<LTPI�b��=\nt�)�O�?���z�|���n��>�z��\W W��o��E.I V�%wH+�2[�@d'+V�|�w�>�*���EAn�Xs�%Q��X�T�Tѐ@L�qr���&�J�*F3r�|������_ɑC�N����V�.\�¦�J@"-L�`E`+9cS��U�҅�`��v00���&�
t��a�ݪ�gଅ����Y� �yC`�Ra�S��ʑ+����*�\XX���`����|p+pU9
�X\�*0��B-L�U�Y� ���l�J�e��vs�� Z�=͛b{�Dn?(�~��uYjAԌ�3�,�".�-�Jv����W��<�K��z�겄��.y�\:x췜��n�<���[��8f�X��p)r����f�곩\T窵LTr�X_Kٹ�}!GL{�#��Ƿo������ח��__�_�z����?���I�&A[��a�����J�6��,�����x�[E�8l�0�	;mi���!��'��{�Q��)�`��tDm~<9�>�1�XL��{BڂeNLS��NH�=���	e|�1t��!��ݹ��LPg��K[�Ց�Ж�]����k	~{r���^M[lu���y���!U<��x��=�ް�\9�qs���Xnܒ܋��4f�z���$���pG������5u]��햵	�C�}ܑ#� n]���c���W��Y���)�����6G4U�W�6�'�u�٬�,����mܦN��a��<z��c��5ԫ&��x��GLSr��3�i��t�fzl�ɱ�"�����r<<��[u��ѕ0�[)N#2�e��V�9�܂���<��.(���� u�u��j�v���;֦6�}BY��[T��Wq��,��Q[��qc�3d�����.�ea�X{q���P��v�d�������aav��-#m�T�`�E�@6��q�c:w�d �����sK~.�	�_�3<&�i���ɜ͍>����-n/ O�W�ϽYm1X�X��7Lv6 y����<7G�s�#�bڲ��x�cUׅ�F����p��bn����M6ь�D��2��hQ�כ���"� rd��C.qs4�.�ݽ�������#f�b��,iS�5���<��Ɍr4�����bkz�!���t!#������`���?��^z�byr�Pp��\���;�1C��C,|�]��h��0�-r���1$�9�o�%b:^ͮb�������/-n�      �   R  x�}�[��0E��*��V���YĬ��_��j4�J��H��	9悓��`}���L^�^?�O����MR)���h� �`w�mw,�] ����tU`���4�4*���� ��X	��R��>y%�/b$��{�H���'��+�(����� ݇�s��_����l=��G%�+�M�W�����J��}Jd�E%V��C�l^	�I��rV;�P�(v!���STs�)}eRTsv8����P�EQ�A��jSX%Џ�Q����aȕ�>��X��*:�{`d�fĩ�Ѭ=7�`�v��Y;��ެ�cOҎљ����̀���$���9��5������n��2�      �   �  x����m-!��bV����T���cr.D9�&R��?�(Z�Z�Z����������Ϗ2Z�Jғ��_���$N9�r	�������Q^��y��g�	�����h�+�~�RMҴ�뛵3�	�汒����3�OC�=��9H[l}��r���QIQ�V�!�T�Ot�PE�H�x�tv?)�陾և��(d0||��,>�pB����h��E�(�dZA���V#p���?&�AZ��I9��֓D���`\Q|�d-CEʱ��j#�I���,֢�s��_��F�ٯ~oU���&ڷ���Q	ӗ�@��~#����"V;�:��j��[Ì������t�V��;�³�#��!ӧ��5���-۶o�� .�	�f��[��B>l^����B���q�k���|(��Q�/F�FM&���])���~�3̌Q����qo�ăZ��A8�ّ��n=s�����*���J��	��X��\V7�E([,��&�Vp��A���6ͩ�,N1��~��6�1;��;�%��޾���	�0�F�ן\�A��7��Q`����q��&}�L���6w�B]�����*u+�,��k�=Y�����[z��i��gm4��s|�E~~ИDϚu���{��      �   G   x�3����K�2�t���ON,IM�2���+��L2�9�32
�,N�<����".S������l�=... �r      �   �  x����n�H����pŲ�@��n+�u��Nۋ�?[{e�m8I��F�}�c���e!�I)�h�|���3�IH�8�͇6Rϲ����s#_D&�>������5/2)2��M�DN��H��!_��c���CƑ\��	L_��l�(aĭ0l3�'gq^ĉ�&R�0˭���zH�5�> 8OE��2.��Ȗڴu@�/��x��(�>.�!A^R��~�fDF8	�+����V1F>n�_��Q��Y.��3�0�Ҭ؈dIng��n�d�J��_Z�m^Ǆ��1�h�۸Մu4�9�q)=)!Ĕ&�������J����<Ɍ�o�o ���q(;����9�8��(���sh*˖ǽ�B<Y���M�6a͇M�+���1ڧL$�8_�����2�kx��%&��wo������AR�e�1c����KO;1同�Y\�$���XE�i�etFn���(���S6�Af�s)+��)1�"g��g�1���zm���]r�X��,�sЮ��Q���\O[��a��NH���7��ߛ8Y�ٿ��8A��i�Kr�Ѩ��?C�i\r��*3��S�Vg�m�����Bf֗,_D���S�O����ӫ�wwI%0��˥\ރy�q.EQl���^���e�����=�nۛNMSߊ6bX�<�o�1J�Opݺ��*����^'s�)��XKk����ʼi8j�:���W+cp���Ꜻ�ʹ���sE��]q���+���+z^^g�r+����Z�@mrWoi3݁��`��k?qJ�M5�����99��e�3T��{�cx<���W0��f�j�n�f�6�� �kG����P��]���av�r���1;5֣ٹ&���]���E���*�
:��\��t�K����:Cf���]��ԇ���"��T����6;5]��6;O�8]��S��82;O�^�f�5{�����{1;!l� ����~̎���N��#r����ȝ��G�|�DN�����q\���o�q��q>C�5�S�&�MU�E�5������|y\{E{�8s99��.=��Ǚ�|�q�`��83Z�=�KW/�qf�y�|����8n�*=���gQ��fW`���yƅ���m��:��c���\9;���n0�s�      �   .   x�3��K-�2���+��LNM�2���,( ��9�s򋁌=... ��=      �   !   x�3�I�Pp�H�-(�2q�rR�b���� x�      �   "   x�3�(-J�H,NUp,((�/K�)����� u]      �   �  x���Mo�8��ʯ�iO��R��S� Y�Ĩ�X��Ȍ�FIN����!)Y��6��K,��<��;y7_�f>���{�^�kr׈�lZ2���Ƌ���a�E<�k�Q�K��ْ$�K�i�p�|&�e#6��.�]�����8 ��f�CJf!6H�����'��d[��*9`�sU�˭�;á�C]Ɉo����hU]��Wj�q<΋r �D��o��tc����u[�ϒܖ���<k	(Ij�7��߿�ߧ^��?.��z�^ZY�˦y!�]#�Z3x�1]�����T�Ïb۾#�F��y�C����W7~�^6�\���(�����%�DH�HuOvO�6efn�j�eG� 7{� �8W>w�^�'��D^ϡ^�8)}ck��>��%�/���y��Y@�*	��A�)aH6oJ�����~�*���\O�0�s�K�Iv�Kn�P���Ynd'�+�d^��F�^�x��eU�Jt��ʶ� -Y�?�9Ƈ��H��P�])��P�7O��J�[x
�җ�</܅h���k��^y4N9�"��Ic��5�f곍]ε*T-[����bj�ңoˎz	5>��D4���

-��gg�)�z�9|>2�k��Y�xqz���'):���z25��`YQ]Y�dЎ�DJu�V`�N���}m�ʂ#R��Bԓ�S�����MLը�����A����n4��W�ޯ[o�M̎��N2��S����GR��ǽ_P�1,�^��-���檔���]e�=��d,l����C"��H��������7�eM>�� �q��|1y�L
>�7��5K��Z��VE�W��[�烢��81�x)�NhDf.7�$�KU�-�p47�S��<!�K��$�k��:\��l��5���h$��M`���*v���S#��Y�O��t:��eZ �~��B���FV��G���9����1usKN�0\w�Z��Zw6L��ep�-,?g��� lԩkPhfW�̥��N�Y�F5�K�N
v3��0���4��A�S���Y�XMF =���_`�u�+�F��6�Fʚ�Is@6R��p��M���	I�17�k!�}��q��1�ZB�߆����m6���f���e�Kա���5́u%�82~�Yբx2����]-9k�����ү=q@M����I��ˀJ��!�pW��3�OA�M���=o�p�'}8�ρj_w�'��t�q���5Ɔ�_�������r~YV>�\�"��G9��O�Þ���rY�R�����E���V�zZ��ʪ��]�����x ��]a&q]����	�0�����/H��9/��!e^������n_8��qdM�t0�E��e�^���]n��*����qw�пD^��įq�6|?�';s��l(?��z�򆡀w�i�3�$�]�!v��v�p,�'��I��"�������7Ή      �   e  x����q$!�3Q\�BIpA\�?��f�3��Ō�Uv�|+��m��$��[�W�z�Yr��,_������Nr����hO]�&�?\[cu+5�G4_cL��%́��K�#I�K�fpJ.�p��1V��Ӽ�
0#&O�ĚSp>��4OT���:���x"{Ј���sYslB����N�������U�j:zg�p���0K=&�,S�Y�&A��n���z�s]����;�'8�_4��=�-9e'bp~(Z�-T*��=
<���������X.�G<]s��a���B��)���1Q/8�0�~�.q�نyw�P[���)�: Mо��k2M��9�W���/��������4�_ɧ�`�����h_��|u4 fj���4 Mp��4��)?~�A���2�~I|���U)����6	h��C{C���\��u�MhN
,�4��[�KP{�m����zd�Դ����
�@��ƤǪ/6u��'(�S���צ�2���N);M��7��$�����f�����}�B{;�q�6ۃ��1�+�~J�-����[M�l�f�6I��ɳ��sx���ir��R����Ӄ�[brA����m��Y���      �   0   x�3��K-�2�.M��,)IM�2�t,((�/2�9�s򋁌=... �1      �   �  x�͖MN�0���SXb��3���=p�nJQ	�H���*mh㒈�"���Y��ٙ� �R�Qؠ�J��N�@�������v���AWr"�JNl%'���S��q��Ŝ�>��n��ɗn���������ʷ�|�ۮ�wZ`����|U]��"�2Ua\ƈ!��aBF��*M,�D��E��SJab�̓{uCW4�4��n���4���KC7hLu{��r��������$ W ��xYh��ܢ���\U_�qL3��uhB��0M�O4��C�X�����X7�i~h���,�r̥���ϱ��%N��%���9G��@L�c{!�)^>�J������^4�+$�S�ט]�k�v�u��<�uI�Q��q~ڃ�
�u�0��
�����ڌ�������      �   �   x���M
�0���s�� �S��uS��C�H��ܾ-:��Ew/o���0"1�T�:��%)����Ƚ!x�%��$�]p:@Tk���ib8���N2������w��\U��۠{�������M�ƨu�e��0���D�sHO؃�*뤲�Q)��u�,�=���7:KM���HP�l:�pv��]��=�aa0�\*M�kg��8�mco  �2      �   U   x�3���,(��KWp��-H̫Tp��Î���*�K�RSK8}Ss22�9C�8-A�34����\'j�k�i�35̍���� c�H�      �   �  x��WM��6=[�BA/-0�I&�E;�{���@/��$�ؒ+�	R�/)K�=�S�a��M>R�㣼�>j�N�J�ň�e��Q(�7P�3�F[%���is��U��(��6h�o�˶p� �
�=h�?�+��7�����Эr�P��P�/u���e��A���l���^�n�E�c�ya@8��7�)N�B��;�͞FO,�`�ܶE�ڪ��.�o� ���/'���tzRw'��c(��
�xg�,���o�u����t�a��<��I�,Ց_�h�
��y�1�%��E%Xi�=	���Mu�rR������P�q,t���8MSI�\IӝC��f��Ҏ:����Sy�:����0��JG�S�����	�	�����r$�Rq��R���;�yq� 1��C*��c�[� �����Y��>kc�w�W�+*�Ӡl{7'k�6�K�ﲧ0.#"��x~�ȓI:��1�53-�5^ �"a�(� $�-�8lgQɒW������ݪ#�A�4T�1���!{<	u$�H���Q="������X�aJm������[��%����KCm�T_��Bq0��q�Ƒ!����b�m��h�Ȳo��Kk�����Xso����a���OΣQ0�����f��-�a�.I��n1鮾�ѭ�����PK�0��/&�;��^�e�5���QS��Vq|c������0���ҝ��8�Q+�OK�n�ғ���@��.�5N��[��VQԄ3����6m��F�D%��`�Rv=Z�����[ �$J�?=A����PCM�H}v#a�g��W���V��s��֢6��uF�9z��TD�yh���]���� �f0 {8��o'��%[-bé2���zg/˵�V��<p0V�>�7z�Uo����
�X�:{Q��z
�5�Mb�Z7�q�Wۛ�,TUG�p{Z툎��H���`��S̈́B2�!J�6xm�L�{@�?�Qp}��&b���/eގVa>���RL����f��}"8Qurl��bJ"����)�,�'^|�����p�p{�IrD�9ɦ!l�Я�H&cW:�b��*��D�=;�I�d�8b;)�C,M-�3�"��_?�����s�΀;;�����Q�&9m���_y�V+���;5�6������˦Rf!V�c��"�[�P�C7�Zw��Ht�οc�s��������>��e�?"��`��J��X��?��|  �K ��7"6>�u��U���      �   	  x����N�0���+�T�7˴�T�,�t3%�Ԋ;��vQ���l�XT!H^y�;�S�|�iE�f�qMb�!��r�4��zj�i������I.�:�wR:��a�
�x�ћ�3iM=�X�&��7�B~�N�i�{�E0���Vg%JKNq�בˡ a���-�Q$�����M��H���y�+nf���Po����FkC�<���]$XxvA�I��+z������c0�ސ4P��;<��<�OPo^��c��$I�/&��}     