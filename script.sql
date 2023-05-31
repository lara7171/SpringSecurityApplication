PGDMP         ,                {            Shop    15.1    15.1 5    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    17216    Shop    DATABASE     z   CREATE DATABASE "Shop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Shop";
                postgres    false            �            1259    17218    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    17217    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    215            9           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    214            �            1259    17225    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    17224    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    217            :           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    216            �            1259    17281    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    17280    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    225            ;           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    224            �            1259    17232    person    TABLE     �   CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    17231    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    219            <           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    218            �            1259    17241    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    17264    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    17263    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    223            =           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    222            �            1259    17240    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    221            >           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    220            ~           2604    17221    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215                       2604    17228    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    17284 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    17235 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    17244 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    17267    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            (          0    17218    category 
   TABLE DATA                 public          postgres    false    215   p9       *          0    17225    image 
   TABLE DATA                 public          postgres    false    217   �9       2          0    17281    orders 
   TABLE DATA                 public          postgres    false    225   y?       ,          0    17232    person 
   TABLE DATA                 public          postgres    false    219   �@       .          0    17241    product 
   TABLE DATA                 public          postgres    false    221   �A       0          0    17264    product_cart 
   TABLE DATA                 public          postgres    false    223   �X       ?           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    214            @           0    0    image_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.image_id_seq', 100, true);
          public          postgres    false    216            A           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 4, true);
          public          postgres    false    224            B           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 2, true);
          public          postgres    false    218            C           0    0    product_cart_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.product_cart_id_seq', 5, true);
          public          postgres    false    222            D           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 20, true);
          public          postgres    false    220            �           2606    17223    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    215            �           2606    17230    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    217            �           2606    17286    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    225            �           2606    17239    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    219            �           2606    17269    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    223            �           2606    17249    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    221            �           2606    17251 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    221            �           2606    17287 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    219    225    3210            �           2606    17257 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    215    3206    221            �           2606    17292 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    221    225    3212            �           2606    17252 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    221    3212    217            �           2606    17275 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    221    223    3212            �           2606    17270 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    223    3210    219            (      x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�0����x��uMk.OҌ01���ۀ�2�01�b�Ŧ�.l���b����b녽v\�1�� �6VG      *   j  x�����e7��y����$J6r�`���R�)��w�X��K�����M:��:,V?~�÷������|�s���^^�_����x����?��������������������ox|=ڇ�W=l��:M����B�۠�WL76���/���~������x�Uf�]�e�j�$��)��(����T@���Ô�M�)�o�	o���f$����^����k����F���̳�k�m��"OcrJ���{��4S�T<�0������!/�iPa0=��9�&���
f[$u�{�۸���0�o33�լ�
��Mt��˩�*�7��YDO`0ז�f�{SL�Ԁ"��ʟE�f=LβSd/̆e�;S����k��"zS�L%c5����jKd���7��%_z�8��\5�׉o;���kS��1�>ں4�o3��Ǝ�g�p�4���o�ZjLi��KC��ǈx
>�*m3��5ӈ�����\Iӥ���cD���b��l=HWUoly��a~�4f;>4��'8A�������1&�U�.���3��ւ�\���qv��}R�)]�i�ri��f%ّv0|ѹH3FeKj63~ʥ��̣!쾴�$:��cR��{���3���R��q<� J��mQ��k]���GC.R3'�^�x�n-4ɴX&���̓eRѡ�.��!��-�[��k�|iHn3O�i/�n�.[5zɱ��S���|i�>�d��n�з�	�n��aC��
��'˸Jf4��`U�	!�SM;j\��<Y6S�,�'� sۢ1=QF��
�0��<��!mis� 9�Ԕ��})��5r��4ya4��s�m��"�%�]���}��tΩ�x��~��>S�v4�Ͻ	�ޏ/�BG϶�OW�����}��^���z�
�C�7�\e��<����m���N��k��o�yp�햩�j�헎�3��긎Ԩ���٢�o
C?�Z�:�����m�q��*.?���
���@Cɓ����HRޗ��3���NYX�.TQh���=�ӺTt�y�(�T�%Q�����H��2L�_*��<n4�1�Q��NPq�.\gb>���r��>�-��Z(arp�md�!%n}Z��+��6�8Q�6P���ވ�9m�Q��h	��'~<	�fE�T�c�����"�p�d��O��u��p))������٣���pd�cF��ȿ��s6���y�B����̰�ެ|�����E��m�L�3c9�0��"���n=n3��<ɩc95��0q%,P�SД����y��Dh[�R��Ђ��o!���Ƽq�\Nt�y���p�'ڌ�ll��9c�w�9E����3�i��ȳ�:z��G�l�2+�:�\:�w��?���      2      x���;k�0 �=�B[���$�$w�!PRhҮA/�!��c��*(��%pw���n�y;�����.s8u�Ɣ�+[u�bq���b�O�8u�\�~>�<V�2v����O��d菷��8�9N�^����͞��b%�(Pr�9C٠i��	�,S�
����WYxn�%�-Y�` �/{ґ(�bX���i�}�3Hـ��j"{3�6�D\��R���<Q"(��d�(}7�����$%�� ��7��P?�6�6j���D�,��AĂ ��G��
@���;���t���      ,   �   x����O�0 �;E$l	aP��+�U,��꼘
�t|�u���bv���%��I&�$�A�wRN���6`&Jȶ�:6�VM�j%�Dy���g��{�XS0!3=�D��||vY(�;ˑ�}Kr�~�?�No���u^��kr|��s�\�I��z�Ě?�&�����w{��t���_�U��X�U��R�P��j��A�(��W������'��eʏ]      .      x��\[oWr~���<��wf8���IX�A�l�,�P$"!V��F�7Ό(R�,Z��q��ʛ $͞���M`A�?J�WU�Owe%��!��>�:u��:���G�n}\����Ͽ��{�wV>p��wv�K�w���;[����t�~�zx����;��?k�?ؾC�nݻ����l�ܣ_��������C�����|��������z�k�Z�F�n��^���^i��f������t�������i��,�βE6�w���R��|/���_���F;���{�� �g�� �.K��i6�$�di>����]ds��GA�O��郧��Пy�,���|�Ř-���c���Ǽ$z3ʏh�$?̦�9�bB��<MA��U�^Lȯd���"��e��	��N�a�{4*��s�=��Я���s���uz��cUc�=¾+�c�y����� ����^/Q�V$9ċ��Y8��8f'�(��!��W|B�g��}7����4)K����QLo�r:����O��@��B���A`:8Y*���y�]�jDߝzG�?͟aT9��2�R���rFx%ʇ$��(�� ���U���w�l�H�f:�G�qz]δ4���l=�;�P�v�&���ј�&��XqY�H�g,�+8O%���,]��/���C(�O�Σ�V�1�i�_CZ�	��;A�vȊ��\U����4'ل��ƛ��X�hW�JG�����1h ->�Z�X��??���Ndzz�|D�Ɇ�gb]�列�gg#����Z�0�����АX�,����Y��]���k�Ǭ�8�,r�u8����l�;��NW�L�"�K+I�|K�M�ee_����`W��L1��=�������� 'i�?���!�!�;�5�`�SK�!;�a�Ƃ�׉y���cU<�u4<�/{K8�ê���X�)��ǲ�o��&�E���f�N���a����x�&�o���b���N���Z���(���a�P��O����)ƾ��i^1Z>v8pN8UQӃ���:�8r
6	��!�I�����B�)�����v�h*�k��f8]���Ø{��yp��nX1b�Z���:E������8���;�e��#���Y}�)b���e�J��q��
����P�2�N����-D�c����wfs ��8��1�Uۂ���u�o����'"��T?�-c�|X��3��H�&i����",���u��.�\\4�$oF>j�y��h�e1f�VV܇�����e�'P3�%QO,m����;�6�1)>����g�~�RŴp�pb�Y�,��eƺ���906;��v�n��X\�\k2d\j������؏�&���oz�!��3JN�y�u�$�4l�1�O���.��;�Z�ݩ!�n��ꬴ�k����-�b��B�Z]'�ـ�"����� RFd:�t$B	�a ��v��)��`��	�
o�fD>F�&���Y=C�QU]��HlT��0||~E��;P;gɟ)D(;o�b5 5M�U�G8���>6��W�T�pvT<�捰IX&���3x,C�Ш)���&��H����j|����J"�D6�D5%����O!��~R�{۟65$���r�Nƅ���_b='�3Y��4��4��-19D�d;G�)/(΀��588�>�v_3�X\}�ϼ��H�����<U$��@I�8�Wz,�ىI��ڭk-Ͽd�XÍ9��
MD���yyy
�j��SA��g����B��zhʄ��?�p��NP�ą�=�0�C>����֡�&���l�jZ<��cRs��_g�呤:
�N�s��s�x�� 4h��`�ȶ�`�s���[X���oa��? (�i_�R?
+sIgi�ŶC*��)�Ŷ9��c�P�9��C�|xb�P8��0B��|����X�ʔ�@�Tv���_%��-�9��e���B�Ŝa�4�`uhY�)MJ9���(�8OB���9�NP�\?�����D���DPn
�2rA"�޴�N��� �ǀa
���CG0x
��;�x���>�牁:=��B��ۢz�d�;֍b.h��8^vV>0>UZA$���B=o9�Df,&�˳=��C(�@5#��9 ; l1?t���/n�㌁>bY"m�mgFK�(��<���g�}�ix���@C���E�^�u�rLy����3*�+6�C� [E?Xz\��1�9�bu"�s�4�Y͏�^����3h�t�@�p�^{����à��.�ċ��@����n�vz�͕�fk���:��w��[X5Jd皊̪Z��(rI�a�;C1 �V(�)�����r�¹AQ�Cf �o��*<6�V:s�"�/m�5�S#�����C�e����C�,P(�WB��<D�Cⓨ���D��uvL�ӿg�J�O�c��/ٵ������;hm4N�~F2%g)N�L%s9���&Ψ�hD���iU�x4P�'t 2j�L��0��Ў<���`��Y��iGT]�DJ��U�Ks�g�"L����gp�GК��ʤN=�1��:�@g
��.� F(V�I��d�9��q`�أlxm�pO��T�I������t$�>/YҒcS.U�"�RL*y3��%&#�<�VK�E)�6��k�ۧK��f_���EC
nڡ1�ER7����z�%Lh �4Ed?�P8HL3?���Tܱ˱ao/e=G�R	/���䩳|Ϊb�TռD�:�zfP�BI���;�\�~T��z�=�+f�>F�T�M�H��R4��*�PUj��\ ���XPB��>�`�Z�t�i�����"�B�Q%�F|Z~Z��B��϶��C�H��� ?���R��c�dN�pbrA�ɕ_S'�^8�S�Q�25�+�� B��CQ{���Ai�@+,��.+r�ݔxX�������xe��?C��F�&5���35A�f�V7|�ww������]���'A
otZ�C�n��^��t��X�j��ΐ]*��l�EAD� {.��3�QYgJ�B�+�Y�zE׬�銸 Ǭ8
6)<�%�3%�
��<��*����q�#ag�L�������<��<�9��&� U�MRH�-�e���vg���Կr���篳����~�Gv������U�Sy{4n��q�Vse��i� ��{��V���܊���sČQQ�'ϲz���H���'��㊹�n���G�b��f b~�1��\��ѧ����D��zDD��ˈL�N�񡄞Z���j]���7�3r��������MN@%A�DXb�Ăe�y�Ý�;;%t�Q:45pɥ�~ ���4��{��I������I��R�Q��P_��r��Z_��:�� �≦���S ���b_,]<�)z;�2�+N:�����B�7_	�$h�.D����j4��J�󫀆8qz3x��P1�����O�(<u�=��p_�;W&:C8�ތ�h�����X�@�������R���@P�ʡ`�BL~��கe�Pk���2������K]��u���e,qH�q ��o�nL����h#��3������4��+�3�ph:@�C��`H@}!R)�6K�*��L�����n2���K
B�E�� �jc$�;෿�(��)�U�R�Xro�_�(5��1�H���M��^�n޿w����7r�?�е�㧅(b�Ϳy��i�n~x���]� �����m��6z�͕����f�|.���Ec#��K;O\��Х�C�zlF�j����7z�z%�-�X�yW��U��@�3
��#u8P�g�Y��WlN�Y1��-H�`%���{�.�ڢ��(�V#�*�]�vۉ{�9u�,�]���O�Y�`g����	d�O
6�!�Z��p�$�u`�c��^B�Â�c#Rج���(�����X�;��+&$��-� .A׬9gE��&@:{<tC�vs��()��m��h���`��Z��Di�CG�s~��ح:G�)@�   ��q��Њ�@ڃM&�D�n�΅j�u��E¹qW'F�.5/��^��(��o�'�\�k:��H�M�P��f���>b�l�K�:���}�β/�.M��z,_w�$��ʇؠr�s��u�-=�־��B
���&�j"���fW"�K�kL#��@{��I�Q�������j�c��S����>}{��f%ڴzp�ݕV{m����J�+xU(������z��W?�X[����V�Ѧ�k���;�T*U9�����K�"B�ޖ��R*��ظi��[�*�8��=�_c��a�2	�����}-���A5?�}(h5v^���E5EcQb�:��c��m��ն���1wc)7��$�X�TV)j�;/��B�pQs#��T�*�j�O��Ęi�K����W�:A�[Q�\H#$�����T�������t�4.ծME@��*&�2fҹ��_ �j�����^�����vW$��Q9x�t����E�-��5�����#/u�b8"v䟺r��$�k2-0K\m����av1iH+ʀ�9
XX���+�f'k�A�9�6y��q�R_9��K�J�0��XYw D�	�!�񴄣�r=1j�@�rO&�l/`W�+ i�P�}MR�3w%e��������F3�y�j�:W���ǅ���ܸ�c�֚�^��Xs���skz��=De_I��͢�����p�ʪ��8��q$q��������H��@�G�������bv\��9/5w��{�.�Y}��L�T:�]�~��3���ϋ|�@��R?2��E ��AF�Dc�:D��T�7�P�	qd��Yj5��E=�y�ew�
�\�q���8�H[^����'�7.�z�]6�\?qG���.�<���p�H���+E�S�%^گr��>�5@�����y�����A�����r�T5���Ҋ%�,�P�.��Ň�doO��$�B7g��Ot'C�0
�C���R�y�,A�;c�o��g)�V��>�7��ک���u���:���1�k�P6�"�&_<@���L�>����� �R�h�Zvf����I�~��2���e;��/�ߦ�&7����+%��Kz� \���x��"�:5�q&��2m�\�#.x�"w����y5-�<s�2cX����^y,�ἋNl�%���z�1ԶT��dm�y\���o����,~����
��«�{��ޯ�R<W���6/�l&��D���Z��*���������Q�|�����\y��]�շz�.�i 194L[-��It�NX�-.�{�s~3�\G�;��2ݢ�=�͖W�����Wjz����p�<pǄx�E���V�`���N�CH�6O��^iW_k�ګ�k��&C�v����Mt�]�%[(��^4�ݲt����%�xO���^��묮t��;�S���������N���c���*�c�i�0\�&fT���ۣ�P]���O���
,���h2wǡ�0�*E�X�Wyr�@�xoŕE�._���6��{d�����C����R�[m(|d�hat�����c�]���|���)Kn�7=��*���D&��57͍�a���}{X�4%�R%�;J�M�ڪ���K�.G�ֺ�DQ鮵w;��w�..u3� G��p�]�� �W�|�YT�G�>!�9%ֶ'
-� pi�<�;}u��q�9����.<���ھP!xS�K���2v�-�r�A��c�i�a�B���P���\��_ ��J�T\�����#eqUg/ ���^�7�X~!�z�ߞ ���?7b~���sD�W������ԋA�/r��	���?���"      0   
   x���         