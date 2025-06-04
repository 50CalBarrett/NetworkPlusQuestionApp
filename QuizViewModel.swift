//
//  QuizViewModel.swift
//  NetworkPlusNew
//
//  Created by NotBatman on 6/3/25.
//

import Foundation

class QuizViewModel: ObservableObject {
    @Published var currentQuestionIndex = 0
    @Published var score = 0
    @Published var selectedAnswers: [String] = []
    @Published var hasAnswered = false
    @Published var showScoreAlert: Bool = false
    @Published var quizFinished: Bool = false
    @Published var wrongStreak = 0
    
    //Question bank based on CompTIA Network+ EXAM Guide, McGraw Hill Mike Meyers series
    let questions: [Question] = [
        
        Question(
            text: "Which layer of the OSI model is responsible for providing error correction?",
            choices: ["Network Layer","Transport Layer","Presentation Layer","Application Layer"],
            correctAnswers:["Presentation Layer"]),
        Question(
            text: "Which layer of the OSI model is responsible for providing flow control?",
            choices: ["Network Layer","Transport Layer","Presentation Layer","Application Layer"],
            correctAnswers:["Transport Layer"]),
        Question(
            text: "Which layer of the OSI model is responsible for providing data encryption?",
            choices: ["Network Layer","Transport Layer","Presentation Layer","Application Layer"],
            correctAnswers:["Transport Layer"]),
        Question(
            text: "Which layer of the OSI model provides end-to-end communication and error correction?",
            choices: ["Application","Transport","Network","Data Link"],
            correctAnswers:["Transport"]),
        Question(
            text: "Which of the following is a common use of an IDS (Intrusion Detection System)?",
            choices: ["Preventing unauthorized access","Encrypting traffic","Monitoring network traffic for suspicious activity","Managing network devices"],
            correctAnswers:["Monitoring network traffic for suspicious activity"]),
        Question(
            text: "What will the command route print return on a Windows system?",
            choices: ["The results of the last tracert","The gateway's router tables","The routes taken by a concurrent connection","The current system's route tables"],
            correctAnswers:["The current system's route tables"]),
        Question(
            text: "When trying to establish symptoms over the phone, what kind of questions should you ask of a novice or confused user?",
            choices: ["You should ask open ended questions and let the user explain the problems in his or her own words","You should ask detailed, close ended question to try and narrow down the possible causes","Leading questions are your best choice for pointing the user in the right direction","None; ask the user to bring the machine in because it is useless to troubleshoot over the phone"],
            correctAnswers:["You should ask open ended questions and let the user explain the problems in his or her own words"]),
        Question(
            text: "What are the four components of fiber-optic cabling? (select 4)",
            choices: ["the core", "cladding", "EMI shield", "buffer material", "insulating jacket", "channel"],
            correctAnswers: ["the core", "cladding", "buffer material", "insulating jacket"]),
        Question(
            text: "Which layer doesn't care what data goes through it just moves the data from one system to another system?",
            choices: ["Layer-4 transport", "Layer-7 application", "Layer-5 session","Layer-1 physical"],
            correctAnswers: ["Layer-1 physical"]),
        Question(
            text: "Which term most closely describes collecting all of the network clients or servers that need the same security policies?",
            choices: ["Hardening","Segmentation","Spoofing","Posturing"],
            correctAnswers:["Segmentation"]),
        Question(
            text: "Which of the following is a tool to prevent ARP cache poisoning?",
            choices: ["DHCP","DAI","Edge firewall","DNS snooping"],
            correctAnswers:["DAI"]),
        Question(
            text: "Which layer of the OSI model is responsible for data transmission over a network?",
            choices: ["Network Layer","Transport Layer","Presentation Layer","Application Layer"],
            correctAnswers:["Network Layer"]),
        Question(
            text: "Which layer of the OSI model is responsible for end-to-end data delivery?",
            choices: ["Network Layer","Transport Layer","Presentation Layer","Application Layer"],
            correctAnswers:["Transport Layer"]),
        Question(
            text: "What does DHCP stand for?",
            choices: ["Dynamic Host Configuration Protocol","Data Host Communication Protocol","Domain Host Configuration Protocol","Dynamic Hypertext Configuration Protocol"],
            correctAnswers:["Dynamic Host Configuration Protocol"]),
        Question(
            text: "What is the maximum transmission speed of 1000BASE-T?",
            choices: ["10Mbps","100Mbps","1000Mbps","10Gbps"],
            correctAnswers:["1000Mbps"]),
        Question(
            text: "Which technology enables a private optical network within a MAN?",
            choices: ["DSL","DOCSIS","Metro Ethernet","VPN"],
            correctAnswers:["Metro Ethernet"]),
        Question(
            text: "Which architecture enable fiber-to-the-home to connect the neighborhood switch to the premises?",
            choices: ["DOCSIS","HSPA+","PON","PPPoE"],
            correctAnswers:["PON"]),
        Question(text: "Which layer are datagrams created at?",
                 choices: ["Layer-4 transport","Layer-7 application","Layer-5 session","Layer-1 physical"],
                 correctAnswers: ["Layer-4 transport"]),
        Question(
            text: "When a serving computer receives a request for some data, it must be able to _____  so it can fit into a _____?",
            choices: ["preserve it; byte","preserve it; packet","concatenate; frame","chop it up; packet"],
            correctAnswers: ["chop it up; packet"]),
        Question(
            text:"A NIC sends data in discrete chunks called__?",
            choices: ["frames","packets","bytes","bits"],
            correctAnswers: ["frames"]),
        Question(
            text:"A MAC address of which of the following begins a frame?",
            choices: ["Receiving system","Sending system","Network","Router"],
            correctAnswers: ["Receiving system"]),
        Question(
            text: "Which statements about subnet mask are true?(select 2)",
            choices: ["Every network client has a unique subnet mask","Every client on a network shares the same subnet mask","A subnet mask consists of a string of zeros followed by a string of ones.","A subnet mask consists of a string of ones followed by a string of zeros."],
            correctAnswers:["Every client on a network shares the same subnet mask","A subnet mask consists of a string of ones followed by a string of zeros."]),
        Question(
            text: "If you see some traffic running on UDP ports 1812 and 1813, what AAA standard is running?",
            choices: ["PPP","RADIUS","MS-CHAP","TACACS+"],
            correctAnswers:["RADIUS"]),
        Question(
            text: "Which authentication standard is highly time sensitive?",
            choices: ["PAP","RADIUS","802.1X","Kerberos"],
            correctAnswers:["Kerberos"]),
        Question(
            text: "Which VPN technology enable direct connections between satellite locations?",
            choices: ["PPTP VPN","IPsec VPN","SSL VPN","DMVPN"],
            correctAnswers:["DMVPN"]),
        Question(
            text: "Which of the following is a protocol commonly used with today's VPNs?",
            choices: ["PPTP","L2Tp","IPsec","PPPoE"],
            correctAnswers:["IPsec"]),
        Question(
            text: "Which of the following tools is used to troubleshoot network connectivity issues?",
            choices: ["ping","tcpdump","netstat","traceroute"],
            correctAnswers:["ping"]),
        Question(
            text: "Which of the following layers of the OSI model is responsible for flow control and error correction?",
            choices: ["Physical","Data Link","Network","Transport"],
            correctAnswers:["Transport"]),
        Question(
            text: "Which of the following IP addresses is a loopback address?",
            choices: ["127.0.0.1","192.168.1.1","10.0.0.1","255.255.255.255"],
            correctAnswers:["127.0.0.1"]),
        Question(
            text: "What is the maximum distance for 100BASE-TX Ethernet?",
            choices: ["100 meters","200 meters","500 meters","1000 meters"],
            correctAnswers:["100 meters"]),
        Question(
            text: "What is CWDM(course wavelength division multiplexing)?",
            choices: ["A technology that relies on single wavelengths of light to carry a fast signal over short distances.","A technology that relies on multiple wavelengths of light to carry a fast signal over short distances.","A technology that relies on single wavelengths of light to carry a fast signal over long distances.","A technology that relies on multiple wavelengths of light to carry a fast signal over long distances."],
            correctAnswers: ["A technology that relies on multiple wavelengths of light to carry a fast signal over long distances."]),
        Question(
            text: "A metro ethernet network creates a secure, private network within a city, using fiber optic cabling and ethernet technology. What does CompTIA referred to this networking technology as?",
            choices: ["Metro-VPN","Metro-optical","Metro-WAN","Metro-organization"],
            correctAnswers: ["Metro-optical"]),
        Question(
            text:"What Windows utility do you use to find the MAC address for a system?",
            choices: ["ipconfig /all","nslookup","ping","tracert"],
            correctAnswers: ["ipconfig /all"]),
        Question(
            text: "A MAC address is known as a(n)__ address.",
            choices: ["IP","logical","physical","virtual"],
            correctAnswers: ["physical"]),
        Question(
            text: "LAN stands for_____",
            choices: ["local area network","local access network","limited authority network","latency amplification network"],
            correctAnswers: ["local area network"]),Question(
                text: "WAN stands for______",
                choices: ["wide area network","work area network","world area network","None of the above "],
                correctAnswers: ["wide area network"]),
        Question(
            text: "TCP/IP enables you to interconnect multiple LANs into a _______",
            choices: ["WAN(work area network)","WAN(world area network)","None of the above ","WAN(wide area network)"],
            correctAnswers: ["WAN(wide area network)"]),
        Question(
            text: "Which of the following network technologies use UTP cabling in a star topology?",
            choices: ["Crosstalk","Fiber optics","1000BASE-SX","1000BASE-T"],
            correctAnswers:["1000BASE-T"]),
        Question(
            text: "Your first day on the job, you get a call from the owner complaining that her network connection is down. A quick check of the central switch verifies that it's in good working order, as is the boss's PC. As luck would have it, your supervisor calls at just that time and tells you not to worry; she'll be by in a jiffy with her TDR to help root out the problem. What is she talking about?",
            choices: ["Tune-domain resonator, her network tone generator","Time-detuning resonator. her network testor","Time-domain reflectometer, her network tester","Time-detail resource, her network schematic"],
            correctAnswers:["Time-domain reflectometer, her network tester"]),
        Question(
            text: "What is the maximum distance for 1000BASE-LX without repeaters?",
            choices: ["1 mile","2500m","20,000ft","5000m"],
            correctAnswers:["5000m"]),
        Question(
            text: "Which protocol operates at the transport layer of the OSI model?",
            choices: ["IP","UDP","Ethernet","FTP"],
            correctAnswers:["UDP"]),
        Question(
            text:"What is the purpose of a collision domain?",
            choices: ["To prevent data collisions","To prevent MAC collisions","To prevent FCS collisions","To prevent physical collisions"],
            correctAnswers:["To prevent data collisions"]),
        Question(
            text:"What is the purpose of a broadcast domain?",
            choices: ["To prevent data collisions","To prevent MAC collisions","To prevent FCS collisions","To prevent physical collisions"],
            correctAnswers:["To prevent data collisions"]),
        Question(
            text: "Which layer of the OSI model is responsible for MAC address resolution?",
            choices: ["Network Layer","Transport Layer","Presentation Layer","Application Layer"],
            correctAnswers:["Network Layer"]),
        Question(
            text: "Which layer of the OSI model is responsible for ensuring data integrity?",
            choices: ["Network Layer","Transport Layer","Presentation Layer","Application Layer"],
            correctAnswers:["Presentation Layer"]),
        Question(
            text: "Devices using which of the following protocols form a mesh network using the 908- and 916-MHz band?",
            choices: ["802.11 Wi-Fi","Bluetooth","Zigbee","Z-Wave"],
            correctAnswers:["Z-Wave"]),
        Question(
            text: "Connected Bluetooth devices create what kind of network?",
            choices: ["CAN","LAN","MAN","PAN"],
            correctAnswers:["PAN"]),
        Question(
            text: "RTP runs on which ports?",
            choices: ["ICMP ports 5004, 5005","UDP ports 5004, 5005","TCP ports 5004, 5005","Undefined UDP ports"],
            correctAnswers:["Undefined UDP ports"]),
        Question(
            text: "What is the last step in the trouble shooting process?",
            choices: ["Implementing the solution","Testing the solution","Documenting the solution","Closing the help ticket"],
            correctAnswers:["Documenting the solution"]),
        Question(
            text: "One of your users calls you with a complaint that he can't reach the sit www. google. com. You try and access the site and discover you can't connect either but you can ping the site with its IP address. What is the most probable culprit?",
            choices: ["The workgroup switch is down","Google is down","The gateway is down","The DNS server is down"],
            correctAnswers:["The DNS server is down"]),
        Question(
            text: "Which of the following is a benefit of using fiber optic cables over copper cables?",
            choices: ["Higher speed","Less prone to interference","Longer distance transmission","All of the above"],
            correctAnswers:["All of the above"]),
        Question(
            text: "Which of the following is used to separate collision domains in a network?",
            choices: ["Hub","Switch","Router","Bridge"],
            correctAnswers:["Switch"]),
        Question(
            text: "What is the primary function of a load balancer?",
            choices: ["To encrypt data","To monitor bandwidth usage","To distribute traffic across multiple servers","To store backups"],
            correctAnswers:["To distribute traffic across multiple servers"]),
        Question(
            text: "Which of the following protocols operates on port 21?",
            choices: ["FTP","SMTP","HTTP","SSH"],
            correctAnswers:["FTP"]),
        Question(
            text: "Which layer of the OSI model keeps track of a system's connections to send the right response to the right computer?",
            choices: ["Network Layer","Transport Layer","Presentation Layer","Application Layer"],
            correctAnswers:["Presentation Layer"]),
        Question(
            text:"Which of the following is a type of network topology?",
            choices:["in-line","connected","system","ring"],
            correctAnswers:["ring"]),
        Question(
            text: "Of the following, which would most likely have an individual control system implementation?",
            choices: ["An apartment complex","A coffee shop","A city park","A bottling company"],
            correctAnswers:["A bottling company"]),
        Question(
            text: "H.323 uses which TCP port number?",
            choices: ["5004","5060","2427","1720"],
            correctAnswers:["1720"]),
        Question(
            text: "You have just had DSL installed at your house. Although the Internet connection is fast, your phones no longer work. What is the problem?",
            choices: ["The installer failed to install the POTs filters on the phones. ","Nothing; the phones can't function at the same time as the Internet.","The house phone lines can't handle the bandwidth of both the phone and DSL.","TheDSL modem is missing the filter and is causing line interference."],
            correctAnswers:["The installer failed to install the POTs filters on the phones. "]),
        Question(
            text: "What protocol do cable modems use?",
            choices: ["ACMSIS","CMAS","DOCSIS","CCSIP"],
            correctAnswers:["DOCSIS"]),
        Question(
            text: "What is SONET used for?",
            choices: ["Short-distance, high-speed, fiber-optic transmission","Long-distance, high-speed, fiber-optic transmission","Short-distance, low-speed, copper-cable transmission"],
            correctAnswers:["Long-distance, high-speed, fiber-optic transmission"]),
        Question(
            text: "Which statements about SSH and Telnet are true? (select 2)",
            choices: ["Windows comes with preinstalled SSH and Telnet clients","SSH is more secure that Telnet because it encrypts data","Telnet is a command-line tool, whereas SSH is a GUI tool","SSH uses port 22, and Telnet uses port 23"],
            correctAnswers:["SSH is more secure that Telnet because it encrypts data","SSH uses port 22, and Telnet uses port 23"]),
        Question(
            text: "Why might you use the netstat utility?",
            choices: ["To see the route an IP packet takes across multiple routers","To see your IP address and configuration details","To see the endpoints of your sessions","To issue commands to a remote server"],
            correctAnswers:["To see the endpoints of your sessions"]),
        Question(
            text: "What was the solution for companies that supplied Internet services to diagnose faults in the system when connections are blocks or even miles away?",
            choices: ["An NIU called a ‘testjack","An NIU called a ‘smartjack’","An NIU called a ‘fastjack","An NIU called a ‘jackhammer"],
            correctAnswers: ["An NIU called a ‘smartjack’"]),
        Question(
            text: "what are the primary types of copper cabling? (select two)",
            choices: ["coaxial","ethernet","twisted pair","fiber optic"],
            correctAnswers: ["coaxial","twisted pair"]),
        Question(
            text: "Bus topology network traffic _____.",
            choices: ["was undeliverable ","went direct to the intended recipient","went out on the whole bus.","sent 2000 bits a second"],
            correctAnswers: ["went out on the whole bus."]),
        Question(
            text: "_____ network connected all computers on the network with a ring of cable.",
            choices: ["ring topology","bus topology","star topology","circle topology"],
            correctAnswers: ["ring topology"]),
        Question(
            text: "____ is defined as ____",
            choices: ["NFVI, a network architecture (a collection of patterns that generally— not specifically —describe how to design a network that achieves a specific set of goals","NFV; a network architecture (a collection of patterns that generally— not specifically —describe how to design a network that achieves a specific set of goals","ISP, a delivery service for virtual networks(generally hosted by AT&T, Verizon, T-Mobile or some other provider)","None of the above."],
            correctAnswers: ["NFV; a network architecture (a collection of patterns that generally— not specifically —describe how to design a network that achieves a specific set of goals"]),
        Question(
            text: "Which type of cable is commonly used for Ethernet connections?",
            choices: ["Coaxial","Fiber optic","Twisted pair","HDMI"],
            correctAnswers:["Twisted pair"]),
        Question(
            text: "What does DNS stand for?",
            choices: ["Dynamic Network Service","Domain Name System","Data Network Source","Direct Network Service"],
            correctAnswers:["Domain Name System"]),
        
        
        Question(
            text: "What is the maximum length of a USB 3.0 cable?",
            choices: ["3 meters","5 meters","7 meters","10 meters"],
            correctAnswers:["5 meters"]),
        Question(
            text: "Which of the following wireless standards supports speeds up to 1.3Gbps?",
            choices: ["802.11b","802.11g","802.11n","802.11ac"],
            correctAnswers:["802.11ac"]),
        Question(
            text: "The _____ is where network functions(firewalls, load, balancers, routers, and so on) run that are appropriately called virtualized network functions(VNFs)",
            choices: ["NVFI","DNS","TCP/IP","NFVA"],
            correctAnswers: ["NFVI"]),
        Question(
            text: "Where does a DNS server store the IP addresses and FQDNs for the computers within a domain?",
            choices: ["Forward lookup zone","Canonical zone","MX record","SMTP record"],
            correctAnswers:["Forward lookup zone"]),
        Question(
            text: "Any encryption that uses the same key for encryption and decryption is called?",
            choices: ["Encoded key","Symmetric key","Single key","Synthetic key"],
            correctAnswers:["Symmetric key"]),
        Question(
            text: "UDP header stand stands for_______ ",
            choices: ["unit development protocol header","unit deliver protocol header","user datagram protocol header","user dataset protocol header "],
            correctAnswers: ["user datagram protocol header"]),
        Question(
            text: "the data at the transport layer is called ________.",
            choices: ["bits","packets","segments","partitions"],
            correctAnswers: ["segments"]),
        Question(
            text: "Which of the following is an example of a MAC address?",
            choices: ["0-255","00-50-56-A3-04-0C","127.0.0.1","255.255.255.255"],
            correctAnswers: ["00-50-56-A3-04-0C"]),
        Question(
            text: "Which of the following topologies require termination?",
            choices:["Star","Bus","Mesh","Ring"],
            correctAnswers: ["Bus"]),
        Question(
            text: "CAT 7a rated cables, have a maximum frequency of ___ and max bandwidth of ____",
            choices: ["1000 MHz; 40-100Gbps","1000 MHz; 100-200Gbps","2000 MHz; 25-40Gbps","2000 MHz; 10Gbps"],
            correctAnswers: ["1000 MHz; 40-100Gbps"]),
        Question(
            text: "CAT 8 rated cables, have a maximum frequency of ___ and max bandwidth of ____",
            choices: ["2000 MHz; 25-40Gbps","2000 MHz; 10Gbps","2000 MHz; 1Gbps","2000 MHz; 10Mbps"],
            correctAnswers: ["2000 MHz; 25-40Gbps"]),
        Question(
            text: "______ refers to, in virtualization, a layer of programming that creates supports and manages a virtual machine. Also known as a VMM(virtual machine monitor)",
            choices: ["IMAP(Internet message access protocol)","hypertext","hotspot,","hypervisor"],
            correctAnswers: ["hypervisor"]),
        Question(
            text: "Dan lives in the countryside 140 miles from any major metropolitan area, he decided to change from in office management of his company and needs to be able to use a VPN from his house. What type of ISP should Dan use?",
            choices: ["satellite","broadband","ethernet","Dan should just go to work like everyone else."],
            correctAnswers: ["satellite"]),
        Question(
            text: "Which IEEE protocol enables port bonding?",
            choices: ["802.1Q","LACP","PAgP","ZACP"],
            correctAnswers:["LACP"]),
        Question(
            text: "Allison wants to add a layer of protection to her network. She wants to actively monitor all network traffic and act immediately to stop any attacks. What should she install? ",
            choices: ["Firewall","IDS","IPS","NIDS"],
            correctAnswers:["NIDS"]),
        Question(
            text: "Which of the following data center implementation connects access layer to distribution layer to core layer?",
            choices: ["North-south traffic flow","Spine-and-leaf architecture","Three-tiered architecture","Top-of-rack switching"],
            correctAnswers:["Three-tiered architecture"]),
        Question(
            text: "Which SAN feature provides high availability through more than one connection between the server and the SAN? ",
            choices: ["Fibre Channel","iSCSI","Multipathing","Multiplaning"],
            correctAnswers:["Multipathing"]),
        Question(
            text: "Which of the following topologies allows devices to communicate through a central device?",
            choices: ["Bus","Ring","Star","Mesh"],
            correctAnswers:["Star"]),
        Question(
            text: "What is the function of the OSI Layer 3?",
            choices: ["Data link","Session","Network","Transport"],
            correctAnswers:["Network"]),
        Question(
            text: "Which layer of the OSI model is responsible for providing data compression?",
            choices: ["Network Layer","Transport Layer","Presentation Layer","Application Layer"],
            correctAnswers:["Transport Layer"]),
        Question(
            text: "Which layer of the OSI model is responsible for providing user-level services?",
            choices: ["Network Layer","Transport Layer","Presentation Layer","Application Layer"],
            correctAnswers:["Application Layer"]),
        Question(
            text: "Which of the following is a valid IPv4 address?",
            choices: ["192.168.1.256","255.255.255.0","172.16.0.1","300.300.300.300"],
            correctAnswers:["172.16.0.1"]),
        Question(
            text: "What does the term 'SSID' refer to?",
            choices: ["Service Set Identifier","Secure Signal Identifier","Server Set Identifier","System Set Identifier"],
            correctAnswers:["Service Set Identifier"]),
        Question(
            text: "What type of device operates at the data link layer of the OSI model?",
            choices: ["Router","Switch","Firewall","Hub"],
            correctAnswers:["Switch"]),
        Question(
            text: "Which of the following is known as a basic service sat in infrastructure mode?",
            choices: ["A WAP","A WPA","A RADIUS server","A TKIP"],
            correctAnswers:["A WAP"]),
        Question(
            text: "What feature enabled 802.11n networks to minimize dead zone space?",
            choices: ["Channel bonding","FIFO","MIMO","Transit beam-forming"],
            correctAnswers:["Transit beam-forming"]),
        Question(
            text: "A physical DSL connection manifest as just another Public Switched Telephone Network (PSTN) connection, using _____ jacks.",
            choices: ["RG-45","RG-6","RJ-11","8P8C"],
            correctAnswers: ["RJ-11"]),
        Question(
            text: "The purchase of dedicated connections like _____ from telecommunication companies enables he's organizations to secure network communications, but no fear of hackers accessing network resources.",
            choices: ["server space","VPNs","leased lines","None of the above."],
            correctAnswers: ["leased lines"]),
        Question(
            text: "Star-bus topology is a version of _____ topology.(choose the best answer)",
            choices: ["paired","select","favored","hybrid"],
            correctAnswers: ["hybrid"]),
        Question(
            text: "_____ is topology referred to as, how the cables physically look.",
            choices: ["logical","physical","practical","theoretical"],
            correctAnswers: ["physical"]),
        Question(
            text: "A UDP header contains______",
            choices: ["source port, destination port, type, checksum","source port, type, length, checksum","source port, length,  checksum","source port, destination port, length, checksum"],
            correctAnswers: ["source port, destination port, length, checksum"]),
        Question(
            text: "HTTP stand stands for _____.",
            choices: ["host-text transfer protocol","hypertext transfer protocol","hyper type transfer protocol ","how to train people"],
            correctAnswers: ["hypertext transfer protocol"]),
        Question(
            text: "Which unique number uses dotted decimal notation based on 48 bit numbers each eight bit ranging from 0 to 255?",
            choices: ["IPv4 prefixed with /48","IPv6 prefixed with /48","MAC address prefixed with /48","Cloud Space prefixed with /48"],
            correctAnswers: ["IPv4 prefixed with /48"]),
        Question(
            text: "Which one represents a typical IP address?",
            choices: ["255.255.255.255:","123.255.255.255:","1.1.1.1:","192.168.4.232"],
            correctAnswers: ["192.168.4.232"]),
        Question(
            text: "A Frame ends with a special bit called a Frame Check Sequence(FCS)",
            choices: ["Cycles datat across the network", "Verifies the MAC addresses are correct", "Ensures the frame is not corrupted", "Verifies the IP addresses are correct"],
            correctAnswers: ["Ensures the frame is not corrupted"]),
        Question(
            text:"Star-bus is an example of a __ topology.",
            choices:["transitional","system","hybrid","rampant"],
            correctAnswers: ["hybrid"]),
        Question(
            text: "The ANSI/TIA-568.3D prefix for multimode fiber is _____",
            choices: ["LC","CT","OS","OM"],
            correctAnswers: ["OM"]),
        Question(
            text: "which port does HTTP use?",
            choices: ["100","80","20","21"],
            correctAnswers: ["80"]),
        Question(
            text: "what types of storage devices are in a traditional data center, and are the main technologies used to store data in data centers.",
            choices: ["Tapes and HHD drives","CD and DVD drives","optical and array drives","HHD and SSD drives"],
            correctAnswers: ["HHD and SSD drives"]),
        Question(
            text: "hard drive storage is broken up into tiny sectors, also known as _____.",
            choices: ["blocks","chunks","frames","data-sets"],
            correctAnswers: ["blocks"]),
        Question(
            text: "What are patch cables used for? (select 2)",
            choices: ["To connect different telecommunications rooms.","To connect the patch panel to the switch","They are used as a crossover cable","To connect PC's to outlet boxes"],
            correctAnswers:["To connect the patch panel to the switch","To connect PC's to outlet boxes"]),
        Question(
            text: "What does a subnet mask define?",
            choices: ["The IP address range","The route taken by packets","The number of available ports","The network and host portion of an IP address"],
            correctAnswers:["The network and host portion of an IP address"]),
        Question(
            text: "Which of the following is a characteristic of IPv6?",
            choices: ["128-bit address length","32-bit address length","64-bit address length","48-bit address length"],
            correctAnswers:["128-bit address length"]),
        Question(
            text: "Which protocol is used to securely log into a remote system?",
            choices: ["HTTP","FTP","SSH","Telnet"],
            correctAnswers:["SSH"]),
        Question(
            text: "What two device together enable you to pick a single cable out of a stack of cables? (select 2)",
            choices: ["Tone aggregator","Tone binder","Tone generator","Tone probe"],
            correctAnswers:["Tone generator","Tone probe"]),
        Question(
            text: "Which record type defines the primary name server in charge of a zone?",
            choices: ["A","AAAA","NS","SOA"],
            correctAnswers:["SOA"]),
        Question(
            text: "What command do you run to see the DNS cache on a Windows system?",
            choices: ["ping /showdns","ipconfig /showdns","ipconfig /displaydns","ping /displaydns"],
            correctAnswers:["ipconfig /displaydns"]),
        Question(
            text: "Which last-mile technology enables bidirectional throughput of up to 1 Gbps?",
            choices: ["Cable","DSL","Fiber","4G"],
            correctAnswers:["Fiber"]),
        Question(
            text: "Aaron wants to connect his office to the Internet, but it's an historic building so he can't run wires. Which option would give him the most throughput?",
            choices: ["Cable","DSL","Fiber","Satellite"],
            correctAnswers:["Satellite"]),
        Question(
            text: "Which Windows utility displays open ports on a host?",
            choices: ["netstat","ping","ipconfig","nbtstat"],
            correctAnswers:["netstat"]),
        Question(
            text: "Which of the following protocols are notorious for cleartext passwords?(select 2)",
            choices: ["SSH","Telnet","HTTPS","POP3"],
            correctAnswers:["Telnet","POP3"]),
        Question(
            text: "Which of the following is a valid IPv6 address?",
            choices: ["192.168.1.1","2001:0db8:85a3:0000:0000:8a2e:0370:7334","172.16.0.1","300.300.300.300"],
            correctAnswers:["2001:0db8:85a3:0000:0000:8a2e:0370:7334"]),
        Question(
            text: "Which command is used to test connectivity between two hosts in a network?",
            choices: ["ping","traceroute","netstat","nslookup"],
            correctAnswers:["ping"]),
        Question(
            text: "Which layer of the OSI model is responsible for error detection and correction?",
            choices: ["Network Layer","Transport Layer","Presentation Layer","Application Layer"],
            correctAnswers:["Presentation Layer"]),
        Question(
            text: "Which layer of the OSI model is responsible for providing reliable data delivery?",
            choices: ["Network Layer","Transport Layer","Presentation Layer","Application Layer"],
            correctAnswers:["Transport Layer"]),
        Question(
            text: "What type of attack involves sending fake data to a target in order to exhaust its resources?",
            choices: ["DoS","Phishing","Man-in-the-middle","ARP Spoofing"],
            correctAnswers:["DoS"]),
        Question(
            text: "Which of the following devices operates at the OSI Layer 2?",
            choices: ["Switch","Router","Hub","Bridge"],
            correctAnswers:["Switch"]),
        Question(
            text: "Which of the following is not a potential advantage of virtual machine over a physical machine?",
            choices: ["Minimize downtime","Consolidate multiple physical machines","Automatic backups","Allocate resources more efficiently"],
            correctAnswers:["Automatic backups"]),
        Question(
            text: "Janelle wants to start a new photo-sharing service for real pictures of Bigfoot, but she doesn't own any servers. How can she quickly create a new server to run her service? ",
            choices: ["Public cloud","Private cloud","Community cloud","Hybrid cloud"],
            correctAnswers:["Public cloud"]),
        Question(
            text: "The ____ for TCP at Layer-4, is a segment that gets encapsulated into an IP packet. (The____ four Layer-3.)",
            choices: ["receiver MAC address","PDU(protocol data unit)","FCS(file checksum)","host domain name"],
            correctAnswers: ["PDU(protocol data unit)"]),
        Question(
            text: "Going from one network technology to another can cause a packet or frame to _____ the MTU for the receiving system",
            choices: ["shutdown","exceed","delay","support"],
            correctAnswers: ["exceed"]),
        Question(
            text: "Which device handles traffic using Mac addresses?",
            choices: ["Router","Hub","Switch","Central Box"],
            correctAnswers: ["Switch"],),
        Question(
            text: "Which layer has containers called packets and are addressed so they can go from one network to another?",
            choices: ["Layer-4 transport","Layer-7 application","Layer-3 network","Layer-1 physical"],
            correctAnswers: ["Layer-3 network"],),
        Question(
            text: "In the header(MAC addresses and type) starts the frame, followed by the______, followed by the trailer.",
            choices: ["source MAC address","TCP/IP","partition(encrypted data segment)","payload(whatever is encapsulated in the frame)"],
            correctAnswers: ["payload(whatever is encapsulated in the frame)"]),
        Question(
            text: "Which of the following is used to configure a device's IP address automatically?",
            choices: ["DHCP","DNS","NAT","ARP"],
            correctAnswers:["DHCP"]),
        Question(
            text: "Which of the following is the main purpose of network segmentation?",
            choices: ["To reduce network traffic","To increase security","To improve speed","To simplify routing"],
            correctAnswers:["To increase security"]),
        Question(
            text: "What is the purpose of a NIC?",
            choices: ["To send data","To receive data","To both send and receive data"],
            correctAnswers:["To both send and receive data"]),
        Question(
            text: "Which of the following is the valid fully reduced version of the address 2001:0489:000F:0000:0000:1f00:0000:000d?",
            choices: ["2001:489:f::1f:0:d","2001:489:f::1f00::d","2001:0489:000f::1F00:0000:000d","2001:489:f::1f00:0:d"],
            correctAnswers:["2001:489:f::1f00:0:d"]),
        Question(
            text: "______ is way faster than______ but less reliable.",
            choices: ["TCP, IP","MAP, MAC","TDP, UCP","UDP, TCP"],
            correctAnswers: ["UDP, TCP"]),
        Question(
            text: "if you plan to set up a wireless network for a large number of computing devices, or you need to have centralized control over the wireless network, use ______",
            choices: ["infrastructure mode","management mode","select mode","server-only mode"],
            correctAnswers: ["infrastructure mode"]),
        Question(
            text: "a single WAN servicing a given area is called a BSS, extending this area by adding more access points is called_____",
            choices: ["PAN","CSS","TSL","ESS"],
            correctAnswers: ["ESS"]),
        Question(
            text: "infrastructure mode is better suited to business networks or networks that need to _____",
            choices: ["share dedicated resources, such as Internet connections and centralized databases","","",""],
            correctAnswers: ["share dedicated resources, such as Internet connections and centralized databases"]),
        Question(
            text: "A ______ creates a secure, private network within a city, using fiber-optic cabling and ethernet technology",
            choices: ["MAN","LAN","DAN","WAN"],
            correctAnswers: ["MAN"]),
        Question(
            text: "A _____ does not use the Internet to connect and thus doesn't require security.",
            choices: ["WAN(wide are network)","SAN(storage area network)","PAN(primary area network","MAN(metropolitan area network)"],
            correctAnswers: ["MAN(metropolitan area network)"]),
        Question(
            text: "you can refer to a campus area network(CAN) a bunch of interconnected LANs on a campus as a ____",
            choices: ["subset","collective","WAN","PAN"],
            correctAnswers: ["WAN"]),
        Question(
            text: "A number between ____ is called a______, is a logical value assigned to specific applications or services.",
            choices: ["0-255; port","443-1024; port","1-65536; server","1-65536; port"],
            correctAnswers: ["1-65536; port"]),
        Question(
            text: "Which layer adds port and length numbers plus a checksum as a header with data to create a UDP datagram?",
            choices: ["Layer-4 transport","Layer-7 application","Layer-5 session","Layer-1 physical"],
            correctAnswers: ["Layer-4 transport"]),
        Question(
            text: "Of the topologies listed, which is the most fault-tolerant?",
            choices: ["Point-to-point","Bus","Star","Ring"],
            correctAnswers: ["Star"]),
        Question(
            text: "What term is used to describe the interconnectivity of network components?",
            choices: ["Segmentation","Map","Topology","Protocol"],
            correctAnswers: ["Topology"]),
        Question(
            text: "CAT 5 rated cables, have a maximum frequency of _____ and max bandwidth of_____",
            choices: ["500 MHz; 10Gbps","600 MHz; 10Gbps","100 MHz; 100 Mbps","100 MHz; 1 Gbps"],
            correctAnswers: ["100 MHz; 100 Mbps"]),
        Question(
            text: "CAT 5e rated cables, have a max frequency of _____ and a max bandwidth of ____.",
            choices: ["100 MHz; 1 Gbps","100 MHz; 100 Mbps","500 MHz; 10Gbps","600 MHz; 10Gbps"],
            correctAnswers: ["100 MHz; 1 Gbps"]),
        Question(
            text: "What does nslookup do?",
            choices: ["Retrieves the name space for the network","Queries DNS for the IP address of the supplied host name","Performs a revers IP lookup","ists the current running network services on localhost"],
            correctAnswers:["Queries DNS for the IP address of the supplied host name"]),
        Question(
            text: "What is WireShark?",
            choices: ["Protocol analyzer","Packet sniffer","Packet analyzer","All of the above"],
            correctAnswers:["All of the above"]),
        Question(
            text: "Which type of cable is typically used for telephone lines?",
            choices: ["Fiber optic","Twisted pair","Coaxial","HDMI"],
            correctAnswers:["Twisted pair"]),
        Question(
            text: "What is the primary purpose of a proxy server?",
            choices: ["To route data packets between networks","To serve as an intermediary between clients and servers","To monitor incoming and outgoing traffic","To manage email traffic"],
            correctAnswers:["To serve as an intermediary between clients and servers"]),
        Question(
            text:"What is the maximum number of hops that a frame can take through a network?",
            choices: ["1","2","3","4"],
            correctAnswers:["4"]),
        Question(
            text:"Which of the following is NOT a type of collision?",
            choices: ["Physical collision","Data collision","MAC collision","FCS collision"],
            correctAnswers:["Data collision"]),
        Question(
            text: "What is the primary function of a firewall?",
            choices: ["To route packets to the correct IP","To block unauthorized access to a network","To monitor network performance","To encrypt network traffic"],
            correctAnswers:["To block unauthorized access to a network"]),
        Question(
            text: "Which protocol is used to send email from a client to a mail server?",
            choices: ["SMTP","IMAP","POP3","HTTP"],
            correctAnswers:["SMTP"]),
        Question(
            text: "Which of the following best describes the practice of increasing the capacity of a service or application deployed in a private cloud by adding extra instances in a public cloud?",
            choices: ["Cloud bursting","Elasticity","Flexibility","Orchestration"],
            correctAnswers:["Cloud bursting"]),
        Question(
            text: "What enables two VMs hosted on the same physical machine to communicate without leaving the machine?",
            choices: ["Virtual firewall","Virtual LAN","Virtual PBX","Virtual switch"],
            correctAnswers:["Virtual switch"]),
        Question(
            text: "Eric sits down at a client's Windows Computer that's having some network connectivity issues. He wants to start troubleshooting by viewing both the system's IP address and MAC address. What command should he use?",
            choices: ["ifconfig","ip addr","ipconfig","ipconfig /all"],
            correctAnswers:["ipconfig /all"]),
        Question(
            text: "Which of the following describe IPv4?(select 3)",
            choices: ["Uses decimal, not hexadecimal numbers","Uses periods, not colons, as separators","Uses four OCTETs","Uses eight sets of characters"],
            correctAnswers:["Uses decimal, not hexadecimal numbers","Uses periods, not colons, as separators","Uses four OCTETs"]),
        Question(
            text: "You can use the protocol suite and a switch to connect a handful of computers in the same place into a______",
            choices: ["CAN","LAN","PAN","DAN"],
            correctAnswers: ["LAN"]),
        Question(
            text: "WAN stands for what kind of network?",
            choices: ["wide area network","windy area network","wild area network","wasted at noon"],
            correctAnswers: ["wide area network"]),
        Question(
            text: "CAT 7 rated cables, have a maximum frequency of ___ and max bandwidth of ____",
            choices: ["1000 MHz; 40-100Gbps","600 MHz; 10Gbps","250 MHz; 10Gbps","100 MHz; 1 Gbps"],
            correctAnswers: ["600 MHz; 10Gbps"]),
        Question(
            text: "TIA/ EIA-568B  wiring standard pin 3 and 6 are what colors?",
            choices: ["Orange/White; Orange","Blue/White; Blue","Brown/White; Brown","Green/White; Green"],
            correctAnswers: ["Green/White; Green"]),
        Question(
            text: "Coaxial Cables all have a(n)__ rating.",
            choices: ["Resistance","Watt","Speed","Ohm"],
            correctAnswers: ["Ohm"]),
        Question(
            text: "Which of the following is a type of coaxial cable?",
            choices: ["Rj-45","RG-6","BNC","Barrel"],
            correctAnswers: ["RG-6"]),
        Question(
            text: "CAT 6a rated cables, have a maximum frequency of ___ and max bandwidth of ____",
            choices: ["100 MHz; 1 Gbps","500 MHz; 10Gbps","600 MHz; 10Gbps","2000 MHz; 10Gbps"],
            correctAnswers: ["500 MHz; 10Gbps"]),
        Question(
            text: "the NIC turns the frame into______ for transmission over the network medium.",
            choices: ["packets","syntax","bits and bytes","frames"],
            correctAnswers: ["bits and bytes"]),
        Question(
            text: "which port does HTTPS use",
            choices: ["443","143","80","1024"],
            correctAnswers: ["443"]),
        Question(
            text: "TIA/ EIA defines the industry termination standard for correct crimping of four-pair UTP and color coding. Which two are the primary standards?(select 2)",
            choices: ["TIA/ EIA 568A","TIA/ EIA 550A","TIA/ EIA568B","TIA/ EIA500B"],
            correctAnswers: ["TIA/ EIA 568A","TIA/ EIA568B"]),
        Question(
            text: "the Cisco developed _____ protocol paired with IPsec encryption is used to make a point to point tunnel connection.",
            choices: ["","GRE (generic routing encapsulation)","",""],
            correctAnswers: ["GRE (generic routing encapsulation)"]),
        Question(
            text: "What does the acronym NFV stand for?",
            choices: ["network frame virtualization ","network function virtualization","new function virtualization","new frame virtualization"],
            correctAnswers: ["network function virtualization"]),
        Question(
            text: "What is the standard connector for the 10 GbE fiber standard?",
            choices: ["ST","SC","MT-RJ","There is no standard"],
            correctAnswers:["There is no standard"]),
        Question(
            text: "What is the maximum cable length of 10GBASE-T on Cat 6?",
            choices: ["55m","100m","20m","70m"],
            correctAnswers:["55m"]),
        Question(
            text: "Which type of DNS record is used by main servers to determine where to send e-mail?",
            choices: ["A record","CNAME record","MX record","SMTP record"],
            correctAnswers:["MX record"]),
        Question(
            text: "Running which command enables you to clear the DNS cache?",
            choices: ["ipconfig","ipconfig /all","ipconfig /dns","ipconfig /flushdns"],
            correctAnswers:["ipconfig /flushdns"]),
        Question(
            text: "To achieve maximum Wi-Fi coverage in a room, where should you place the WAP?",
            choices: ["Place the WAP on the North side of the room","Place the WAP in the center of the room","Place the WAP near a convenient electrical outlet","It doesn't matter where you place the WAP"],
            correctAnswers:["Place the WAP in the center of the room"]),
        Question(
            text: "What hardware enables wireless PCs to connect to resources on a wired network segment in infrastructure mode? (select 2)",
            choices: ["An access point","A router","A hub","A wireless bridge"],
            correctAnswers:["An access point","A wireless bridge"]),
        Question(
            text: "How does an SNMP managed system categorize data that can be queried?",
            choices: ["MIBs","QoS","PDUs","UDP"],
            correctAnswers:["QoS"]),
        Question(
            text: "An SNMP manager uses which port when used with TLS?",
            choices: ["161","162","10161","10162"],
            correctAnswers:["10162"]),
        Question(
            text: "What type of IP address is 255.255.255.255?",
            choices: ["Public address","Private address","Broadcast address","Loopback address"],
            correctAnswers:["Broadcast address"]),
        Question(
            text: "Which of the following is the most secure form of wireless encryption?",
            choices: ["WEP","WPA","WPA2","WPA3"],
            correctAnswers:["WPA3"]),
        Question(
            text:"What is the maximum number of frames that can be sent in one second?",
            choices: ["1000","10000","100000","1000000"],
            correctAnswers:["1000"]),
        Question(
            text:"What is the maximum number of hops that a frame can take through a network?",
            choices: ["1","2","3","4"],
            correctAnswers:["4"]),
        Question(
            text: "Which layer of the OSI model is responsible for encryption and decryption?",
            choices: ["Application","Presentation","Session","Transport"],
            correctAnswers:["Presentation"]),
        Question(
            text: "What type of network device operates at the network layer?",
            choices: ["Router","Hub","Switch","Bridge"],
            correctAnswers:["Router"]),
        Question(
            text: "Which of the following protocols provides load balancing in a spine-and-leaf data center?",
            choices: ["ECPM","HSRP","STP","VRRP"],
            correctAnswers:["ECPM"]),
        Question(
            text: "Joan's data center has two ISPs, one fiber and one cable. That aspect of security does this represent?",
            choices: ["Active-active","Clustering","Multiplaning","Redundancy"],
            correctAnswers:["Redundancy"]),
        Question(
            text: "Which of the following are not valid IP addresses assign to a Windows-based system? (select 2)",
            choices: ["10.1.1.1/24","127.0.0.1/24","250.250.250.255/24","192.168.0.1/24"],
            correctAnswers:["127.0.0.1/24","250.250.250.255/24"]),
        Question(
            text: "Phyllis has a service ticket for one of the latest Apple Macs that's having network connectivity problems. What command could she use to quickly see the IP address and MAC address for that computer?",
            choices: ["ifconfig","ip addr","ipconfig","ipconfig /all"],
            correctAnswers:["ifconfig"]),
        Question(
            text: "what mode is sometimes called peer-to-peer mode with each wireless note in direct contact with each other note in a decentralized free-for-all.",
            choices: ["Ad hoc","Ad homina","Network domain","WAN"],
            correctAnswers: ["Ad hoc"]),
        Question(
            text: "connected Bluetooth devices create a _____, and security concerns apply to all the devices and communications within.",
            choices: ["PAN(personal area network)","PAN(public area network)","PAN(private area network)","None of the above"],
            correctAnswers: ["PAN(personal area network)"]),
        Question(
            text: "Which network topology connected nodes with a ring of cable?",
            choices: ["Star","Bus","Mesh","Ring"],
            correctAnswers: ["Ring"]),
        Question(
            text: "Which network topology is most commonly seen only in wireless networks?",
            choices: ["Star","Bus","Mesh","Ring"],
            correctAnswers: ["Mesh"]),
        Question(
            text: "The people who use a network experience it through a(n) ________.",
            choices: ["application","display","chart","graph"],
            correctAnswers: ["application"]),
        Question(
            text: "____ (hub-and-spoke) topology uses a central connection box for all the computers on the network.",
            choices: ["Bus","Wheel","Star","Web"],
            correctAnswers: ["Star"]),
        Question(
            text: "Which of the following enable you to use multiple NICs in a computer to achieve a much better network bandwidth?",
            choices: ["Linking","Port aggregation","SLI","Xing"],
            correctAnswers:["Port aggregation"]),
        Question(
            text: "How many pairs of wires are in a Cat-6 rated cable? ",
            choices: ["2","4","8","It doesn't specify"],
            correctAnswers:["4"]),
        Question(
            text: "Which topology out of the following offers better fault tolerance if cable is broken?",
            choices: ["bus","redundant","ring","star"],
            correctAnswers: ["star"]),
        Question(
            text: "What does the application layer refer to, that enables network aware applications?",
            choices: ["Refers to the cabling, built into all networks","Refers to the code, built into all operating systems","Refers to the question, to be or not to be","Refers to the frames, built into all operating systems"],
            correctAnswers: ["Refers to the code, built into all operating systems"]),
        Question(
            text: "All operating systems have ______",
            choices: ["data-sync servers","network capabilities","DTP(direct training processes)","APIs (application programming interfaces)"],
            correctAnswers: ["APIs (application programming interfaces)"]),
        Question(
            text: "Rashan's company has multiple servers from which remote users download files. What should Rashan implement on his servers to make them appear as a single server so that they receive similar amounts of requests?",
            choices: ["Load balancing","Port authentication","Port mirroring","Trunking"],
            correctAnswers:["Load balancing"]),
        Question(
            text: "Which of the following statements best applies to an IDS?",
            choices: ["An IDS inspects a copy of all traffic in a network and can respond to detected intrusions with actions.","An IDS inspects all traffic as it enters a network and can respond to detected intrusion with actions.","An IDS inspects a copy of all traffic in a network and reports intrusions.","An IDS inspects all traffic as it enters a network and reports intrusions."],
            correctAnswers:["An IDS inspects a copy of all traffic in a network and reports intrusions."]),
        Question(
            text: "What type of cable is used to connect two devices directly without a switch or hub?",
            choices: ["Crossover cable","Straight-through cable","Fiber optic cable","Coaxial cable"],
            correctAnswers:["Crossover cable"]),
        Question(
            text: "What is the maximum speed of a 100BASE-TX Ethernet connection?",
            choices: ["10Mbps","100Mbps","1000Mbps","10Gbps"],
            correctAnswers:["100Mbps"]),
        Question(
            text: "Which of the following terms is used to describe a fixed location where a device's MAC address is stored?",
            choices: ["Routing table","Address resolution table","ARP cache","DHCP lease table"],
            correctAnswers:["ARP cache"]),
        Question(
            text: "What is the primary benefit of a stateful firewall?",
            choices: ["It can filter traffic based on IP addresses","It tracks the state of active connections","It works faster than a packet-filtering firewall","It encrypts traffic between networks"],
            correctAnswers:["It tracks the state of active connections"]),
        Question(
            text:"What is the maximum number of frames that can be sent in one second?",
            choices: ["1000","10000","100000","1000000"],
            correctAnswers:["1000"]),
        Question(
            text: "What is the process called where data is chopped into chunks to fit into a packet and eventually into a frame?",
            choices: ["partition","segmentation","evaluation","division"],
            correctAnswers: ["segmentation"]),
        Question(
            text: "What software handles the initiation, termination of contact between two systems?",
            choices: ["session software","transport software","priority software","passive software"],
            correctAnswers: ["session software"]),
        Question(
            text: "Which of the following is a duplex fiber-optic connection?",
            choices: ["LC","Rj-45","ST","SC"],
            correctAnswers: ["LC"]),
        Question(
            text: "What is the most common category of UTP used in new cabling installations?",
            choices: ["Cat 3","Cat 5e","Cat 6","Cat 7"],
            correctAnswers: ["Cat 6"]),
        Question(
            text: "Which of the following is not true of crossover cables?",
            choices: ["They are a type of twisted pair cabling","They revers the sending and receiving wire pairs","They are used to connect switches","Both ends of a crossover cable are wired according to the TIA/EIA 568B standard"],
            correctAnswers: ["Both ends of a crossover cable are wired according to the TIA/EIA 568B standard"]),
        Question(
            text: "Which of the following connectors were used by a 10BASE-FL cable?(select 2)",
            choices: ["SC","RJ-45","RJ-11","ST"],
            correctAnswers: ["SC","ST"]),
        Question(
            text: "In a mesh network, some of the routes between two computers may____",
            choices: ["provide a less fault tolerant network","only talk to one member on the network","transverse through another member of the network","only be used with offline networks"],
            correctAnswers: ["transverse through another member of the network"]),
        Question(
            text: "Network hardware designers _____ easily redesign their existing networks to use a star topology.",
            choices: ["could","decided","couldn't"],
            correctAnswers: ["couldn't"]),
        Question(
            text: "What is the result of converting 11110000.10111001.00001000.01100111 to dotted decimal notation?",
            choices: ["4.5.1.5","240.185.8.103","15.157.16.230","103.8.185.240"],
            correctAnswers:["240.185.8.103"]),
        Question(
            text: "What is the result of converting 192.168.0.1 to binary?",
            choices: ["11000000.10101000.00000000.00000001","11000000.10101000.00000000.10000000","11000000.10101000.00000000.1","11.10101.0.1"],
            correctAnswers:["11000000.10101000.00000000.00000001"]),
        Question(
            text: "What service do tunnel brokers provide?",
            choices: ["A way for users on IPv4 infrastructures to jump the gap between their computers and the IPv6 Internet routers","No useful service","Access to IPv6 DNS records","A second connection for multihoming"],
            correctAnswers:["A way for users on IPv4 infrastructures to jump the gap between their computers and the IPv6 Internet routers"]),
        Question(
            text: "What is the /48 prefix of the address 2001:0480:b6f3:0001::0001?",
            choices: ["2001:489:f::1f:0:d","2001:480:b6f3","2001:480b6f3:1:0000::1","2001:480b6f3:1:0000:0000:0000:1"],
            correctAnswers:["2001:480:b6f3"]),
        Question(
            text: "Which wireless encryption standard is considered outdated and insecure?",
            choices: ["WPA2","WPA3","WEP","TLS"],
            correctAnswers:["WEP"]),
        Question(
            text: "Which of the following is used to divide a physical network into multiple logical networks?",
            choices: ["Router","VLAN","Hub","Firewall"],
            correctAnswers:["VLAN"]),
        Question(
            text: "During and after a change to the IT infrastructure, what must be done?",
            choices: ["Downtime must be scheduled","New equipment must be installed","Operating systems must be patched","The changes must be documented"],
            correctAnswers:["The changes must be documented"]),
        Question(
            text: "What is the job of a first responder?",
            choices: ["Investigate data on a computer suspected to contain crime-evidence.","React to the notification of a computer crime","Power off computer suspected of being used in criminal activity","Shut down computers and remove mass storage devices"],
            correctAnswers:["React to the notification of a computer crime"]),
        Question(
            text: "Port 143 (IMAP4) is what kind of port?",
            choices: ["Well-known","Registered","Ephemeral","Reserved"],
            correctAnswers:["Well-known"]),
        Question(
            text: "What port does passive FTP use?",
            choices: ["20","21","23","25"],
            correctAnswers:["21"]),
        Question(
            text: "In a fully meshed topology network _____",
            choices: ["some computers may not connect at all","every computer connects directly to every other computer","every computer connects directly to the network","every computer connects to at least two other computers"],
            correctAnswers: ["every computer connects directly to every other computer"]),
        Question(
            text: "Mesh topology is primarily used in what network distribution?",
            choices: ["Wireless","Ethernet","Satellite","None of the above"],
            correctAnswers: ["Wireless"]),
        Question(
            text: "Ethernet hubs took an incoming packet and __ it out to the other connected ports.",
            choices: ["amplified","repeated","filtered","distorted"],
            correctAnswers: ["repeated"]),
        Question(
            text: "What was the maximum distance that could separate a 10BAST-T node from its hub?(meters)",
            choices: ["50","100","185","200"],
            correctAnswers: ["100"]),
        Question(
            text: "_______ works at the network layer, where it takes data chunks from the_______ and becomes the packets payload.",
            choices: ["Internet protocol(IP), network layer","Internet protocol(IP), session layer","Internet protocol(IP), transport layer","Internet protocol(IP), presentation layer"],
            correctAnswers: ["Internet protocol(IP), transport layer"]),
        Question(
            text: "The ANSI/TIA-568.3D prefix for single-mode fiber is _____",
            choices: ["LC","CT","OS","OM"],
            correctAnswers: ["OS"]),
        Question(
            text: "A SAN is a _______, presented over a network as any number of logical disks.",
            choices: ["pool of mass storage devices","collection of DVD drives","Static ARP network","none of the above"],
            correctAnswers: ["pool of mass storage devices"]),
        Question(
            text: "______ enable traffic over the Internet that incorporates a lot of features of MPLS, with efficient addressing and rooting for a lot of traffic. While maintaining high security and relies on virtualization.",
            choices: ["1000BASE-FX","Power network(PN)","Software-defined wide area, networking(SD-WAN)","Specific-domain wide area network(SD-WAN)"],
            correctAnswers: ["Software-defined wide area, networking(SD-WAN)"]),
        Question(
            text: "What processes are used to take a single class of IP addresses and chop it up into multiple smaller groups? (select 2)",
            choices: ["CIDR","ping","Subnetting","Subnitting"],
            correctAnswers:["CIDR","Subnetting"]),
        Question(
            text: "In which order are packets created and sent when a client requests an IP address from a DHCP server?",
            choices: ["DHCP discover, DHCP Offer, DHCP Request, DHCP ACK","DHCP discover, DHCP Request, DHCP Offer, DHCP ACK","DHCP Request, DHCP Offer, DHCPDiscover, DHCP ACK","DHCP Request, DHCP Offer, DHCP ACK,DHCP Discover"],
            correctAnswers:["DHCP discover, DHCP Offer, DHCP Request, DHCP ACK"]),
        Question(
            text: "What is the progressive loss radio signal passing through different media called?",
            choices: ["Attenuation","EAP","RFI","SNR"],
            correctAnswers:["Attenuation"]),
        Question(
            text: "Which technology enables use of a WAP without directly connecting the WAP to an AC power outlet?",
            choices: ["AES","Poe","Powered Wi-Fi","TKIP"],
            correctAnswers:["Poe"]),
        Question(
            text: "Betsy’s computer isn't plugged into a ethernet port. There are no local wires. Her laptop doesn't even have an ethernet port. Do OSI layers even apply?",
            choices: ["Yes, the wireless radio waves that connect her laptop to a wireless access point(WAP), operate at Layer-2.","Yes, the wireless radio waves that connect best laptop to a wireless access point(WAP), operate at Layer-1.","No, the wireless radio waves that connect her laptop do not apply.","No the wireless radio waves are considered to be after the OSI layers."],
            correctAnswers: ["Yes, the wireless radio waves that connect best laptop to a wireless access point(WAP), operate at Layer-1."]),
        Question(
            text: "_______ provides a way to conceptualize a network for troubleshooting and communication.",
            choices: ["Passive scanning","The seven-layer model","Note taking","Management privilege"],
            correctAnswers: ["The seven-layer model"]),
        Question(
            text: "A DoS attacker using ___ would focus on sending the smallest amount of traffic possible.",
            choices: ["Reflection","Inflection","Emanation","Amplification"],
            correctAnswers:["Amplification"]),
        Question(
            text: "A user's machine is locked to a screen telling her she must call a number to unlock her system. What kind of attack is this ? ",
            choices: ["DDos","Logic Bomb","Ransomeware","Session hijacking"],
            correctAnswers:["Ransomeware"]),
        Question(
            text: "Which of the following is NOT an example of a Layer 4 protocol?",
            choices: ["TCP","UDP","IP","SCTP"],
            correctAnswers:["IP"]),
        Question(
            text: "Which of the following statements is true about the TCP protocol?",
            choices: ["It is connectionless","It is reliable and connection-oriented","It is used to send e-mail","It operates on port 80"],
            correctAnswers:["It is reliable and connection-oriented"]),
        Question(
            text: "Which of the following is NOT a type of cable used in networking?",
            choices: ["Fiber optic","Coaxial","Ethernet","USB"],
            correctAnswers:["USB"]),
        Question(
            text: "What type of attack is a man-in-the-middle attack?",
            choices: ["Denial of Service","Eavesdropping and data manipulation","Phishing","Brute-force password attack"],
            correctAnswers:["Eavesdropping and data manipulation"]),
        Question(
            text: "When setting up WPA2-PSK on his wireless network, Ed has the option to choose TKIP or AES. Which should he implement?",
            choices: ["only AES","only TKIP","both AES and TKIP","Neither. He should implement RADIUS"],
            correctAnswers:["only AES"]),
        Question(
            text: "What do you call a wireless network in infrastructure mode with more than one access point? ",
            choices: ["BSS","EBSS","WBSS","ExNet"],
            correctAnswers:["EBSS"]),
        Question(
            text: "Why would a network technician use a tone probe and tone generator?",
            choices: ["To locate a particular cable","To test the dial tone on a PBX system","To run a long-duration ping test","To provide safety when working in crawl space"],
            correctAnswers:["To locate a particular cable"]),
        Question(
            text: "Which protocol is used to resolve IP addresses to MAC addresses?",
            choices: ["ARP","DNS","DHCP","ICMP"],
            correctAnswers:["ARP"]),
        Question(
            text: "What is the primary purpose of a VLAN?",
            choices: ["Increase network speed","Segment network traffic","Improve wireless coverage","Reduce network latency"],
            correctAnswers:["Segment network traffic"]),
        Question(
            text: "What is a characteristic of a mesh topology?",
            choices: ["All devices are connected to a central hub","Each device is connected to every other device","Devices communicate in a linear fashion","Devices communicate in a circular fashion"],
            correctAnswers:["Each device is connected to every other device"]),
        Question(
            text: "Which of the following services can be provided by a proxy server?",
            choices: ["Web filtering","Bandwidth management","Access control","All of the above"],
            correctAnswers:["All of the above"]),
        Question(
            text: "The simplest way to interconnect local and cloud resources is to establish a ____.",
            choices: ["Platform as a service","private direct connection","site-to-site VPN","software-defined network"],
            correctAnswers:["site-to-site VPN"]),
        Question(
            text: "Big Tracks is a successful Bigfoot-tracking company using an internal service to manage all of its automated Bigfoot monitoring stations. A Bigfoot migration has cause a massive increase in the amount of audio and video sent back from BigTracks' stations. In order to add a short-term capacity, Big Tracks can create new servers in the public cloud. What model of cloud computing does this describe?",
            choices: ["Public cloud","Private cloud","Community cloud","Hybrid cloud"],
            correctAnswers:["Hybrid cloud"]),
        Question(
            text: "What is the maximum distance for 1000BASE-LX without repeaters?",
            choices: ["1 mile","2500m","20,000ft","5000m"],
            correctAnswers:["5000m"]),
        Question(
            text: "What is a big advantage to using fiber-optic cable?",
            choices: ["Fiber is common glass; therefore, it's less expensive","Fiber is not affected by EMI","Making custom cable lengths is easier with fiber","All that orange fiber looks impressive in the network closet"],
            correctAnswers:["Fiber is not affected by EMI"]),
        Question(
            text: "Computer a knows computer b’s IP address, but how does computer a know the MAC address of computer B.",
            choices: ["computer a sends a special query called an challenge request to Mac addressFF-FF-FF-FF-FF-FF.","computer a sends a special query called an IP request to Mac addressFF-FF-FF-FF-FF-FF.","computer a sends a special query called an ARP request to Mac addressFF-FF-FF-FF-FF-FF.","computer a sends a special query called an ARP request to Mac addressEE-EE-EE-EE-EE-EE."],
            correctAnswers: ["computer a sends a special query called an ARP request to Mac addressFF-FF-FF-FF-FF-FF."]),
        Question(
            text: "TIA/EIA-568B Color code from position 1-8 is as follows:   ",
            choices: ["G/W,  G, O/W, B, B/W, O, B/W,B","B, B/W, G, B/W, B, G W/ O, O/W","Bl, Bl/W, O,Br/W, Br, O/W, G, G/W","O/W, O, G/W, Bl, Bl/W, G,Br/W, Br"],
            correctAnswers: ["O/W, O, G/W, Bl, Bl/W, G,Br/W, Br"]),
        Question(
            text: "When used for Ethernet, unshielded twisted pair uses what type of connector?",
            choices: ["RJ-58","RJ-45","RJ-11","RS-232"],
            correctAnswers: ["RJ-45"]),
        Question(
            text: "What was the maximum number of nodes that could be connected to a 10BASE-T hub?",
            choices: ["1024","500","100","185"],
            correctAnswers: ["1024"]),
        Question(
            text: "Which of the following are the key benefits of Web-base mail?(select 2)",
            choices: ["You can use a third-party application,  like Microsoft Outlook, to download your e-mail.","You can access your e-mail from anywhere in the world using a Web browser and an Internet connection","It is completely spam-free","It is great for creating throw-away accounts"],
            correctAnswers:["You can access your e-mail from anywhere in the world using a Web browser and an Internet connection","You can use a third-party application,  like Microsoft Outlook, to download your e-mail."]),
        Question(
            text: "TLS URL connection starts with which prefix?",
            choices: ["http","www","ftp","https"],
            correctAnswers:["https"]),
        Question(
            text: "Which of the following documentation includes dimensions and locations of rooms plus the physical objects-racks, raised floors, AC units, and so on- in the space?",
            choices: ["Floor plan","Logical network diagram","Rack diagram","System diagram"],
            correctAnswers:["Floor plan"]),
        Question(
            text: "Which document contains details about all the hardware and software installed in a data center and provides the foundation for future upgrades?",
            choices: ["Baseline configuration","Logical network diagram","Performance baseline","System diagram"],
            correctAnswers:["Baseline configuration"]),
        Question(
            text: "Which layer of the OSI model is responsible for packet forwarding?",
            choices: ["Application","Transport","Network","Data Link"],
            correctAnswers:["Network"]),
        Question(
            text: "What is the main difference between IPv4 and IPv6?",
            choices: ["Address length","Routing protocols","Port numbers","Security features"],
            correctAnswers:["Address length"]),
        Question(
            text: "Which of the following describes a characteristic of a Class A IP address?",
            choices: ["First octet in range 1-127","First octet in range 128-191","First octet in range 192-223","First octet in range 224-239"],
            correctAnswers:["First octet in range 1-127"]),
        Question(
            text: "What is the main function of an access control list (ACL)?",
            choices: ["To restrict access to network devices","To encrypt network traffic","To manage DHCP settings","To prioritize traffic"],
            correctAnswers:["To restrict access to network devices"]),
        Question(
            text: "Which of the following is a hash function?",
            choices: ["SHA-256","RC4","AES","BMX"],
            correctAnswers:["SHA-256"]),
        Question(
            text: "In order to have a PKI you must have a(n)__.",
            choices: ["Web server","Web of trust","root authority","unsigned certificate"],
            correctAnswers:["root authority"]),
        Question(
            text: "How many wire pairs does 1000BASE-T use?",
            choices: ["1","2","3","4"],
            correctAnswers:["4"]),
        Question(
            text: "Aside from outright breakage, what's the primary worry with bending a fiber-optic cable too much?",
            choices: ["Attenuation","Bonding","Light Leakage","Near-end crosstalk"],
            correctAnswers:["Light Leakage"]),
        Question(
            text: "Beth accesses servers to do her job; her laptop is a client of those servers. What is this described as for the network type?",
            choices: ["ISP","Multi-point sever","Public networking","Client-server"],
            correctAnswers: ["Client-server"]),
        Question(
            text: "In some circumstances, Beth might access resources distributed on many computers. In tern, her computer might share some of those resources with others. This is an example of what alternative network type.",
            choices: ["peer-to-peer","server-to-server","host-to-server","host-to-client"],
            correctAnswers: ["peer-to-peer"]),
        Question(
            text: "Which layer gives each device on the network a unique numeric identifier called an IP address?",
            choices: ["Layer-4 transport","Layer-7 application", "Layer-5 session","Layer-3 network"],
            correctAnswers: ["Layer-3 network"],),
        Question(
            text: "At the session layer, one system has to _____ another system’s, ability to handle the information sent.",
            choices: ["challenge","break","force","verify"],
            correctAnswers: ["verify"]),
        Question(
            text: "Which networking devices can use the Spanning Tree Protocol (STP)?",
            choices: ["Hubs","Media Converters","UTP Cables","Switches"],
            correctAnswers: ["Switches"]),
        Question(
            text: "wireless networks running in ___ mode use one or more WAPs to connect the wireless network notes essentially.",
            choices: ["central connection","pilot","infrastructure","office"],
            correctAnswers: ["infrastructure"]),
        Question(
            text: "What dynamic routing protocol uses link state advertisements to exchange information about networks?",
            choices: ["BGP","OSPF","EIGRP","IS-IS"],
            correctAnswers:["OSPF"]),
        Question(
            text: "What is Area 0 called in OSPF?",
            choices: ["Local Area","Primary Zone","Trunk","Backbone"],
            correctAnswers:["Backbone"]),
        Question(
            text: "Blackwell Held, LLC, leases space in the Wapi Lava Corporation's data center. Which term describes this type of scenario? ",
            choices: ["Branch office","Co-location","Lease-line","On-premises"],
            correctAnswers:["Co-location"]),
        Question(
            text: "Which open standard protocol enables redundant routers to appear as a single router for high availability? ",
            choices: ["HSRP","RRPX","VRRP","XRRP"],
            correctAnswers:["VRRP"]),
        Question(
            text: "What is the purpose of port forwarding?",
            choices: ["To allow remote access to internal services","To encrypt packets","To monitor network traffic","To filter unwanted traffic"],
            correctAnswers:["To allow remote access to internal services"]),
        Question(
            text: "Which of the following devices can be used to increase the range of a wireless network?",
            choices: ["Router","Switch","Access Point","Repeater"],
            correctAnswers:["Repeater"]),
        Question(
            text: "What device directs packets based on MAC addresses?",
            choices: ["Router","Hub","Repeater","Switch"],
            correctAnswers: ["Switch"]),
        Question(
            text: "Which of the following network devices is used to connect two different networks?",
            choices: ["Hub","Bridge","Router","Switch"],
            correctAnswers:["Router"]),
        Question(
            text: "What does a MAC address uniquely identify?",
            choices: ["A specific network device","A particular network interface card","A subnet","A router"],
            correctAnswers:["A particular network interface card"]),
        Question(
            text: "Which of the following is an EGP?",
            choices: ["BGP","IGP","EIGRP","IS-IS"],
            correctAnswers:["BGP"]),
        Question(
            text: "Which of the following is not a name for a serial cable that you use to configure a router?",
            choices: ["Console cable","Yost cable","Rollover cable","Null modem cable"],
            correctAnswers:["Null modem cable"]),
        Question(
            text: "TCP flags are individual bits that_________.",
            choices: ["give both sides, detailed information about the state of the connection.","limit information about the state of the connection.","encrypts information about the state of the connection","changes information about the state of the connection"],
            correctAnswers: ["give both sides, detailed information about the state of the connection."]),
        Question(
            text: "_____ port is used to receive email messages from email servers(IMAP4)",
            choices: ["443","143","20","21"],
            correctAnswers: ["143"]),
        Question(
            text: "Fast ethernet at 100 Mbps makes sense for_______ and works for sharing, small data, like documents and spreadsheets.",
            choices: ["public area networks(PANs)","metro area networks(MANs)","local area networks(LANs)","limited area networks(LANs)"],
            correctAnswers: ["local area networks(LANs)"]),
        Question(
            text: "Which protocol enable synchronization of communication among connected computing devices?",
            choices: ["FTP","IMAP4","NTP","TFTP"],
            correctAnswers:["NTP"]),
        Question(
            text: "Which of the following protocols are used to retrieve e-mail from servers?(select 2)",
            choices: ["IMAP4","ICMP","IGMP","POP3"],
            correctAnswers:["IMAP4","POP3"]),
        Question(
            text: "What type of network has computers connected to other computers locally?",
            choices: ["WAN","LAN","CAN","DAN"],
            correctAnswers: ["LAN"]),
        Question(
            text: "a configuration of wireless computers, connecting the note essentially creates a _____.",
            choices: ["WLAN(wireless local area network)","WLAN(windows local access network","WLAN(workload acceptable network)","WLAN(whole large area network"],
            correctAnswers: ["WLAN(wireless local area network)"]),
        Question(
            text: "What type of server supports EAP encrypted passwords in accordance with the 802.1X standard?",
            choices: ["WAP server","WEP server","RADIUS server","NAS server"],
            correctAnswers:["RADIUS server"]),
        Question(
            text: "Which of the following is the most secure method of wireless encryption?",
            choices: ["WEP","WPA","WPA2","WPA3"],
            correctAnswers:["WPA3"]),
        Question(
            text: "What should you create when a network is running normally?",
            choices: ["Answer file ","Capture file","MIB","Baseline"],
            correctAnswers:["Baseline"]),
        Question(
            text: "Bart has a choice of tools to view his managed network, but he primarily wants to see graphs of various types of data, such as the overall traffic and the current capacities of the file servers. Which tool offers him the best option",
            choices: ["Cacti","snmpwalk","NetFlow","Wireshark"],
            correctAnswers:["Cacti"]),
        Question(
            text: "What type of firewall filters traffic based on IP address, port, and protocol?",
            choices: ["Stateful","Packet-filtering","Proxy","Application-layer"],
            correctAnswers:["Packet-filtering"]),
        Question(
            text: "Which of the following is an example of an IPv6 address?",
            choices: ["10.0.0.1","172.16.0.1","fe80::1","192.168.1.1"],
            correctAnswers:["fe80::1"]),
        Question(
            text: "Which DNS component performs a recursive lookup to determine an IP address? ",
            choices: ["FQDN","ICANN","name server","Resolver"],
            correctAnswers:["Resolver"]),
        Question(
            text: "What's the process through which records propagate among name servers? ",
            choices: ["hosts file","Recursive transfer","Resolver cache","Zone transfer"],
            correctAnswers:["Zone transfer"]),
        Question(
            text: "MTU stands for_____",
            choices: ["metro task unit","metro transport unit","minimum transmission unit","maximum transmission unit"],
            correctAnswers: ["maximum transmission unit"]),
        Question(
            text: "PDU stands for_____",
            choices: ["post data unit","primary data unit","public data unit","protocol data unit"],
            correctAnswers: ["protocol data unit"]),
        Question(
            text: "With 100BASE-T, what is the maximum distance between the switch and the node?",
            choices: ["1000","400","100","150"],
            correctAnswers: ["100"]),
        Question(
            text: "What type of cable and connector does 100BASE-FX use?",
            choices: ["Multimode fiber with ST or SC connectors","STP Cat 6 with RJ-45 connectors","Single-mode fiber with MT-RJ connectors","UTP cat 5e with RJ-45 connectors"],
            correctAnswers: ["Multimode fiber with ST or SC connectors"]),
        Question(
            text: "you will find the demarcation point located in ______ for a network(choose the best option)",
            choices: ["the basement","service-related entry point","the cloud","the ISP building"],
            correctAnswers: ["service-related entry point"]),
        Question(
            text: "The NIU(network interface unit) serves as the Demarc between_____.",
            choices: ["the neighbors house and yours","your home network and your ISP","the grounding point and network","server room and main offices"],
            correctAnswers: ["your home network and your ISP"]),
        Question(
            text: "Is NAT needed with IPv6?",
            choices: ["No, because NAT has been replaced with a new version called NAT6","No, the address space is so large that rationing routable addresses is unnecessary","Yes, because it is the only way to protect against hackers.","Yes, because of the limited nature of IPv6 addressing."],
            correctAnswers:["No, the address space is so large that rationing routable addresses is unnecessary"]),
        Question(
            text: "What does a client need to access IPv6 content on the Internet?",
            choices: ["A link-local address","A multicast address","A global unicast address","The IPv6 Internet is currently unreachable"],
            correctAnswers:["A global unicast address"]),
        Question(
            text: "When is a memorandum of understanding used?",
            choices: ["As a part of a legal contract","As part of a statement of work (SOW)","When a service-level agreement (SLA) expires","When a legal contract is not appropriate"],
            correctAnswers:["When a legal contract is not appropriate"]),
        Question(
            text: "The best way to know the vulnerabilities of an IT infrastructure is to run what?",
            choices: ["A system-wide antivirus scanner","Cable certifier","Critical asset scanner","Vulnerability scanner"],
            correctAnswers:["Vulnerability scanner"]),
        Question(
            text: "Which wireless standard supports speeds up to 54 Mbps?",
            choices: ["802.11b","802.11g","802.11n","802.11ac"],
            correctAnswers:["802.11g"]),
        Question(
            text: "Which of the following devices operates at the physical layer?",
            choices: ["Hub","Switch","Router","Firewall"],
            correctAnswers:["Hub"]),
        Question(
            text: "Which of the following would never be seen in an equipment rack?",
            choices: ["Patch panel","UPS","PC","All of the above may be seen in an equipment rack."],
            correctAnswers:["All of the above may be seen in an equipment rack."]),
        Question(
            text: "Rack-mounted equipment has a height measured in what units?",
            choices: ["Mbps","MBps","Inches","U"],
            correctAnswers:["U"]),
        Question(
            text: "The central component of any ICS is what ?",
            choices: ["Sensors","PLCs","ICS server","HMI"],
            correctAnswers:["ICS server"]),
        Question(
            text: "Which of the following differentiates a PLC from a DCS controller?",
            choices: ["Sequential control","Sensors","Operator","Actuator"],
            correctAnswers:["Sequential control"]),
        Question(
            text: "What is the primary purpose of NAT (Network Address Translation)?",
            choices: ["To manage IP addressing","To create a local network","To translate private IPs to public IPs","To encrypt communication"],
            correctAnswers:["To translate private IPs to public IPs"]),
        Question(
            text: "What protocol is used to resolve domain names to IP addresses?",
            choices: ["DNS","DHCP","FTP","HTTP"],
            correctAnswers:["DNS"]),
        Question(
            text: "Which of the following is a valid subnet mask for a Class C network?",
            choices: ["255.255.255.0","255.0.0.0","255.255.0.0","255.255.255.255"],
            correctAnswers:["255.255.255.0"]),
        
        
        Question(
            text: "What is the main advantage of using a fiber optic connection over a copper cable?",
            choices: ["Lower cost","Higher bandwidth","Easier to install","Less interference"],
            correctAnswers:["Higher bandwidth"]),
        Question(
            text: "A Dynamic Multipoint VPN, enables ____ VPN connections between multiple locations.",
            choices: ["static","public","private ","direct"],
            correctAnswers: ["direct"]),
        Question(
            text: "demarcation point(demarcation) is where connections from _____ come into a building.",
            choices: ["public utilities","the surrounding Wi-Fi","the outside world","None of the above"],
            correctAnswers: ["the outside world"]),
        Question(
            text: "_______ is the most visible part of any network to the end user.",
            choices: ["Network Layer","Data Layer","Presentation Layer","Application Layer"],
            correctAnswers: ["Application Layer"]),
        Question(
            text: "_________ may include additional functions, such as encryption, user authentication, and tools to control the look of the data. These functions are specific to the given ______.",
            choices: ["frames","applications","networks","databases"],
            correctAnswers: ["applications"]),
        Question(
            text: "_____ connects headsets to smartphones and keyboards to laptops, is a wireless networking protocol developed to simplify connections between devices.",
            choices: ["Wi-Fi","Bluetooth","Satellite","DSN"],
            correctAnswers: ["Bluetooth"]),
        Question(
            text: "The MacDaddy widgets corporation makes widgets at its campus of three buildings, network together to form a _____. One building is the commercial office. The second is a factory space. The final is the warehouse and shipping facility.",
            choices: ["CAN(campus area network)","PAN(private area network)","SAN(server area network)","None of the above"],
            correctAnswers: ["CAN(campus area network)"]),
        Question(
            text: "The trace-route utility is useful for which purpose?",
            choices: ["Configuring routers remotely","Showing the physical location of the route between you and the destination","Discovering information about the routers between you are the destination address","Fixing the computer's local routing table"],
            correctAnswers:["Discovering information about the routers between you are the destination address"]),
        Question(
            text: "What is the session information- IP address, port number, and Layer 4 protocol- held in memory called? (select 2)",
            choices: ["Endpoint","Port","Segment","Session","Socket"],
            correctAnswers:["Endpoint","Socket"]),
        Question(
            text: "An attack where someone tries to hack a password using every possible password permutation is called what?",
            choices: ["Man-in-the-middle","Spoofing","Rainbow table","Brute force"],
            correctAnswers:["Brute force"]),
        Question(
            text: "The NSA's TEMPEST security standards are used to combat which risk?",
            choices: ["RF emanation","Spoofing","DDos","Malware"],
            correctAnswers:["RF emanation"]),
        Question(
            text: "Which of the following types of cable has the highest maximum data transfer rate?",
            choices: ["Cat 5","Cat 5e","Cat 6","Cat 7"],
            correctAnswers:["Cat 7"]),
        Question(
            text: "What is the primary function of a DNS server?",
            choices: ["To map IP addresses to domain names","To monitor network performance","To route data between devices","To manage bandwidth"],
            correctAnswers:["To map IP addresses to domain names"]),
        Question(
            text: "When you are first setting up a new router, you should never plug it into an existing network.True/False",
            choices: ["T","F"],
            correctAnswers:["T"]),
        Question(
            text: "Which statements about netstat switched (in Windows) are true? (select 3)",
            choices: ["-a shows all used ports","-n shows port numbers and IP addresses","-o shows the process ID","-s shows the application name"],
            correctAnswers:["-a shows all used ports","-n shows port numbers and IP addresses","-o shows the process ID"]),
        Question(
            text: "Which layer deals with MAC addresses as a part of the OSI model?",
            choices: ["Layer-4 transport","Layer-7 application", "Layer-2 Data-Link","Layer-1 physical"],
            correctAnswers: ["Layer-2 Data-Link"],),
        Question(
            text: "A NFV orchestrator is a software conductor that does the work of _____ the VNF that run on the NFVI.",
            choices: ["pausing, starting, shutting down","creating, configuring, scaling, pausing shutting down and deleting","initiating, providing, servicing, shutting down and deleting","None of the above."],
            correctAnswers: ["creating, configuring, scaling, pausing shutting down and deleting"]),
        Question(
            text: "In a PKI encryption method, which key encrypts the data?",
            choices: ["Public","Private","Both","Depends on who sends the data"],
            correctAnswers:["Public"]),
        Question(
            text: "The process of verifying with a high degree of confidence that the sends is who the receiver thinks he or she should be is called___.",
            choices: ["PKI","authentication","locking","nonrepudiation"],
            correctAnswers:["PKI"]),
        Question(
            text: "A well know ISP in Alaska name SnowNet only has a few employees, management of resources like RAM or how many processors they can use in real time based on what their users are doing would be difficult. What type of system could they employ to automate this function?",
            choices: ["A NFVI  using a NFV orchestrator,A physical server location with the standard switch board controller","Volunteers to assist with the management","Third party like Star-link, Verizon or SureNet"],
            correctAnswers: ["A NFVI  using a NFV orchestrator"]),
        Question(
            text: "Which layer propagates the frame?",
            choices: ["Layer-2 Data-Link","Layer-7 application","Layer-5 session","Layer-1 physical"],
            correctAnswers: ["Layer-2 Data-Link"]),
        Question(
            text: "Which type of access control requires a label to define its sensitivity?",
            choices: ["MAC","DAC","RBAC","VAC"],
            correctAnswers:["MAC"]),
        Question(
            text: "A static VLAN assigns VLANs to __.",
            choices: ["IP addresses","MAC addresses","ports","trunks"],
            correctAnswers:["ports"]),
        Question(
            text: "Which of the following IP addresses is a private address?",
            choices: ["192.168.1.1","10.0.0.1","172.16.0.1","All of the above"],
            correctAnswers:["All of the above"]),
        Question(
            text: "Which protocol is used to manage IP addresses dynamically?",
            choices: ["ARP","DNS","DHCP","ICMP"],
            correctAnswers:["DHCP"]),
        Question(
            text: "What is the first step in troubleshooting a network issue?",
            choices: ["Check the cables","Check the router configuration","Identify the problem","Restart the system"],
            correctAnswers:["Identify the problem"]),
        Question(
            text: "What is the default port number for HTTPS?",
            choices: ["80","443","21","25"],
            correctAnswers:["443"]),
        Question(
            text: "What uniquely identifies every NIC?",
            choices: ["MAC address","IP address","DNS name","d.All of the above"],
            correctAnswers: ["MAC address"]),
        Question(
            text: "two or more wireless nodes, communicating in ad hoc mode for a(n)______",
            choices: ["extended service set(ESS)","independent basic service set(IBSS)","common data drop-link(CDDL)","multi wireless processing pair(MWPP)"],
            correctAnswers: ["independent basic service set(IBSS)"]),
        Question(
            text: "Which layer moves data from one system to another, and has copper cabling, fiber, optics or radio waves?",
            choices: ["Layer-1 physical", "Layer-2 data-link", "Layer-3 Network", "Layer-5 Transport"],
            correctAnswers: ["Layer-1 physical"]),
        Question(
            text: "TIA/EIA-568A 1 and 2, 3 and 6 come from the same colored pairs. What are the two primary colors?(select 2)",
            choices: ["Green","Brown","Blue","White", "Orange"],
            correctAnswers: ["Green", "Orange"]),
        Question(
            text: "where is the MPLS label in the header?",
            choices: ["between the Layer-2 and Layer-3 header","at the beginning,","at the end","between the Layer-6 and 7 header"],
            correctAnswers: ["between the Layer-2 and Layer-3 header"]),
        Question(
            text: "What does NFVI do?",
            choices: ["provide a ethernet network (only used on macOS)","the hardware(x86-64 servers, storage array, and switch switches) and software(like hyper visors and controllers) that form the foundation of a virtual network.","only provides structure for WANs(primarily used in a public setting)","a network architecture (a collection of patterns that generally— not specifically —describe how to design a network that achieves a specific set of goals)"],
            correctAnswers: ["the hardware(x86-64 servers, storage array, and switch switches) and software(like hyper visors and controllers) that form the foundation of a virtual network."]),
        Question(
            text: "A hash function is by definition a___.",
            choices: ["complex function","PKI function","one-way function","systematic function"],
            correctAnswers:["one-way function"]),
        Question(
            text: "Which of the following is the trunking protocol used in today's VLANs?",
            choices: ["802.1Q","802.1X","802.1t","802.1z"],
            correctAnswers:["802.1Q"]),
        Question(
            text: "What is the default subnet mask for a Class C network?",
            choices: ["255.255.255.0","255.255.0.0","255.0.0.0","255.255.255.255"],
            correctAnswers:["255.255.255.0"]),
        Question(
            text: "Which protocol is responsible for error reporting in a network?",
            choices: ["ICMP","ARP","SMTP","FTP"],
            correctAnswers:["ICMP"]),
        Question(
            text: "Which type of address is used by IPv4 to identify network devices?",
            choices: ["MAC address","Port address","IP address","DNS address"],
            correctAnswers:["IP address"]),
        Question(
            text: "What is the maximum transmission speed for a 10GBASE-SR fiber optic connection?",
            choices: ["1Gbps","10Gbps","100Gbps","1Tbps"],
            correctAnswers:["10Gbps"]),
        Question(
            text: "Where does (did) the hub send data?",
            choices: ["Only to the receiving system","Only to the sending system","To all the systems connected to the hub","Only to the server"],
            correctAnswers: ["To all the systems connected to the hub"]),
        Question(
            text: "What describes the huge variety of devices you can access and control via the Internet(discounting personal computers, routers, and servers)?",
            choices: ["HAN(host area network)","LAN(local area network)","HSN(home selection network)","IoT (Internet of things)"],
            correctAnswers: ["IoT (Internet of things)"]),
        Question(
            text: "what is the name for high end data storage structures that create usable and configurable storage blocks for virtual drives, virtual desktops, and more.",
            choices: ["SATA","Server building","DAN(Data area network","SAN(storage area network)"],
            correctAnswers: ["SAN(storage area network)"]),
        Question(
            text: "A metro ethernet network creates a secure, private network within a city, using fiber optic cabling and ethernet technology. Compare refers to this networking technology as ______. (Choose the best answer.)",
            choices: ["VPN","Metro-optical","Metro-server","Metro-network"],
            correctAnswers: ["Metro-optical"]),
        Question(
            text: "______ translates data from lower layers into a format usable by the Application layer and vice versa.",
            choices: ["Layer-4 transport","Layer-7 application","Layer-5 session","Layer-6 presentation"],
            correctAnswers: ["Layer-6 presentation"]),
        Question(
            text: "The encryption protocol used in e-commerce is called what?",
            choices: ["TLS (transport layer security)","UDP(user datagram)","FCS(file check sequence)","Port Forwarding"],
            correctAnswers: ["TLS (transport layer security)"]),
        Question(
            text: "many devices in the typical office environment, including lights, fans, copy machine, machines, and refrigerators generate _______, metal wires encounters these and electrical current is generated along the wire.",
            choices: ["environmental distortion,","electrical charge,","static discharge","magnetic fields"],
            correctAnswers: ["magnetic fields"]),
        Question(
            text: "The extra magnetic current that interferes with a coaxial cable and can shut down a network is called?",
            choices: ["electromagnetic interference(EMI)","environmental distortion","static discharge","gamma radiation"],
            correctAnswers: ["electromagnetic interference(EMI)"]),
        Question(
            text: "Downstream routers may, in theory, do what if their upstream router suddenly changes the IPv6 prefix it delegates to them?",
            choices: ["Fall back to IPv4 in order to be able to route traffic","Send an all-nodes router advertisement so that clients can renumber","Use link aggregation to merge the two prefixes","Send a router redirect to tell their own downstream routers about the new prefix"],
            correctAnswers:["Send an all-nodes router advertisement so that clients can renumber"]),
        Question(
            text: "Jane needs to connect two office LANs in two different cities to function as a single network. She opts to use virtual private networking to connect the two LANs over the public Internet. What kind of VPN connection will she employ?",
            choices: ["Client-to-site","Host-to-host","Point-to-point","Site-to-site"],
            correctAnswers:["Site-to-site"]),
        Question(
            text: "Which of the following protocols is used to send large files over the internet?",
            choices: ["SMTP","FTP","IMAP","HTTP"],
            correctAnswers:["FTP"]),
        Question(
            text: "Which wireless standard operates in both the 2.4GHz and 5GHz frequency bands?",
            choices: ["802.11b","802.11g","802.11n","802.11ac"],
            correctAnswers:["802.11n"]),
        Question(
            text: "what are the two types of mesh topology?",
            choices: ["Partially, Fully meshed","Passive, Direct meshed","Powered, Non-powered meshed","None of the above"],
            correctAnswers: ["Partially, Fully meshed"]),
        Question(
            text: "An Angled Physical Contact(APC) connector adds what degree of angle to the curved end and why?",
            choices: ["An 8 degree to increasing signal loss.","An 4 degree to amplifying signal loss.","An 16 degree to lower signal loss.","An 8 degree to lower signal loss."],
            correctAnswers: ["An 8 degree to lower signal loss."]),
        Question(
            text: "TIA/EIA-568A (10BASE-T)Color code from position 1-8 is as follows:  ",
            choices: ["O/W, O, G/W, Bl,Bl/W,G,Br/W, Br","G/W,  G, O/W, Br, Br/W, O, Bl/W,B","G/W,  G, O/W, Bl, Bl/W, O, Br/W,Br"],
            correctAnswers: ["G/W,  G, O/W, Bl, Bl/W, O, Br/W,Br"]),
        Question(
            text: "TLS seems to initiate at layer ____, then encrypt and decrypt at layer ____.",
            choices: ["2; 4","2; 7","4; 6","4; 7"],
            correctAnswers: ["4; 6"]),
        Question(
            text: "A(n)__ organizes and protects the horizontal cabling in the telecommunications room.",
            choices: ["rack","patch panel","outlet","110 jack"],
            correctAnswers:["patch panel"]),
        Question(
            text: "Which of the following is a valid Class C IP address? ",
            choices: ["50.50.50.50","100.100.100.100","192.168.0.254","250.250.250.250"],
            correctAnswers:["192.168.0.254"]),
        Question(
            text: "What is a router?",
            choices: ["A piece of hardware that forwards packets based on IP address","A device that separates your computer from the Internet","A piece of hardware that distributes a single Internet connection to multiple computers.","A synonym for firewall"],
            correctAnswers:["A device that separates your computer from the Internet"]),
        Question(
            text: "Which of the following is NOT a wireless encryption standard?",
            choices: ["WEP","WPA","TLS","WPA2"],
            correctAnswers:["TLS"]),
        Question(
            text: "Which type of network does Wi-Fi operate on?",
            choices: ["LAN","WAN","PAN","MAN"],
            correctAnswers:["LAN"]),
        Question(
            text: "When the network is very busy, VoIP calls start to sound badly clipped. What solution might improve the quality of the VoIP calls?",
            choices: ["802.1z","Traffic shaping","DNS","Content switching"],
            correctAnswers:["Traffic shaping"]),
        Question(
            text: "What are the benefits of caching on a Web proxy?(select 2)",
            choices: ["Response time","Virus detection","tracking","Authentication"],
            correctAnswers:["Response time","Virus detection"]),
        Question(
            text: "________ are individual bits, give both sides, detailed information about the state of the connection.",
            choices: ["Data flags","TCP flags","File flags","Pointer flags"],
            correctAnswers: ["TCP flags"]),
        Question(
            text: "What does the recipient use to check the TCP header for errors, such as bits flipped or lost during transmission.",
            choices: ["A data chart","Delivery marker","A checksum","A syntax"],
            correctAnswers: ["A checksum"]),
        Question(
            text: "A(n)__ cipher encrypts the plaintext one bit at a time.",
            choices: ["block","forwarding","stream","asymmetric"],
            correctAnswers:["stream"]),
        Question(
            text: "What is the purpose of a router?",
            choices: ["To connect devices within the same network","To route data between different networks","To manage network security","To filter network traffic"],
            correctAnswers:["To route data between different networks"]),
        Question(
            text: "Which of the following is a characteristic of a Class B IP address?",
            choices: ["Network portion is 8 bits","Network portion is 16 bits","Network portion is 24 bits","Network portion is 32 bits"],
            correctAnswers:["Network portion is 16 bits"]),
        Question(
            text: "Which of the following is a valid IPv6 address?",
            choices: ["2001:bead:beef::1","2001:30F5::3d62::04ffe","192.168.1.4:ff45:126g:48fd:1","2001.0470.b33.e.23.f4.27de.d34a.aed2.1827"],
            correctAnswers:["2001:bead:beef::1"]),
        Question(
            text: "What is the main benefit of IPv6 aggregation?",
            choices: ["Aggregation enable users to combine multiple IPv6 address to increase their bandwidth and overall Internet speed exponentially.","Aggregation is backward-compatible and can be directly applied to IPv4 networks ","Aggregation reduces the size and complexity of routing tables, allowing routers to work more efficiently.","In aggregation, signals are increased with each router the packet travels through, allowing for greater distances over wireless networks."],
            correctAnswers:["Aggregation reduces the size and complexity of routing tables, allowing routers to work more efficiently."]),
        Question(
            text: "Eduardo accesses a managed switch from his desktop computer on the far side of the campus. What type of access management enables this connection? ",
            choices: ["In-band management","LAN-band managment","Out-of-band management","WAN-band management"],
            correctAnswers:["In-band management"]),
        Question(
            text: "________ encompasses the entire process of preparing data to go onto a network.",
            choices: ["Encryption","Framing","Encapsulation","Data transport"],
            correctAnswers: ["Encapsulation"]),
        Question(
            text: "________ is the process of stripping all the extra header information as the data goes up the Stack",
            choices: ["Fragmentation","Formatting","Decapsulation","Delivery"],
            correctAnswers: ["Decapsulation"]),
        Question(
            text: "Which record type acts like and alias, returning a FQDN rather that an IP address?",
            choices: ["A","CNAME","MX","SOA"],
            correctAnswers:["CNAME"]),
        Question(
            text: "Running which command enables you to query the zone of DNS server?",
            choices: ["ipconfig","nslookup","ping","xdnx"],
            correctAnswers:["nslookup"]),
        Question(
            text: "Which PDU does an SNMP manager use to query agents?",
            choices: ["Get","Response ","Set","Trap"],
            correctAnswers:["Get"]),
        Question(
            text: "In an SNMP managed network, which software does a managed device run?",
            choices: ["Agent","NMS","SNMP manager","MIB"],
            correctAnswers:["Agent"]),
        Question(
            text: "Which of the following is an example of a Layer 3 device?",
            choices: ["Hub","Switch","Router","Bridge"],
            correctAnswers:["Router"]),
        Question(
            text: "What is the purpose of QoS (Quality of Service)?",
            choices: ["To encrypt data for secure transmission","To prioritize network traffic for optimal performance","To authenticate users","To monitor bandwidth usage"],
            correctAnswers:["To prioritize network traffic for optimal performance"]),
        Question(
            text: "CAT 6 rated cables, have a maximum frequency of ___ and max bandwidth of ____",
            choices: ["100 MHz; 1 Gbps","250 MHz; 10Gbps","500 MHz; 10Gbps","600 MHz; 10Gbps"],
            correctAnswers: ["250 MHz; 10Gbps"]),
        Question(
            text: "A generic frame contains ________.",
            choices: ["recipients MAC address, senders MAC address, type, data, FCS","senders MAC address, recipients MAC address,  type, data, FCS","senders MAC address, recipients MAC address, FCS","Nothing it is a place holder."],
            correctAnswers: ["recipients MAC address, senders MAC address, type, data, FCS"]),
        Question(
            text: "Which of the following connector would you typically find with a 40 GbE installation?",
            choices: ["LC","SFP","QSFP+","XSFP+"],
            correctAnswers:["QSFP+"]),
        Question(
            text: "What standard does IEEE 802.3ab describe?",
            choices: ["1000BASE-LX","1000BASE-T","100BASE-T","1000BASE-SX"],
            correctAnswers:["1000BASE-T"]),
        Question(
            text: "a typical IPv4 address has______",
            choices: ["four values separated by three periods.","eight values separated by three periods.","four values separated by three colons.","four values separated by three dashes."],
            correctAnswers: ["four values separated by three periods."]),
        Question(
            text: "_______ header inside an IP packet stores source port, destination port, sequence number, acknowledgment number.",
            choices: ["TCP (transmission control protocol)","UDP(user datagram protocol","Ethernet","None of the above"],
            correctAnswers: ["TCP (transmission control protocol)"]),
        Question(
            text: "What is the purpose of an FCS",
            choices: ["Create more work for the programmers.","A way for the receiver to verify data integrity over delivery.","FCS encrypts the data.","FCS decrypts the data."],
            correctAnswers: ["A way for the receiver to verify data integrity over delivery."]),
        Question(
            text: "At most, frames in ethernet networks hold _____ bytes.",
            choices: ["1000","1250","1500","5000"],
            correctAnswers: ["1500"]),
        Question(
            text: "Which record type holds the IPv6 address for a host?",
            choices: ["A","AAAA","A6","SOA"],
            correctAnswers:["AAAA"]),
        Question(
            text: "802.1X is a great example of __",
            choices: ["encryption","content switching","port-based authentication","VLAN trunking"],
            correctAnswers:["port-based authentication"]),
        Question(
            text: "An analysis of a network shows a lot of traffic on one machine on port 161. What kind of machine is it?",
            choices: ["Managed device","SNMP","PDU","MIB"],
            correctAnswers:["Managed device"]),
        Question(
            text: "Which of the following is a characteristic of a good network security policy?",
            choices: ["Clear and consistent rules","Regular updates","User training","All of the above"],
            correctAnswers:["All of the above"]),
        Question(
            text: "What is the purpose of a VPN?",
            choices: ["To speed up internet browsing","To create a secure connection over an insecure network","To manage bandwidth","To filter malicious traffic"],
            correctAnswers:["To create a secure connection over an insecure network"]),
        Question(
            text: "vSwitching’s and using a physical switch, has what major difference?",
            choices: ["how data is passed to the cloud","what it means to 'plug' into the switch ","which network can pass data","host more devices"],
            correctAnswers: ["what it means to 'plug' into the switch"]),
        Question(
            text: "What is the big physical difference between 1000BASE-SX and 100BASE-FX?",
            choices: ["1000BASE-SX commonly uses the LC connector, whereas 100BASE-FX frequently uses the SC connector","1000BASE-SX is single-mode, whereas 100BASE-FX is multimode","1000BASE-SX uses the ST connector exclusively","There is no difference"],
            correctAnswers:["1000BASE-SX commonly uses the LC connector, whereas 100BASE-FX frequently uses the SC connector"]),
        Question(
            text: "What is an FCS?",
            choices: ["A part of a frame that uses a type of binary math called cyclic redundancy check(CRC)","A part of a frame that translates data to be used for receiver conversion","A part of a frame that uses a type of binary math called cross relay communication (CRC)","None of the above."],
            correctAnswers: ["A part of a frame that uses a type of binary math called cyclic redundancy check(CRC)"]),
        Question(
            text: "_______ is the initial portion of the frame has both a destination, MAC address and a source MAC address.",
            choices: ["Ethernet postage","Ethernet trailer","Ethernet header","Ethernet port"],
            correctAnswers: ["Ethernet header"]),
        Question(
            text: "What does the acronym SONET(US) and SDH(Europe) , stand for?",
            choices: ["","synchronous optical network, synchronous digital hierarchy","",""],
            correctAnswers: ["synchronous optical network, synchronous digital hierarchy"]),
        Question(
            text: "the DMVPN solution uses _____ protocol for dynamically, configure, tunnels, and tunnels to go to multiple destinations.",
            choices: ["GPS network","satellite direct","GRE(generic routing encapsulating","mGRE(multipoint GRE"],
            correctAnswers: ["mGRE(multipoint GRE"]),
        Question(
            text: "Which of the following devices would most likely be a UC gateway? ",
            choices: ["VoIP telephone","Desktop running Windows Server","Managed switch","Router"],
            correctAnswers:["Router"]),
        Question(
            text: "What is a media-net's primary tool to ensure bandwidth for VTC?",
            choices: ["MPLS","RTU","QoS","ISDN"],
            correctAnswers:["QoS"]),
        Question(
            text: "What tool enables you to compare current network performance with correctly functioning network performance?",
            choices: ["Baseline monitor","Packet flow monitor","Packet sniffer","Performance monitor"],
            correctAnswers:["Performance monitor"]),
        Question(
            text: "Which of the following is the default port number for HTTP?",
            choices: ["21","80","443","22"],
            correctAnswers:["80"]),
        Question(
            text: "John has two groups of virtual machines that each need to be on their own subnet. Which of the following should he use to subnet each group of VMs without moving or recabling hardware?",
            choices: ["Virtual NC","Virtual Switch","Virtual Router","Virtual firewall"],
            correctAnswers:["Virtual Router"]),
        Question(
            text: "Brenda wants to add a second ISP to her small data center for high availability. What should she consider?",
            choices: ["Fiber","Multipath","Multilatenancy","Path diversity"],
            correctAnswers:["Path diversity"]),
        Question(
            text: "When should you use a cable tester to troubleshoot a network cable?",
            choices: ["When you have a host experiencing a very slow connection.","When you have an intermittent connection problem.","When you have a dead connection and you suspect a broken cable.","When you are trying to find the correct cable up in the plenum."],
            correctAnswers:["When you have a dead connection and you suspect a broken cable."]),
        Question(
            text: "While you are asking the user problem-isolating questions, what else should you be doing?",
            choices: ["Asking yourself if there is anything on your side of the network that could be causing the problem.","Nothing: just keep asking the user questions","Using an accusatory tone with the user","Playing solitaire"],
            correctAnswers:["Asking yourself if there is anything on your side of the network that could be causing the problem."]),
        Question(
            text: "John recently had changed Internet service providers, he switched to a DSL provider. After the technician left John tried to call his mom, but the phone line wasn't working. What could potentially be the issue?",
            choices: ["Nothing it just takes some adjustment time.","John can't use a phone on a DSL network.","The tech forgot to tell John to dial 99 first","The tech didn't install a POTS filter,"],
            correctAnswers: ["The tech didn't install a POTS filter,"]),
        Question(
            text: "Which technologies provide the underpinnings for private WANs?",
            choices: ["DSLS","CWDM","SONETs","MPLS, SD-WAN, and Metro Ethernet"],
            correctAnswers: ["MPLS, SD-WAN, and Metro Ethernet"]),
        Question(
            text: "What is the universal MAC address for broadcast?",
            choices: ["AA-AA-AA-AA-AA-AA","FF-FF-FF-FF-FF-FF","12-34-56-78","86-75-30-90-00-00"],
            correctAnswers: ["FF-FF-FF-FF-FF-FF"]),
        Question(
            text: "A UDP datagram frame has______ fields.",
            choices: ["source port, destination port, length, data","source port, destination port, FCS, checksum, data.","source port, destination port, length, checksum, data.","data, (since it does care who gets it.)"],
            correctAnswers: ["source port, destination port, length, checksum, data."]),
        Question(
            text: "what is the difference between a vNIC and a NIC",
            choices: ["if set up correctly nothing","if set up correctly allow multiple office computers to communicate","if set up correctly separate Wi-fi and Ethernet","if set up correctly provide free internet"],
            correctAnswers: ["if set up correctly nothing"]),
        Question(
            text: "What software technology does the same layer 2 process as hardware does including features like VLANs.",
            choices: ["vSwitch","vNIC","vWLAN","vSAN"],
            correctAnswers: ["vSwitch"]),
        Question(
            text: "What is succession planning?",
            choices: ["Identifying personnel who can take over certain positions in response to an incident","The career path by which employees of an organization can grow through the ranks","The selection of failover servers in the even of a catastrophic server failure.","The selection of failover routers in the even of a catastrophic router failure"],
            correctAnswers:["Identifying personnel who can take over certain positions in response to an incident"]),
        Question(
            text: "Which of these describes the maximum time the organization can be without a critical system?",
            choices: ["Recover point objective (RPO)","Mean time between failure (MTBF)","Recovery time Objective (RTO)","Mean time to repair(MTTR)"],
            correctAnswers:["Recovery time Objective (RTO)"]),
        Question(
            text: "Which command shows you detailed IP information, including DNS server addresses and MAC addresses?",
            choices: ["ipconfig","ipconfig -a","ipconfig /all","ipconfig /dns"],
            correctAnswers:["ipconfig /all"]),
        Question(
            text: "Users need training from the IT department to understand which of the following?",
            choices: ["How to troubleshoot lost network connections","How to secure workstations with screen-locking and password-security techniques.","How to send e-mail to the change management team","How to check their network connection"],
            correctAnswers:["How to secure workstations with screen-locking and password-security techniques."]),
        Question(
            text: "Which deployment model uses employee-owned mobile devices for corporate use?",
            choices: ["BYOD","COBO","COPE","CYOD"],
            correctAnswers:["BYOD"]),
        Question(
            text: "_____ network connected all other computers on the network with a ring cable",
            choices: ["bus topology","ring topology","hybrid topology","star topology"],
            correctAnswers: ["ring topology"]),
        Question(
            text: "Which topology required termination points?",
            choices: ["ring","star","direct","bus"],
            correctAnswers: ["bus"]),
        Question(
            text: "The demarcation point is the client's responsibility.(true or false)",
            choices: ["true","false"],
            correctAnswers: ["false"]),
        Question(
            text: "Routers must use the same type of connection for all routes, such as Ethernet to Ethernet or DOCSIS to DOCSIS (True/False)",
            choices: ["True","False"],
            correctAnswers:["False"]),
        Question(
            text: "Which item should be found in a security policy?",
            choices: ["Acceptable use policy","Emergency exit plan","Service-level agreement","Instruction on how to fill out a change request form"],
            correctAnswers:["Acceptable use policy"]),
        Question(
            text: "Through what mechanism is a change to the IT structure initiated? ",
            choices: ["User make a change to their environment, then report the result to the change management team.","A user submits a request for funding a change to upper management, receives approval, and then submits a requisition to the change management team to source and purchase new equipment.","User submit a change request to the change management team.","The change management team issues a proposed change to users in the organization, then evaluated the responses."],
            correctAnswers:["User submit a change request to the change management team."]),
        Question(
            text: "_____ number and _____ number enable the sending and receiving computers to keep track of the various pieces of data flowing back-and-forth",
            choices: ["Port; authorization","Session; delivery","Port; acknowledgement","Sequence; acknowledgment"],
            correctAnswers: ["Sequence; acknowledgment"]),
        Question(
            text: "Ethernet frames encapsulate _______",
            choices: ["server data","IP packets","just the header and trailer","None of the above"],
            correctAnswers: ["IP packets"]),
        Question(
            text: "Jason is concerned about the communication between two workstations and wants to capture and analyze the traffic to see if anything illicit is going on. What tool would best serve his needs?",
            choices: ["Interface monitor","Packet flow monitor","Packet sniffer","Performance monitor"],
            correctAnswers:["Packet flow monitor"]),
        Question(
            text: "How the signals travel electronically in a topology is ______",
            choices: ["signaling(logical) topology","physical topology","practical topology","electronic topology"],
            correctAnswers: ["signaling(logical) topology"]),
        Question(
            text: "what provides a platform-agnostic labeling system to greatly improve performance compared to an IP network(choose the best answer)?",
            choices: ["direct host network","Sever based network","TCP/IP transmission","MPLS(multi-protocol label switching)"],
            correctAnswers: ["MPLS(multi-protocol label switching)"]),
        Question(
            text: "many telephone companies offer a _____ connection, a fully digital dedicated (no phone number) connection.",
            choices: ["DSL(digital subscriber line)","SNL(satellite network line)","PLL(public landline)","None of these you have to have a phone number for a digital connection."],
            correctAnswers: ["DSL(digital subscriber line)"]),
        Question(
            text: "What kind of DNS records do IPv6 addresses use?",
            choices: ["A","SIX","AAAA","NSSIX"],
            correctAnswers:["AAAA"]),
        Question(
            text: "A newly installed host uses what NDP control message type to find available routers on the network?",
            choices: ["Network advertisement ","Network solicitation","Router advertisement","Router solicitation"],
            correctAnswers:["Router solicitation"]),
        Question(
            text: "Where does a packet sniffer put information it collects?",
            choices: ["Answer file","Capture file","Pocket file","Sniffer file"],
            correctAnswers:["Capture file"]),
        Question(
            text: "A computer compromised with malware to support a botnet is called a ____.",
            choices: ["Zombie","Reflection","DDos","Locked node"],
            correctAnswers:["Zombie"]),
        Question(
            text: "____ involves building up longer sequences of automated steps.",
            choices: ["Composition","Containerization","Orchestration","Virtualization"],
            correctAnswers:["Orchestration"]),
        Question(
            text: "In SDN, the__ plane is responsible for setting up network devices to use the correct network controller.",
            choices: ["application","control","infrastructure","management"],
            correctAnswers:["management"]),
        Question(
            text: "Bob is told by his administrator to update his anti-malware program before he runs it. What kind of anti-malware is he most likely using?",
            choices: ["Host-based","Network-based","Cloud-based","FTP-based"],
            correctAnswers:["Host-based"]),
        Question(
            text: "A partly meshed topology network ____ machine(s) have redundant connections.",
            choices: ["every","at least two","only 1","None of the above"],
            correctAnswers: ["at least two"]),
        Question(
            text: "The ____ is the piece shrunken down to fit in its own bus box",
            choices: ["NIC","virtual segment","physical segment","PCLIe"],
            correctAnswers: ["physical segment"]),
        Question(
            text: "After the unforeseen failure of her Bigfoot picture sharing service, bgFootr-- which got hacked when she failed to stay on top of her security updates -- Janelle has a great new idea for a new service to report Loch Ness Monster sightings. What service would help her set up a server without having to play system administrator?",
            choices: ["Software as a service","Infrastructure as a service","Platform as a service","Desktop as a service"],
            correctAnswers:["Platform as a service"]),
        Question(
            text: "DTLS VPN acronym represents what kind of VPN?",
            choices: ["domain TLS","datagram TLS","download TLS","destructive TLS"],
            correctAnswers: ["datagram TLS"]),
        Question(
            text: "What technology allows you to share a single public IP address with many computers?",
            choices: ["Static address translation","Natural address translation","Compound public address translation","Port address translation"],
            correctAnswers:["Port address translation"]),
        Question(
            text: "Which of the following is a review of an organization's compliance with applicable laws, rules and regulations?",
            choices: ["Audit","Baseline configuration","Performance baseline","Site survey"],
            correctAnswers:["Audit"]),
        Question(
            text: "RTP runs on top of which protocol?",
            choices: ["UC server","STP","MGCP","H.323"],
            correctAnswers:["STP"]),
        
        
        // Add more questions...
    ]
    // Function to check if the user's answer is correct and update the score
    
    func toggleAnswerSelection(_ answer: String) {
        guard !hasAnswered else { return }
        
        if selectedAnswers.contains(answer) {
            selectedAnswers.removeAll { $0 == answer }
        } else {
            selectedAnswers.append(answer)
        }
    }
    
    func checkAnswer() {
        guard !hasAnswered else { return }
        let correctSet = Set(questions[currentQuestionIndex].correctAnswers)
        let selectedSet = Set(selectedAnswers)
        
        hasAnswered = true
        if correctSet == selectedSet {
            score += 1
            wrongStreak = 0
        } else {
            wrongStreak += 1
            if wrongStreak >= 6 {
                restartQuiz()
                quizFinished = true
            }
        }
    }
    
    func goToNextQuestion() {
        if currentQuestionIndex + 1 < questions.count {
            currentQuestionIndex += 1
            selectedAnswers = []
            hasAnswered = false
        }else {
            quizFinished = true
        }
    }
    

    func restartQuiz() {
        currentQuestionIndex = 0
        score = 0
        selectedAnswers = []
        hasAnswered = false
        wrongStreak = 0
    }
}

