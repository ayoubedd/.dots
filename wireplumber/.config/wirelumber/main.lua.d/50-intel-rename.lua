rule = {
  matches = {
    {
      {"node.name", "equals", "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink"}
    },
  },
  apply_properties = {
    ["node.description"] = "System",
    ["node.nick"] = "System",
  },
}

table.insert(alsa_monitor.rules, rule);
