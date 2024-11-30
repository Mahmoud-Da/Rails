# Rails

The fundamentals of Rails

- To avoid the nested git repository:

  1. Navigate to the Parent Repository:

  ```bash
  cd path/to/parent/repo
  ```

  2. Remove the Nested Repository:

  ```bash
  rm -rf path/to/nested/repo/.git
  ```

- The error message you're encountering indicates that the installation of the `racc` gem failed. Follow these steps to resolve the issue:

  1. Run the following command:

  ```bash
  sudo xcodebuild -license
  ```

  2. Follow the prompts to read and agree to the license agreement.
     After you have agreed to the license, try installing the gem again by running:

  ```bash
  gem install racc
  ```
