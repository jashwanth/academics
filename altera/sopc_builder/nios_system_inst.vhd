  --Example instantiation for system 'nios_system'
  nios_system_inst : nios_system
    port map(
      out_port_from_the_LED_S => out_port_from_the_LED_S,
      out_port_from_the_switches => out_port_from_the_switches,
      zs_addr_from_the_sdram_1 => zs_addr_from_the_sdram_1,
      zs_ba_from_the_sdram_1 => zs_ba_from_the_sdram_1,
      zs_cas_n_from_the_sdram_1 => zs_cas_n_from_the_sdram_1,
      zs_cke_from_the_sdram_1 => zs_cke_from_the_sdram_1,
      zs_cs_n_from_the_sdram_1 => zs_cs_n_from_the_sdram_1,
      zs_dq_to_and_from_the_sdram_1 => zs_dq_to_and_from_the_sdram_1,
      zs_dqm_from_the_sdram_1 => zs_dqm_from_the_sdram_1,
      zs_ras_n_from_the_sdram_1 => zs_ras_n_from_the_sdram_1,
      zs_we_n_from_the_sdram_1 => zs_we_n_from_the_sdram_1,
      clk_0 => clk_0,
      in_port_to_the_switches => in_port_to_the_switches,
      reset_n => reset_n
    );


