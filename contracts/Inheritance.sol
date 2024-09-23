//SPDX-License-Identifier:MIT

// Function that is going to be overridden by a child contract must be declared as virtual.
// Function that is going to override a parent function must use the keyword override.

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B is A {
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}
contract C is A {
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

contract D is B, C {
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}

contract E is C, B {
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}

contract F is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
    }
}
