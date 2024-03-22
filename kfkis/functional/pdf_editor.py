from PyPDF2 import PdfFileWriter, PdfFileReader,PdfMerger


def merge_files():
    pdfs = ['file1.pdf', 'file2.pdf']
    merger = PdfMerger()
    for pdf in pdfs:
        merger.merge(2, pdf)
    merger.write("result.pdf")
    merger.close()

def extract_page(doc_name, page_num):
    pdf_reader = PdfFileReader(open(doc_name, 'rb'))
    pdf_writer = PdfFileWriter()
    pdf_writer.addPage(pdf_reader.getPage(page_num))
    with open(f'document-page{page_num}.pdf', 'wb') as doc_file:
        pdf_writer.write(doc_file)

def split_pdf(doc_name, page_num):
    pdf_reader = PdfFileReader(open(doc_name, "rb"))
    pdf_writer1 = PdfFileWriter()
    pdf_writer2 = PdfFileWriter()
    for page in range(page_num):
        pdf_writer1.addPage(pdf_reader.getPage(page))
    for page in range(page_num, pdf_reader.getNumPages()):
        pdf_writer2.addPage(pdf_reader.getPage(page))
    with open("doc1.pdf", 'wb') as file1:
        pdf_writer1.write(file1)
    with open("doc2.pdf", 'wb') as file2:
        pdf_writer2.write(file2)
