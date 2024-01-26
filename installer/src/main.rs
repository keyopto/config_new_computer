mod bashrc_installer;
mod config_asker;
mod nvim_installer;

use bashrc_installer::copy_bashrc_files;
use config_asker::{get_config_from_user, Config};
use nvim_installer::copy_config_nvim_repository;

fn main() {
    let mut config: Config = Config::new();
    get_config_from_user(&mut config);

    if config.nvim_config {
        copy_config_nvim_repository();
    }

    println!("Neovim repository installed");

    if config.bashrc_config {
        copy_bashrc_files();
    }

    println!("Bash files installed");
}
