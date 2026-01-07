ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT fk_credentials_client FOREIGN KEY (client_id) REFERENCES public.clients(id);
