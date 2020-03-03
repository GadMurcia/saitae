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
package net.delsas.saitae.ax;

import java.io.Serializable;
import net.delsas.saitae.entities.GradoPK;

/**
 *
 * @author delsas
 */
public class MatriculaSeccion implements Serializable {

    private GradoPK pk;
    private Integer matriculaM;
    private Integer matriculaF;
    private Integer retiradosM;
    private Integer retiradosF;
    private Integer sobreEdadM;
    private Integer sobreEdadF;
    private Integer repitenciaM;
    private Integer repitenciaF;
    private Integer reprobadosM;
    private Integer reprobadosF;

    public MatriculaSeccion() {
    }

    public MatriculaSeccion(GradoPK pk, Integer matriculaM, Integer matriculaF, Integer retiradosM, Integer retiradosF, Integer sobreEdadM, Integer sobreEdadF, Integer repitenciaM, Integer repitenciaF, Integer reprobadosM, Integer reprobadosF) {
        this.pk = pk;
        this.matriculaM = matriculaM;
        this.matriculaF = matriculaF;
        this.retiradosM = retiradosM;
        this.retiradosF = retiradosF;
        this.sobreEdadM = sobreEdadM;
        this.sobreEdadF = sobreEdadF;
        this.repitenciaM = repitenciaM;
        this.repitenciaF = repitenciaF;
        this.reprobadosM = reprobadosM;
        this.reprobadosF = reprobadosF;
    }

    public GradoPK getPk() {
        return pk;
    }

    public void setPk(GradoPK pk) {
        this.pk = pk;
    }

    public Integer getMatriculaM() {
        return matriculaM;
    }

    public void setMatriculaM(Integer matriculaM) {
        this.matriculaM = matriculaM;
    }

    public Integer getMatriculaF() {
        return matriculaF;
    }

    public void setMatriculaF(Integer matriculaF) {
        this.matriculaF = matriculaF;
    }

    public Integer getRetiradosM() {
        return retiradosM;
    }

    public void setRetiradosM(Integer retiradosM) {
        this.retiradosM = retiradosM;
    }

    public Integer getRetiradosF() {
        return retiradosF;
    }

    public void setRetiradosF(Integer retiradosF) {
        this.retiradosF = retiradosF;
    }

    public Integer getSobreEdadM() {
        return sobreEdadM;
    }

    public void setSobreEdadM(Integer sobreEdadM) {
        this.sobreEdadM = sobreEdadM;
    }

    public Integer getSobreEdadF() {
        return sobreEdadF;
    }

    public void setSobreEdadF(Integer sobreEdadF) {
        this.sobreEdadF = sobreEdadF;
    }

    public Integer getRepitenciaM() {
        return repitenciaM;
    }

    public void setRepitenciaM(Integer repitenciaM) {
        this.repitenciaM = repitenciaM;
    }

    public Integer getRepitenciaF() {
        return repitenciaF;
    }

    public void setRepitenciaF(Integer repitenciaF) {
        this.repitenciaF = repitenciaF;
    }

    public Integer getReprobadosM() {
        return reprobadosM;
    }

    public void setReprobadosM(Integer reprobadosM) {
        this.reprobadosM = reprobadosM;
    }

    public Integer getReprobadosF() {
        return reprobadosF;
    }

    public void setReprobadosF(Integer reprobadosF) {
        this.reprobadosF = reprobadosF;
    }

    @Override
    public String toString() {
        return "MatriculaSeccion{" + "pk=" + pk + ", matriculaM=" + matriculaM + ", matriculaF=" + matriculaF + ", retiradosM=" + retiradosM + ", retiradosF=" + retiradosF + ", sobreEdadM=" + sobreEdadM + ", sobreEdadF=" + sobreEdadF + ", repitenciaM=" + repitenciaM + ", repitenciaF=" + repitenciaF + ", reprobadosM=" + reprobadosM + ", reprobadosF=" + reprobadosF + '}';
    }
}
