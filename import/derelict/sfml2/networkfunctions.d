/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.sfml2.networkfunctions;

private
{
    import derelict.sfml2.systemtypes;
    import derelict.sfml2.networktypes;
}

extern(C)
{
    alias nothrow void function(sfFtpListingResponse* ftpListingResponse) da_sfFtpListingResponse_destroy;
    alias nothrow sfBool function(const(sfFtpListingResponse)* ftpListingResponse) da_sfFtpListingResponse_isOk;
    alias nothrow sfFtpStatus function(const(sfFtpListingResponse)* ftpListingResponse) da_sfFtpListingResponse_getStatus;
    alias nothrow const(char)* function(const(sfFtpListingResponse)* ftpListingResponse) da_sfFtpListingResponse_getMessage;
    alias nothrow size_t function(const(sfFtpListingResponse)* ftpListingResponse) da_sfFtpListingResponse_getCount;
    alias nothrow const(char)* function(const(sfFtpListingResponse)* ftpListingResponse,size_t index) da_sfFtpListingResponse_getFilename;
    alias nothrow void function(sfFtpDirectoryResponse* ftpDirectoryResponse) da_sfFtpDirectoryResponse_destroy;
    alias nothrow sfBool function(const(sfFtpDirectoryResponse)* ftpDirectoryResponse) da_sfFtpDirectoryResponse_isOk;
    alias nothrow sfFtpStatus function(const(sfFtpDirectoryResponse)* ftpDirectoryResponse) da_sfFtpDirectoryResponse_getStatus;
    alias nothrow const(char)* function(const(sfFtpDirectoryResponse)* ftpDirectoryResponse) da_sfFtpDirectoryResponse_getMessage;
    alias nothrow const(char)* function(const(sfFtpDirectoryResponse)* ftpDirectoryResponse) da_sfFtpDirectoryResponse_getDirectory;
    alias nothrow void function(sfFtpResponse* ftpResponse) da_sfFtpResponse_destroy;
    alias nothrow sfBool function(const(sfFtpResponse)* ftpResponse) da_sfFtpResponse_isOk;
    alias nothrow sfFtpStatus function(const(sfFtpResponse)* ftpResponse) da_sfFtpResponse_getStatus;
    alias nothrow const(char)* function(const(sfFtpResponse)* ftpResponse) da_sfFtpResponse_getMessage;
    alias nothrow sfFtp* function() da_sfFtp_create;
    alias nothrow void function(sfFtp* ftp) da_sfFtp_destroy;
    alias nothrow sfFtpResponse* function(sfFtp* ftp,sfIpAddress server,ushort port,sfUint32 timeout) da_sfFtp_connect;
    alias nothrow sfFtpResponse* function(sfFtp* ftp) da_sfFtp_loginAnonymous;
    alias nothrow sfFtpResponse* function(sfFtp* ftp,const(char)* userName,const(char)* password) da_sfFtp_login;
    alias nothrow sfFtpResponse* function(sfFtp* ftp) da_sfFtp_disconnect;
    alias nothrow sfFtpResponse* function(sfFtp* ftp) da_sfFtp_keepAlive;
    alias nothrow sfFtpDirectoryResponse* function(sfFtp* ftp) da_sfFtp_getWorkingDirectory;
    alias nothrow sfFtpListingResponse* function(sfFtp* ftp,const(char)* directory) da_sfFtp_getDirectoryListing;
    alias nothrow sfFtpResponse* function(sfFtp* ftp,const(char)* directory) da_sfFtp_changeDirectory;
    alias nothrow sfFtpResponse* function(sfFtp* ftp) da_sfFtp_parentDirectory;
    alias nothrow sfFtpResponse* function(sfFtp* ftp,const(char)* name) da_sfFtp_createDirectory;
    alias nothrow sfFtpResponse* function(sfFtp* ftp,const(char)* name) da_sfFtp_deleteDirectory;
    alias nothrow sfFtpResponse* function(sfFtp* ftp,const(char)* file,const(char)* newName) da_sfFtp_renameFile;
    alias nothrow sfFtpResponse* function(sfFtp* ftp,const(char)* name) da_sfFtp_deleteFile;
    alias nothrow sfFtpResponse* function(sfFtp* ftp,const(char)* distantFile,const(char)* destPath,sfFtpTransferMode mode) da_sfFtp_download;
    alias nothrow sfFtpResponse* function(sfFtp* ftp,const(char)* localFile,const(char)* destPath,sfFtpTransferMode mode) da_sfFtp_upload;
    alias nothrow sfHttpRequest* function() da_sfHttpRequest_create;
    alias nothrow void function(sfHttpRequest* httpRequest) da_sfHttpRequest_destroy;
    alias nothrow void function(sfHttpRequest* httpRequest,const(char)* field,const(char)* value) da_sfHttpRequest_setField;
    alias nothrow void function(sfHttpRequest* httpRequest,sfHttpMethod method) da_sfHttpRequest_setMethod;
    alias nothrow void function(sfHttpRequest* httpRequest,const(char)* uri) da_sfHttpRequest_setUri;
    alias nothrow void function(sfHttpRequest* httpRequest,uint major,uint minor) da_sfHttpRequest_setHttpVersion;
    alias nothrow void function(sfHttpRequest* httpRequest,const(char)* _body) da_sfHttpRequest_setBody;
    alias nothrow void function(sfHttpResponse* httpResponse) da_sfHttpResponse_destroy;
    alias nothrow const(char)* function(const(sfHttpResponse)* httpResponse,const(char)* field) da_sfHttpResponse_getField;
    alias nothrow sfHttpStatus function(const(sfHttpResponse)* httpResponse) da_sfHttpResponse_getStatus;
    alias nothrow uint function(const(sfHttpResponse)* httpResponse) da_sfHttpResponse_getMajorVersion;
    alias nothrow uint function(const(sfHttpResponse)* httpResponse) da_sfHttpResponse_getMinorVersion;
    alias nothrow const(char)* function(const(sfHttpResponse)* httpResponse) da_sfHttpResponse_getBody;
    alias nothrow sfHttp* function() da_sfHttp_create;
    alias nothrow void function(sfHttp* http) da_sfHttp_destroy;
    alias nothrow void function(sfHttp* http,const(char)* host,ushort port) da_sfHttp_setHost;
    alias nothrow sfHttpResponse* function(sfHttp* http,const(sfHttpRequest)* request,sfTime timeout) da_sfHttp_sendRequest;
    alias nothrow sfIpAddress function(const(char)* address) da_sfIpAddress_fromString;
    alias nothrow sfIpAddress function(sfUint8 byte0,sfUint8 byte1,sfUint8 byte2,sfUint8 byte3) da_sfIpAddress_fromBytes;
    alias nothrow sfIpAddress function(sfUint32 address) da_sfIpAddress_fromInteger;
    alias nothrow void function(sfIpAddress address,char* string) da_sfIpAddress_toString;
    alias nothrow sfUint32 function(sfIpAddress address) da_sfIpAddress_toInteger;
    alias nothrow sfIpAddress function() da_sfIpAddress_getLocalAddress;
    alias nothrow sfIpAddress function(sfTime timeout) da_sfIpAddress_getPublicAddress;
    alias nothrow sfPacket* function() da_sfPacket_create;
    alias nothrow sfPacket* function(sfPacket* packet) da_sfPacket_copy;
    alias nothrow void function(sfPacket* packet) da_sfPacket_destroy;
    alias nothrow void function(sfPacket* packet,const(void)* data,size_t sizeInBytes) da_sfPacket_append;
    alias nothrow void function(sfPacket* packet) da_sfPacket_clear;
    alias nothrow const(void)* function(const(sfPacket)* packet) da_sfPacket_getData;
    alias nothrow size_t function(const(sfPacket)* packet) da_sfPacket_getDataSize;
    alias nothrow sfBool function(const(sfPacket)* packet) da_sfPacket_endOfPacket;
    alias nothrow sfBool function(const(sfPacket)* packet) da_sfPacket_canRead;
    alias nothrow sfBool function(sfPacket* packet) da_sfPacket_readBool;
    alias nothrow sfInt8 function(sfPacket* packet) da_sfPacket_readInt8;
    alias nothrow sfUint8 function(sfPacket* packet) da_sfPacket_readUint8;
    alias nothrow sfInt16 function(sfPacket* packet) da_sfPacket_readInt16;
    alias nothrow sfUint16 function(sfPacket* packet) da_sfPacket_readUint16;
    alias nothrow sfInt32 function(sfPacket* packet) da_sfPacket_readInt32;
    alias nothrow sfUint32 function(sfPacket* packet) da_sfPacket_readUint32;
    alias nothrow float function(sfPacket* packet) da_sfPacket_readFloat;
    alias nothrow double function(sfPacket* packet) da_sfPacket_readDouble;
    alias nothrow void function(sfPacket* packet,char* string) da_sfPacket_readString;
    alias nothrow void function(sfPacket* packet,wchar* string) da_sfPacket_readWideString;
    alias nothrow void function(sfPacket* packet) da_sfPacket_writeBool;
    alias nothrow void function(sfPacket* packet) da_sfPacket_writeInt8;
    alias nothrow void function(sfPacket* packet) da_sfPacket_writeUint8;
    alias nothrow void function(sfPacket* packet) da_sfPacket_writeInt16;
    alias nothrow void function(sfPacket* packet) da_sfPacket_writeUint16;
    alias nothrow void function(sfPacket* packet) da_sfPacket_writeInt32;
    alias nothrow void function(sfPacket* packet) da_sfPacket_writeUint32;
    alias nothrow void function(sfPacket* packet) da_sfPacket_writeFloat;
    alias nothrow void function(sfPacket* packet) da_sfPacket_writeDouble;
    alias nothrow void function(sfPacket* packet,const(char)* string) da_sfPacket_writeString;
    alias nothrow void function(sfPacket* packet,const(wchar)* string) da_sfPacket_writeWideString;
    alias nothrow sfSocketSelector* function() da_sfSocketSelector_create;
    alias nothrow sfSocketSelector* function(sfSocketSelector* selector) da_sfSocketSelector_copy;
    alias nothrow void function(sfSocketSelector* selector) da_sfSocketSelector_destroy;
    alias nothrow void function(sfSocketSelector* selector,sfTcpListener* socket) da_sfSocketSelector_addTcpListener;
    alias nothrow void function(sfSocketSelector* selector,sfTcpSocket* socket) da_sfSocketSelector_addTcpSocket;
    alias nothrow void function(sfSocketSelector* selector,sfUdpSocket* socket) da_sfSocketSelector_addUdpSocket;
    alias nothrow void function(sfSocketSelector* selector,sfTcpListener* socket) da_sfSocketSelector_removeTcpListener;
    alias nothrow void function(sfSocketSelector* selector,sfTcpSocket* socket) da_sfSocketSelector_removeTcpSocket;
    alias nothrow void function(sfSocketSelector* selector,sfUdpSocket* socket) da_sfSocketSelector_removeUdpSocket;
    alias nothrow void function(sfSocketSelector* selector) da_sfSocketSelector_clear;
    alias nothrow sfBool function(sfSocketSelector* selector,sfTime timeout) da_sfSocketSelector_wait;
    alias nothrow sfBool function(const(sfSocketSelector)* selector,sfTcpListener* socket) da_sfSocketSelector_isTcpListenerReady;
    alias nothrow sfBool function(const(sfSocketSelector)* selector,sfTcpSocket* socket) da_sfSocketSelector_isTcpSocketReady;
    alias nothrow sfBool function(const(sfSocketSelector)* selector,sfUdpSocket* socket) da_sfSocketSelector_isUdpSocketReady;
    alias nothrow sfTcpListener* function() da_sfTcpListener_create;
    alias nothrow void function(sfTcpListener* listener) da_sfTcpListener_destroy;
    alias nothrow void function(sfTcpListener* listener,sfBool blocking) da_sfTcpListener_setBlocking;
    alias nothrow sfBool function(const(sfTcpListener)* listener) da_sfTcpListener_isBlocking;
    alias nothrow ushort function(const(sfTcpListener)* listener) da_sfTcpListener_getLocalPort;
    alias nothrow sfSocketStatus function(sfTcpListener* listener,ushort port) da_sfTcpListener_listen;
    alias nothrow sfSocketStatus function(sfTcpListener* listener,sfTcpSocket** connected) da_sfTcpListener_accept;
    alias nothrow sfTcpSocket* function() da_sfTcpSocket_create;
    alias nothrow void function(sfTcpSocket* socket) da_sfTcpSocket_destroy;
    alias nothrow void function(sfTcpSocket* socket,sfBool blocking) da_sfTcpSocket_setBlocking;
    alias nothrow sfBool function(const(sfTcpSocket)* socket) da_sfTcpSocket_isBlocking;
    alias nothrow ushort function(const(sfTcpSocket)* socket) da_sfTcpSocket_getLocalPort;
    alias nothrow sfIpAddress function(const(sfTcpSocket)* socket) da_sfTcpSocket_getRemoteAddress;
    alias nothrow ushort function(const(sfTcpSocket)* socket) da_sfTcpSocket_getRemotePort;
    alias nothrow sfSocketStatus function(sfTcpSocket* socket,sfIpAddress host,ushort port,sfTime timeout) da_sfTcpSocket_connect;
    alias nothrow void function(sfTcpSocket* socket) da_sfTcpSocket_disconnect;
    alias nothrow sfSocketStatus function(sfTcpSocket* socket,const(void)* data,size_t size) da_sfTcpSocket_send;
    alias nothrow sfSocketStatus function(sfTcpSocket* socket,void* data,size_t maxSize,size_t* sizeReceived) da_sfTcpSocket_receive;
    alias nothrow sfSocketStatus function(sfTcpSocket* socket,sfPacket* packet) da_sfTcpSocket_sendPacket;
    alias nothrow sfSocketStatus function(sfTcpSocket* socket,sfPacket* packet) da_sfTcpSocket_receivePacket;
    alias nothrow sfUdpSocket* function() da_sfUdpSocket_create;
    alias nothrow void function(sfUdpSocket* socket) da_sfUdpSocket_destroy;
    alias nothrow void function(sfUdpSocket* socket,sfBool blocking) da_sfUdpSocket_setBlocking;
    alias nothrow sfBool function(const(sfUdpSocket)* socket) da_sfUdpSocket_isBlocking;
    alias nothrow short function(const(sfUdpSocket)* socket) da_sfUdpSocket_getLocalPort;
    alias nothrow sfSocketStatus function(sfUdpSocket* socket,ushort port) da_sfUdpSocket_bind;
    alias nothrow void function(sfUdpSocket* socket) da_sfUdpSocket_unbind;
    alias nothrow sfSocketStatus function(sfUdpSocket* socket,const(void)* data,size_t size,sfIpAddress address,ushort port) da_sfUdpSocket_send;
    alias nothrow sfSocketStatus function(sfUdpSocket* socket,void* data,size_t maxSize,size_t* sizeReceived,sfIpAddress* address,ushort* port) da_sfUdpSocket_receive;
    alias nothrow sfSocketStatus function(sfUdpSocket* socket,sfPacket* packet,sfIpAddress address,ushort port) da_sfUdpSocket_sendPacket;
    alias nothrow sfSocketStatus function(sfUdpSocket* socket,sfPacket* packet,sfIpAddress* address,ushort* port) da_sfUdpSocket_receivePacket;
    alias nothrow uint function() da_sfUdpSocket_maxDatagramSize;
}

__gshared
{
    da_sfFtpListingResponse_destroy sfFtpListingResponse_destroy;
    da_sfFtpListingResponse_isOk sfFtpListingResponse_isOk;
    da_sfFtpListingResponse_getStatus sfFtpListingResponse_getStatus;
    da_sfFtpListingResponse_getMessage sfFtpListingResponse_getMessage;
    da_sfFtpListingResponse_getCount sfFtpListingResponse_getCount;
    da_sfFtpListingResponse_getFilename sfFtpListingResponse_getFilename;
    da_sfFtpDirectoryResponse_destroy sfFtpDirectoryResponse_destroy;
    da_sfFtpDirectoryResponse_isOk sfFtpDirectoryResponse_isOk;
    da_sfFtpDirectoryResponse_getStatus sfFtpDirectoryResponse_getStatus;
    da_sfFtpDirectoryResponse_getMessage sfFtpDirectoryResponse_getMessage;
    da_sfFtpDirectoryResponse_getDirectory sfFtpDirectoryResponse_getDirectory;
    da_sfFtpResponse_destroy sfFtpResponse_destroy;
    da_sfFtpResponse_isOk sfFtpResponse_isOk;
    da_sfFtpResponse_getStatus sfFtpResponse_getStatus;
    da_sfFtpResponse_getMessage sfFtpResponse_getMessage;
    da_sfFtp_create sfFtp_create;
    da_sfFtp_destroy sfFtp_destroy;
    da_sfFtp_connect sfFtp_connect;
    da_sfFtp_loginAnonymous sfFtp_loginAnonymous;
    da_sfFtp_login sfFtp_login;
    da_sfFtp_disconnect sfFtp_disconnect;
    da_sfFtp_keepAlive sfFtp_keepAlive;
    da_sfFtp_getWorkingDirectory sfFtp_getWorkingDirectory;
    da_sfFtp_getDirectoryListing sfFtp_getDirectoryListing;
    da_sfFtp_changeDirectory sfFtp_changeDirectory;
    da_sfFtp_parentDirectory sfFtp_parentDirectory;
    da_sfFtp_createDirectory sfFtp_createDirectory;
    da_sfFtp_deleteDirectory sfFtp_deleteDirectory;
    da_sfFtp_renameFile sfFtp_renameFile;
    da_sfFtp_deleteFile sfFtp_deleteFile;
    da_sfFtp_download sfFtp_download;
    da_sfFtp_upload sfFtp_upload;
    da_sfHttpRequest_create sfHttpRequest_create;
    da_sfHttpRequest_destroy sfHttpRequest_destroy;
    da_sfHttpRequest_setField sfHttpRequest_setField;
    da_sfHttpRequest_setMethod sfHttpRequest_setMethod;
    da_sfHttpRequest_setUri sfHttpRequest_setUri;
    da_sfHttpRequest_setHttpVersion sfHttpRequest_setHttpVersion;
    da_sfHttpRequest_setBody sfHttpRequest_setBody;
    da_sfHttpResponse_destroy sfHttpResponse_destroy;
    da_sfHttpResponse_getField sfHttpResponse_getField;
    da_sfHttpResponse_getStatus sfHttpResponse_getStatus;
    da_sfHttpResponse_getMajorVersion sfHttpResponse_getMajorVersion;
    da_sfHttpResponse_getMinorVersion sfHttpResponse_getMinorVersion;
    da_sfHttpResponse_getBody sfHttpResponse_getBody;
    da_sfHttp_create sfHttp_create;
    da_sfHttp_destroy sfHttp_destroy;
    da_sfHttp_setHost sfHttp_setHost;
    da_sfHttp_sendRequest sfHttp_sendRequest;
    da_sfIpAddress_fromString sfIpAddress_fromString;
    da_sfIpAddress_fromBytes sfIpAddress_fromBytes;
    da_sfIpAddress_fromInteger sfIpAddress_fromInteger;
    da_sfIpAddress_toString sfIpAddress_toString;
    da_sfIpAddress_toInteger sfIpAddress_toInteger;
    da_sfIpAddress_getLocalAddress sfIpAddress_getLocalAddress;
    da_sfIpAddress_getPublicAddress sfIpAddress_getPublicAddress;
    da_sfPacket_create sfPacket_create;
    da_sfPacket_copy sfPacket_copy;
    da_sfPacket_destroy sfPacket_destroy;
    da_sfPacket_append sfPacket_append;
    da_sfPacket_clear sfPacket_clear;
    da_sfPacket_getData sfPacket_getData;
    da_sfPacket_getDataSize sfPacket_getDataSize;
    da_sfPacket_endOfPacket sfPacket_endOfPacket;
    da_sfPacket_canRead sfPacket_canRead;
    da_sfPacket_readBool sfPacket_readBool;
    da_sfPacket_readInt8 sfPacket_readInt8;
    da_sfPacket_readUint8 sfPacket_readUint8;
    da_sfPacket_readInt16 sfPacket_readInt16;
    da_sfPacket_readUint16 sfPacket_readUint16;
    da_sfPacket_readInt32 sfPacket_readInt32;
    da_sfPacket_readUint32 sfPacket_readUint32;
    da_sfPacket_readFloat sfPacket_readFloat;
    da_sfPacket_readDouble sfPacket_readDouble;
    da_sfPacket_readString sfPacket_readString;
    da_sfPacket_readWideString sfPacket_readWideString;
    da_sfPacket_writeBool sfPacket_writeBool;
    da_sfPacket_writeInt8 sfPacket_writeInt8;
    da_sfPacket_writeUint8 sfPacket_writeUint8;
    da_sfPacket_writeInt16 sfPacket_writeInt16;
    da_sfPacket_writeUint16 sfPacket_writeUint16;
    da_sfPacket_writeInt32 sfPacket_writeInt32;
    da_sfPacket_writeUint32 sfPacket_writeUint32;
    da_sfPacket_writeFloat sfPacket_writeFloat;
    da_sfPacket_writeDouble sfPacket_writeDouble;
    da_sfPacket_writeString sfPacket_writeString;
    da_sfPacket_writeWideString sfPacket_writeWideString;
    da_sfSocketSelector_create sfSocketSelector_create;
    da_sfSocketSelector_copy sfSocketSelector_copy;
    da_sfSocketSelector_destroy sfSocketSelector_destroy;
    da_sfSocketSelector_addTcpListener sfSocketSelector_addTcpListener;
    da_sfSocketSelector_addTcpSocket sfSocketSelector_addTcpSocket;
    da_sfSocketSelector_addUdpSocket sfSocketSelector_addUdpSocket;
    da_sfSocketSelector_removeTcpListener sfSocketSelector_removeTcpListener;
    da_sfSocketSelector_removeTcpSocket sfSocketSelector_removeTcpSocket;
    da_sfSocketSelector_removeUdpSocket sfSocketSelector_removeUdpSocket;
    da_sfSocketSelector_clear sfSocketSelector_clear;
    da_sfSocketSelector_wait sfSocketSelector_wait;
    da_sfSocketSelector_isTcpListenerReady sfSocketSelector_isTcpListenerReady;
    da_sfSocketSelector_isTcpSocketReady sfSocketSelector_isTcpSocketReady;
    da_sfSocketSelector_isUdpSocketReady sfSocketSelector_isUdpSocketReady;
    da_sfTcpListener_create sfTcpListener_create;
    da_sfTcpListener_destroy sfTcpListener_destroy;
    da_sfTcpListener_setBlocking sfTcpListener_setBlocking;
    da_sfTcpListener_isBlocking sfTcpListener_isBlocking;
    da_sfTcpListener_getLocalPort sfTcpListener_getLocalPort;
    da_sfTcpListener_listen sfTcpListener_listen;
    da_sfTcpListener_accept sfTcpListener_accept;
    da_sfTcpSocket_create sfTcpSocket_create;
    da_sfTcpSocket_destroy sfTcpSocket_destroy;
    da_sfTcpSocket_setBlocking sfTcpSocket_setBlocking;
    da_sfTcpSocket_isBlocking sfTcpSocket_isBlocking;
    da_sfTcpSocket_getLocalPort sfTcpSocket_getLocalPort;
    da_sfTcpSocket_getRemoteAddress sfTcpSocket_getRemoteAddress;
    da_sfTcpSocket_getRemotePort sfTcpSocket_getRemotePort;
    da_sfTcpSocket_connect sfTcpSocket_connect;
    da_sfTcpSocket_disconnect sfTcpSocket_disconnect;
    da_sfTcpSocket_send sfTcpSocket_send;
    da_sfTcpSocket_receive sfTcpSocket_receive;
    da_sfTcpSocket_sendPacket sfTcpSocket_sendPacket;
    da_sfTcpSocket_receivePacket sfTcpSocket_receivePacket;
    da_sfUdpSocket_create sfUdpSocket_create;
    da_sfUdpSocket_destroy sfUdpSocket_destroy;
    da_sfUdpSocket_setBlocking sfUdpSocket_setBlocking;
    da_sfUdpSocket_isBlocking sfUdpSocket_isBlocking;
    da_sfUdpSocket_getLocalPort sfUdpSocket_getLocalPort;
    da_sfUdpSocket_bind sfUdpSocket_bind;
    da_sfUdpSocket_unbind sfUdpSocket_unbind;
    da_sfUdpSocket_send sfUdpSocket_send;
    da_sfUdpSocket_receive sfUdpSocket_receive;
    da_sfUdpSocket_sendPacket sfUdpSocket_sendPacket;
    da_sfUdpSocket_receivePacket sfUdpSocket_receivePacket;
    da_sfUdpSocket_maxDatagramSize sfUdpSocket_maxDatagramSize;
}