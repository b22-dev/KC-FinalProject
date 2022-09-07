
import SwiftUI
import PDFKit

struct english: UIViewRepresentable {
    
    let pdfDocument: PDFDocument
    
    init(showing pdfDoc: PDFDocument) {
        self.pdfDocument = pdfDoc
    }
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ pdfView: PDFView, context: Context) {
        pdfView.document = pdfDocument
    }
}

struct PDFUIView: View {
    
    let pdfDoc: PDFDocument
    
    init() {
        let url = Bundle.main.url(forResource: "EN10S1 22 QR - 72", withExtension: "pdf")!
        pdfDoc = PDFDocument(url: url)!
    }
    
    var body: some View {
        english(showing: pdfDoc)
    }
}
