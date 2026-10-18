#!/usr/bin/env python3
"""Fail the build unless the open-ATS readiness score clears the gate."""

import json
import sys


def main() -> int:
    path = sys.argv[1]
    with open(path, encoding="utf-8") as handle:
        report = json.load(handle)

    findings = report["ats"]["findings"]
    score = report["overall"]
    only_phone = bool(findings) and all(
        "phone" in finding["message"].lower() for finding in findings
    )
    threshold = 85 if only_phone else 90

    print(f"ATS readiness: {score}/100 (threshold {threshold})")
    for finding in findings:
        print(
            f"  {finding['severity']}: {finding['message']} ({finding['penalty']})"
        )
    if not findings:
        print("  no findings")

    if score < threshold:
        print("score is below the gate", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
