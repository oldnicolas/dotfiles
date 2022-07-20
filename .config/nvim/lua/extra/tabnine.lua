local cmp_tabnine = require 'cmp_tabnine.config'

cmp_tabnine:setup {
  max_lines = 1000;
  max_num_results = 20;
  sort = true;
  run_on_every_keystroke = true;
  snippet_placeholder = '..';
  show_prediction_strength = true;
}
