mod config_asker;

use config_asker::{get_config_from_user, Config};

fn main() {
    let mut config: Config = Config::new();
    get_config_from_user(&mut config);
}
