Follow the Problem Design Guide for how to design problems.

*If you'd like to submit in JSON format,* create a folder with the problem name, any necessary problem files inside, and a **"problem.json"** file with the following format:

```
[
	{
		"title": "Problem Title",
		"description": "Problem Description",
		"hint": "Problem Hint (if applicable, leave blank if not)",
		"solution": "Problem Solution",
		"points": (problem point value here),
		"problemtype": (problem type value here),
		"filez": ["file1.zip", "file2.zip", "etc.zip", "etc.png"],
		"author": "Author Name"
	}
]
```