#Host file entries for RMIT Csit servers
class hosts{
  host{ 'jupiter.csit.rmit.edu.au':
    ip => '131.170.5.135',
    host_aliases => 'jupiter',
  }
  
  host { 'saturn.csit.rmit.edu.au':
    ip => '131.170.5.132',
    host_aliases => 'saturn',
  }
  
  host { 'titan.csit.rmit.edu.au':
    ip => '131.170.5.131',
    host_aliases => 'titan',
  }
}
