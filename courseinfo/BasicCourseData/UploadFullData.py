

def main():
    output = ""
    years = ['2023', '2024']
    quarters = ['1', '2', '3', '4']
    pages = ['1', '2', '3', '4']

    for year in years:
        for quarter in quarters:
            for page in pages:
                if quarter == '3' and page == '3':
                    break;
                output += f"python UploadCourseList.py {year}-course-data/{year}{quarter}/page{page}.json\n"
    
    print(output)


if __name__ == "__main__":
    main()