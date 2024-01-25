use std::io;

pub struct Config {
    pub nvim_config: bool,
    pub bashrc_config: bool,
}

impl Config {
    pub fn new() -> Self {
        return Self {
            nvim_config: false,
            bashrc_config: false,
        };
    }
}

fn ask_bool_config_on(question: String, value: &mut bool, priority_yes: bool) {
    let mut input = String::new();

    let question_suffix: String;
    let answer_least_priority: String;

    if priority_yes {
        question_suffix = "[Y/n]".to_string();
        answer_least_priority = "n".to_string();
    } else {
        question_suffix = "[y/N]".to_string();
        answer_least_priority = "y".to_string();
    }

    println!("{} {}", question, question_suffix);
    io::stdin()
        .read_line(&mut input)
        .expect("failed to read stdin");

    if input.trim() == answer_least_priority {
        *value = false;
    } else {
        *value = true;
    }
}

fn ask_bool_config_on_yes_priority(question: String, value: &mut bool) {
    ask_bool_config_on(question, value, true);
}

pub fn get_config_from_user(config: &mut Config) {
    ask_bool_config_on_yes_priority("Config nvim ?".to_string(), &mut config.nvim_config);
    ask_bool_config_on_yes_priority(
        "Config bashrc ? (former bashrc and bash-aliases will be overwritten)".to_string(),
        &mut config.bashrc_config,
    )
}
