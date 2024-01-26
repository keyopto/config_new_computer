use std::path::Path;
use std::process::Command;

const SOURCE_NVIM_RESPORITORY: &str = "../nvim";
const DESTINATION_NVIM_REPOSITORY_FROM_HOME: &str = ".config/nvim";
const PACKER_GITHUB_REPOSITORY: &str = "https://github.com/wbthomason/packer.nvim";
const PACKER_COMPUTER_DESTINATION_FROM_HOME: &str =
    ".local/share/nvim/site/pack/packer/start/packer.nvim";

pub fn copy_config_nvim_repository() {
    let home = std::env::var("HOME").unwrap();

    let config_nvim_repository = format!("{}/{}", home, DESTINATION_NVIM_REPOSITORY_FROM_HOME);
    let packer_computer_destination = format!("{}/{}", home, PACKER_COMPUTER_DESTINATION_FROM_HOME);

    if Path::new(&config_nvim_repository).exists() {
        Command::new("rm")
            .arg("-rf")
            .arg(&config_nvim_repository)
            .output()
            .expect("Could not delete nvim config directory");
    }

    Command::new("cp")
        .arg("-r")
        .arg(SOURCE_NVIM_RESPORITORY)
        .arg(&config_nvim_repository)
        .output()
        .expect("Could not move nvim directory");

    if Path::new(&packer_computer_destination).exists() {
        Command::new("rm")
            .arg("-rf")
            .arg(&packer_computer_destination)
            .output()
            .expect("Could not delete packer repository");
    }

    Command::new("git")
        .arg("clone")
        .args(["--depth", "1"])
        .arg(PACKER_GITHUB_REPOSITORY)
        .arg(&packer_computer_destination)
        .output()
        .expect("Could not clone packer.nvim");
}
