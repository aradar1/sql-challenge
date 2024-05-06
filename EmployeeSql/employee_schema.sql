PGDMP  )    4                |        	   Employees    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16727 	   Employees    DATABASE     �   CREATE DATABASE "Employees" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.utf8';
    DROP DATABASE "Employees";
                postgres    false            �           0    0    DATABASE "Employees"    COMMENT     9   COMMENT ON DATABASE "Employees" IS 'Module 9 Challenge';
                   postgres    false    4819                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16736    departments    TABLE     m   CREATE TABLE public.departments (
    dept_no character varying NOT NULL,
    dept_name character varying
);
    DROP TABLE public.departments;
       public         heap    postgres    false    4            �            1259    16755    dept_emp    TABLE     f   CREATE TABLE public.dept_emp (
    emp_no integer NOT NULL,
    dept_no character varying NOT NULL
);
    DROP TABLE public.dept_emp;
       public         heap    postgres    false    4            �            1259    16782    dept_manager    TABLE     j   CREATE TABLE public.dept_manager (
    dept_no character varying NOT NULL,
    emp_no integer NOT NULL
);
     DROP TABLE public.dept_manager;
       public         heap    postgres    false    4            �            1259    16743 	   employees    TABLE     :  CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    emp_title_id character varying NOT NULL,
    birth_date character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    sex character varying NOT NULL,
    hire_date character varying NOT NULL
);
    DROP TABLE public.employees;
       public         heap    postgres    false    4            �            1259    16772    salaries    TABLE     [   CREATE TABLE public.salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL
);
    DROP TABLE public.salaries;
       public         heap    postgres    false    4            �            1259    16729    titles    TABLE     n   CREATE TABLE public.titles (
    title_id character varying NOT NULL,
    title character varying NOT NULL
);
    DROP TABLE public.titles;
       public         heap    postgres    false    4            0           2606    16742    departments departments_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_no);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public            postgres    false    216            4           2606    16761    dept_emp dept_emp_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no, dept_no);
 @   ALTER TABLE ONLY public.dept_emp DROP CONSTRAINT dept_emp_pkey;
       public            postgres    false    218    218            8           2606    16788    dept_manager dept_manager_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_pkey PRIMARY KEY (dept_no, emp_no);
 H   ALTER TABLE ONLY public.dept_manager DROP CONSTRAINT dept_manager_pkey;
       public            postgres    false    220    220            2           2606    16749    employees employees_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    217            6           2606    16776    salaries salaries_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (emp_no);
 @   ALTER TABLE ONLY public.salaries DROP CONSTRAINT salaries_pkey;
       public            postgres    false    219            .           2606    16735    titles titles_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (title_id);
 <   ALTER TABLE ONLY public.titles DROP CONSTRAINT titles_pkey;
       public            postgres    false    215            :           2606    16767    dept_emp dept_emp_dept_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);
 H   ALTER TABLE ONLY public.dept_emp DROP CONSTRAINT dept_emp_dept_no_fkey;
       public          postgres    false    4656    216    218            ;           2606    16762    dept_emp dept_emp_emp_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);
 G   ALTER TABLE ONLY public.dept_emp DROP CONSTRAINT dept_emp_emp_no_fkey;
       public          postgres    false    218    217    4658            =           2606    16789 &   dept_manager dept_manager_dept_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);
 P   ALTER TABLE ONLY public.dept_manager DROP CONSTRAINT dept_manager_dept_no_fkey;
       public          postgres    false    216    4656    220            >           2606    16794 %   dept_manager dept_manager_emp_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);
 O   ALTER TABLE ONLY public.dept_manager DROP CONSTRAINT dept_manager_emp_no_fkey;
       public          postgres    false    217    4658    220            9           2606    16750 %   employees employees_emp_title_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_emp_title_id_fkey FOREIGN KEY (emp_title_id) REFERENCES public.titles(title_id);
 O   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_emp_title_id_fkey;
       public          postgres    false    4654    217    215            <           2606    16777    salaries salaries_emp_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);
 G   ALTER TABLE ONLY public.salaries DROP CONSTRAINT salaries_emp_no_fkey;
       public          postgres    false    219    4658    217           