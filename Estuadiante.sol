// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
 
contract Alumnado {
 
    string private Nombre;
    string private Apellido;
    string private Curso;
    address private Docente;
    mapping (string => uint8) private NotasMaterias;
    string[] private NombreMaterias;
 
    constructor(string memory nombre_, string memory apellido_, string memory curso_)
    {
        Nombre = nombre_;
        Apellido = apellido_;
        Curso = curso_;
        Docente = msg.sender;
    }

    function apellido() public view returns (string memory)
    {
        return Apellido;
    }

     function nombre_completo() public view returns (string memory, string memory)
    {
        return (Nombre, Apellido);   
    }

    function curso() public view returns (string memory)
    {
        return Curso;
    }
 
    function set_nota_materia(uint8 nota, string memory materia) public
    {
        require(Docente == msg.sender, "Ingrese un address con permisos suficientes");
        require(nota <= 100 && nota >= 1, "Nota Invalida");
        NotasMaterias[materia] = nota;
        NombreMaterias.push(materia);
    }
 
    function nota_materia(string memory materia) public view returns (uint)
    {
        uint nota = NotasMaterias[materia];  
        return nota;
    }
   
    function aprobo(string memory materia) public view returns (bool)
    {
        require (NotasMaterias[materia] >= 60);
        return true;

  
    }
 
    function promedio() public view returns (uint)
    {
 
        uint cantItems = NombreMaterias.length;
        uint notaParaPromedio;
        uint notaFinal;
 
        for (uint i = 0; i < cantItems; i++){
            notaParaPromedio += NotasMaterias[NombreMaterias[i]];
        }
 
        notaFinal = notaParaPromedio / cantItems;
        return notaFinal;
    }
}
