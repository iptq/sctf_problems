Follow the sCTF Guide for how to design and correctly format problems.

Create a folder named as the problem name, with any necessary problem files inside, and a **"problem.json"** file with the following format:

```
[
	{
		"title" : "Problem Title",
		"description" : "Problem description",
		"hint" : "Problem hint (leave blank if not necessary)",
		"solution" : ["sctf{flag1}", "sctf{flag2}", "sctf{etcflag}", "sctf{all flags are case insensitive}"],
		"points" : 50,
		"problemtype" : 5,
		"filez" : ["file1.zip", "file2.zip", "etcfile.zip", "leave empty array if no files.jpg"],
		"author" : "Problem Author"
	}
]
```