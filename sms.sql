PGDMP                          |            sms    12.16    12.16                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16393    sms    DATABASE     �   CREATE DATABASE sms WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE sms;
                postgres    false            �            1259    16396    student    TABLE     `  CREATE TABLE public.student (
    sid integer NOT NULL,
    dob date,
    doj date,
    email character varying(255),
    fname character varying(255),
    grade integer,
    lname character varying(255),
    mname character varying(255),
    phone character varying(255),
    CONSTRAINT student_grade_check CHECK (((grade >= 1) AND (grade <= 10)))
);
    DROP TABLE public.student;
       public         heap    postgres    false            �            1259    16394    student_sid_seq    SEQUENCE     �   CREATE SEQUENCE public.student_sid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.student_sid_seq;
       public          postgres    false    203                       0    0    student_sid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.student_sid_seq OWNED BY public.student.sid;
          public          postgres    false    202            �            1259    24631    teacher    TABLE     �  CREATE TABLE public.teacher (
    tid integer NOT NULL,
    dob timestamp(6) without time zone,
    doj timestamp(6) without time zone,
    email character varying(255),
    fname character varying(255),
    grade integer,
    lname character varying(255),
    mname character varying(255),
    phone character varying(255),
    subject character varying(255),
    CONSTRAINT teacher_grade_check CHECK (((grade >= 1) AND (grade <= 10)))
);
    DROP TABLE public.teacher;
       public         heap    postgres    false            �            1259    24629    teacher_tid_seq    SEQUENCE     �   CREATE SEQUENCE public.teacher_tid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.teacher_tid_seq;
       public          postgres    false    205                       0    0    teacher_tid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.teacher_tid_seq OWNED BY public.teacher.tid;
          public          postgres    false    204            �            1259    24641    teacher_tid_seq1    SEQUENCE     �   ALTER TABLE public.teacher ALTER COLUMN tid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.teacher_tid_seq1
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    205            �
           2604    16399    student sid    DEFAULT     j   ALTER TABLE ONLY public.student ALTER COLUMN sid SET DEFAULT nextval('public.student_sid_seq'::regclass);
 :   ALTER TABLE public.student ALTER COLUMN sid DROP DEFAULT;
       public          postgres    false    202    203    203                      0    16396    student 
   TABLE DATA           Z   COPY public.student (sid, dob, doj, email, fname, grade, lname, mname, phone) FROM stdin;
    public          postgres    false    203                    0    24631    teacher 
   TABLE DATA           c   COPY public.teacher (tid, dob, doj, email, fname, grade, lname, mname, phone, subject) FROM stdin;
    public          postgres    false    205                      0    0    student_sid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.student_sid_seq', 10, true);
          public          postgres    false    202                       0    0    teacher_tid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.teacher_tid_seq', 1, false);
          public          postgres    false    204                       0    0    teacher_tid_seq1    SEQUENCE SET     A   SELECT pg_catalog.setval('public.teacher_tid_seq1', 100, false);
          public          postgres    false    206            �
           2606    16405    student student_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (sid);
 >   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pkey;
       public            postgres    false    203            �
           2606    24640    teacher teacher_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (tid);
 >   ALTER TABLE ONLY public.teacher DROP CONSTRAINT teacher_pkey;
       public            postgres    false    205               �   x�U��n�0E�ÿ8��fU�EEt���X�������[Z��=ݣ�� ��22��/J��Y:���>�N?=�p�-�4�o`��Y^���r�����!�n�Ӵ줖�d�Vj���:$��T
|Rj̢��Ag�V�Tm�ͪ��*����i�Z���D�~$3lV�R�f�W�r�h��R@�	����c:Ү���N/�h�F��n�Љs��؈)���V�g��[��D}������&su!��E�7�w�            x������ � �     