import os
from PyPDF2 import PdfFileWriter, PdfReader,PdfMerger, PdfWriter


def merge_files():
    pdfs = ['file1.pdf', 'file2.pdf']
    merger = PdfMerger()
    for pdf in pdfs:
        merger.merge(2, pdf)
    merger.write("result.pdf")
    merger.close()

def extract_page(doc_name, page_num):
    pdf_reader = PdfReader(open(doc_name, 'rb'))
    pdf_writer = PdfFileWriter()
    pdf_writer.addPage(pdf_reader.getPage(page_num))
    with open(f'document-page{page_num}.pdf', 'wb') as doc_file:
        pdf_writer.write(doc_file)

def split_pdf(file_name, page_num,destination_directory):
    if not os.path.isfile(file_name):
        return (f"The file {file_name} does not exist.")
    pdf_reader = PdfReader(open(file_name, "rb"))
    pdf_writer1 = PdfWriter()
    pdf_writer2 = PdfWriter()
    for page in range(page_num):
        pdf_writer1.add_page(pdf_reader.pages[page])
    for page in range(page_num, len(pdf_reader.pages)):
        pdf_writer2.add_page(pdf_reader.pages[page])
    i = 1
    outputFilename = os.path.join(destination_directory, "doc%s.pdf" %i)
    with open(outputFilename, 'wb') as file1:
        pdf_writer1.write(file1)
    i+=1
    outputFilename = os.path.join(destination_directory, "doc%s.pdf" %i)
    with open(outputFilename, 'wb') as file2:
        pdf_writer2.write(file2)
        
# split_pdf("C:\\Users\\warfa\\Downloads\\lecture03-linregr.pdf", 3)
