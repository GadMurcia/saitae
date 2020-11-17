/*
 * Copyright (C) 2020 delsas
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package net.delsas.saitae.exporter;

import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;
import javax.faces.FacesException;
import javax.faces.component.UIComponent;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import org.primefaces.component.api.DynamicColumn;
import org.primefaces.component.api.UIColumn;
import org.primefaces.component.datatable.DataTable;
import org.primefaces.component.datatable.export.DataTableExporter;
import org.primefaces.component.export.ExportConfiguration;
import org.primefaces.util.ComponentUtils;
import org.primefaces.util.Constants;
import org.primefaces.util.EscapeUtils;

/**
 *
 * @author delsas
 */
public class TextExporter extends DataTableExporter {

//    @Override
//    public void export(FacesContext context, DataTable table, String filename, boolean pageOnly, boolean selectionOnly,
//            String encodingType, MethodExpression preProcessor, MethodExpression postProcessor, ExporterOptions options,
//            MethodExpression onTableRender) throws IOException {
//
//        ExternalContext externalContext = context.getExternalContext();
//        configureResponse(externalContext, filename);
//        StringBuilder builder = new StringBuilder();
//
//        if (preProcessor != null) {
//            preProcessor.invoke(context.getELContext(), new Object[]{builder});
//        }
//
//        builder.append("").append(table.getId()).append("\n");
//
//        if (pageOnly) {
//            exportPageOnly(context, table, builder);
//        } else if (selectionOnly) {
//            exportSelectionOnly(context, table, builder);
//        } else {
//            exportAll(context, table, builder);
//        }
//
//        builder.append("").append(table.getId()).append("");
//
//        table.setRowIndex(-1);
//
//        if (postProcessor != null) {
//            postProcessor.invoke(context.getELContext(), new Object[]{builder});
//        }
//
//        OutputStream os = externalContext.getResponseOutputStream();
//        OutputStreamWriter osw = new OutputStreamWriter(os, encodingType);
//        PrintWriter writer = new PrintWriter(osw);
//        writer.write(builder.toString());
//        writer.flush();
//        writer.close();
//    }
//
//    @Override
//    public void export(FacesContext facesContext, List<String> clientIds, String outputFileName, boolean pageOnly, boolean selectionOnly,
//            String encodingType, MethodExpression preProcessor, MethodExpression postProcessor, ExporterOptions options,
//            MethodExpression onTableRender) throws IOException {
//
//        throw new UnsupportedOperationException("Not supported yet.");
//    }
//
//    @Override
//    public void export(FacesContext facesContext, String outputFileName, List<DataTable> tables, boolean pageOnly, boolean selectionOnly,
//            String encodingType, MethodExpression preProcessor, MethodExpression postProcessor, ExporterOptions options,
//            MethodExpression onTableRender) throws IOException {
//
//        throw new UnsupportedOperationException("Not supported yet.");
//    }

    @Override
    protected void preRowExport(DataTable table, Object document) {
        ((StringBuilder) document).append("\t").append(table.getVar()).append("\n");
    }

    @Override
    protected void postRowExport(DataTable table, Object document) {
        ((StringBuilder) document).append("\t").append(table.getVar()).append("\n");
    }

    @Override
    protected void exportCells(DataTable table, Object document) {
        StringBuilder builder = (StringBuilder) document;
        table.getColumns().stream().map((col) -> {
            if (col instanceof DynamicColumn) {
                ((DynamicColumn) col).applyStatelessModel();
            }
            return col;
        }).filter((col) -> (col.isRendered() && col.isExportable())).forEachOrdered((UIColumn col) -> {
            String columnTag = getColumnTag(col);
            try {
                addColumnValue(builder, col.getChildren(), columnTag, col);
            } catch (IOException ex) {
                throw new FacesException(ex);
            }
        });
    }

    protected String getColumnTag(UIColumn column) {
        String headerText = (column.getExportHeaderValue() != null) ? column.getExportHeaderValue() : column.getHeaderText();
        UIComponent facet = column.getFacet("header");
        String columnTag;

        if (headerText != null) {
            columnTag = headerText.toLowerCase();
        } else if (facet != null) {
            columnTag = exportValue(FacesContext.getCurrentInstance(), facet).toLowerCase();
        } else {
            throw new FacesException("No suitable xml tag found for " + column);
        }

        return EscapeUtils.forXmlTag(columnTag);
    }

    protected void addColumnValue(StringBuilder builder, List<UIComponent> components, String tag, UIColumn column) throws IOException {
        FacesContext context = FacesContext.getCurrentInstance();

        builder.append("\t\t").append(tag).append("");

        if (column.getExportFunction() != null) {
            builder.append(EscapeUtils.forXml(exportColumnByFunction(context, column)));
        } else {
            components.stream().filter((component) -> (component.isRendered())).map((component) -> exportValue(context, component)).filter((value) -> (value != null)).forEachOrdered((value) -> {
                builder.append(EscapeUtils.forXml(value));
            });
        }

        builder.append("").append(tag).append("\n");
    }

    protected void configureResponse(ExternalContext externalContext, String filename) {
        externalContext.setResponseContentType("application/pdf");
        externalContext.setResponseHeader("Expires", "0");
        externalContext.setResponseHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
        externalContext.setResponseHeader("Pragma", "public");
        externalContext.setResponseHeader("Content-disposition", ComponentUtils.createContentDisposition("attachment", filename));
        externalContext.addResponseCookie(Constants.DOWNLOAD_COOKIE, "true", Collections.<String, Object>emptyMap());
    }

    @Override
    protected void doExport(FacesContext fc, DataTable dt, ExportConfiguration ec, int i) throws IOException {
        ExternalContext externalContext = fc.getExternalContext();
        configureResponse(externalContext, "reporte.pdf");
        StringBuilder builder = new StringBuilder();

        builder.append("").append(dt.getId()).append("\n");
            exportAll(fc, dt, builder);

        builder.append("").append(dt.getId()).append("");

        dt.setRowIndex(-1);

        OutputStream os = externalContext.getResponseOutputStream();
        OutputStreamWriter osw = new OutputStreamWriter(os, "utf-8");
        try (PrintWriter writer = new PrintWriter(osw)) {
            writer.write(builder.toString());
            writer.flush();
        }
    }
}

