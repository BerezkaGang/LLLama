import subprocess
import sys
from pathlib import Path

tests_folder = Path(sys.argv[1])
executable = sys.argv[2]


def numbers(x):
    return list(filter(str.isdigit, x.split()))


def run_test(bc_file):
    input_file = bc_file.with_suffix(".input")
    with input_file.open() as f:
        inp = f.read()
    true_file = bc_file.with_suffix(".t")
    res = subprocess.run([executable, bc_file], input=inp, capture_output=True, encoding='utf-8')
    if res.returncode != 0:
        return 'RE'
    output = res.stdout
    output_start = 'Run main\n'
    output = output[output.find(output_start) + len(output_start):].strip()
    with true_file.open() as f:
        t = f.read()
    t = t[t.find('\n'):]
    return 'OK' if numbers(output) == numbers(t) else 'WA'


test_files = list(filter(Path.is_file, tests_folder.rglob('*.bc')))
for bc_file in test_files:
    res = run_test(bc_file)
    print(bc_file.stem, res)



