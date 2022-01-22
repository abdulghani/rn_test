module.exports = {
  root: true,
  extends: ["@react-native-community", "prettier"],
  parser: "@typescript-eslint/parser",
  parserOptions: {
    project: ["./tsconfig.json"],
  },
  ignorePatterns: [".eslintrc.js"],
  plugins: ["@typescript-eslint"],
  overrides: [
    {
      files: ["*.ts", "*.tsx"],
      rules: {
        "@typescript-eslint/no-shadow": ["warn"],
        "no-shadow": "off",
        "@typescript-eslint/no-unused-vars": ["warn"],
        "no-unused-vars": "off",
        "@typescript-eslint/naming-convention": [
          "error",
          {
            selector: "default",
            format: ["strictCamelCase", "StrictPascalCase", "UPPER_CASE"],
          },
        ],
        "@typescript-eslint/no-empty-function": ["warn"],
        "@typescript-eslint/no-empty-interface": ["warn"],
        "@typescript-eslint/no-explicit-any": ["off"],
        "@typescript-eslint/no-extra-non-null-assertion": ["error"],
        "@typescript-eslint/no-extra-semi": ["error"],
        "@typescript-eslint/no-extraneous-class": ["warn"],
        "@typescript-eslint/no-for-in-array": ["off"],
        "@typescript-eslint/no-implied-eval": ["error"],
        "@typescript-eslint/no-invalid-this": ["warn"],
        "@typescript-eslint/no-magic-numbers": ["warn"],
        "@typescript-eslint/no-var-requires": ["warn"],
        "@typescript-eslint/prefer-nullish-coalescing": ["error"],
        "@typescript-eslint/prefer-optional-chain": ["error"],
      },
    },
  ],
};
