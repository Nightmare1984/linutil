fn main() {
    // Rebuild program if any file in commands directory changes.
    println!("cargo:rerun-if-changed=src/commands");
    // Add current date as a variable to be displayed in the 'Linux Toolbox' text.
    println!(
        "cargo:rustc-env=BUILD_DATE={}",
        chrono::Local::now().format("%Y-%m-%d")
    );
}
