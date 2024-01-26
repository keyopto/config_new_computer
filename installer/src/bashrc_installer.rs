use std::process::Command;

const SOURCE_DIRECTORY: &str = "../bashrc";
const DESTINATION_DIRECTORY_FROM_HOME: &str = ".";
const BASH_FILES: [&str; 3] = [".bashrc", ".bash_aliases", ".bash_appearance"];

pub fn copy_bashrc_files() {
    let home = std::env::var("HOME").unwrap();

    let destination_directory = format!("{}/{}", home, DESTINATION_DIRECTORY_FROM_HOME);

    BASH_FILES.iter().for_each(|file| {
        let source_file = format!("{}/{}", SOURCE_DIRECTORY, file);
        let destination_file = format!("{}/{}", destination_directory, file);

        Command::new("cp")
            .arg(&source_file)
            .arg(&destination_file)
            .output()
            .expect(format!("Could not move {} to {}", source_file, destination_file).as_str());
    });
}
