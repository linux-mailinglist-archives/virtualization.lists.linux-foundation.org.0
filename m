Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B816E16BB26
	for <lists.virtualization@lfdr.de>; Tue, 25 Feb 2020 08:43:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6DC9F8493F;
	Tue, 25 Feb 2020 07:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 63ro1608rxkd; Tue, 25 Feb 2020 07:43:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4899F860D1;
	Tue, 25 Feb 2020 07:43:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23660C0177;
	Tue, 25 Feb 2020 07:43:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57219C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 07:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3FA8820028
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 07:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tTucx2-0A5mT
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 07:43:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www.kot-begemot.co.uk (ivanoab7.miniserver.com [37.128.132.42])
 by silver.osuosl.org (Postfix) with ESMTPS id 514A11FD7D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 07:43:35 +0000 (UTC)
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6]
 helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j6UsM-0000xu-R3; Tue, 25 Feb 2020 07:43:31 +0000
Received: from jain.kot-begemot.co.uk ([192.168.3.3])
 by jain.kot-begemot.co.uk with esmtp (Exim 4.92)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j6UsK-0007eU-Cm; Tue, 25 Feb 2020 07:43:30 +0000
Subject: Re: [PATCH v3] virtio: Work around frames incorrectly marked as gso
To: Jason Wang <jasowang@redhat.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
References: <20200224132550.2083-1-anton.ivanov@cambridgegreys.com>
 <CA+FuTSd8P6uQnwisZEh7+nfowW9qKLBEvA4GPg+xUkjBa-6TDA@mail.gmail.com>
 <4e7757cf-148e-4585-b358-3b38f391275d@cambridgegreys.com>
 <CA+FuTSdOCJZCVS4xohx+BQmkmq8JALnK=gGc0=qy1TbjY707ag@mail.gmail.com>
 <93cb2b3f-6cae-8cf1-5fab-93fa34c14628@cambridgegreys.com>
 <CA+FuTScEXRwYtFzn-jtFhV0dNKNQqKPBwCWaNORJW=ERU=izMA@mail.gmail.com>
 <1af28666-1d27-8c9e-7225-2796a9f7336e@redhat.com>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Message-ID: <86d6945d-a569-f0e5-e868-dfccbdb5701f@cambridgegreys.com>
Date: Tue, 25 Feb 2020 07:43:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1af28666-1d27-8c9e-7225-2796a9f7336e@redhat.com>
Content-Language: en-US
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Network Development <netdev@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, linux-um@lists.infradead.org,
 Eric Dumazet <eric.dumazet@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CgpPbiAyNS8wMi8yMDIwIDA0OjAyLCBKYXNvbiBXYW5nIHdyb3RlOgo+IAo+IE9uIDIwMjAvMi8y
NSDkuIrljYg2OjIyLCBXaWxsZW0gZGUgQnJ1aWpuIHdyb3RlOgo+PiBPbiBNb24sIEZlYiAyNCwg
MjAyMCBhdCA0OjAwIFBNIEFudG9uIEl2YW5vdgo+PiA8YW50b24uaXZhbm92QGNhbWJyaWRnZWdy
ZXlzLmNvbT4gd3JvdGU6Cj4+PiBPbiAyNC8wMi8yMDIwIDIwOjIwLCBXaWxsZW0gZGUgQnJ1aWpu
IHdyb3RlOgo+Pj4+IE9uIE1vbiwgRmViIDI0LCAyMDIwIGF0IDI6NTUgUE0gQW50b24gSXZhbm92
Cj4+Pj4gPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5jb20+IHdyb3RlOgo+Pj4+PiBPbiAy
NC8wMi8yMDIwIDE5OjI3LCBXaWxsZW0gZGUgQnJ1aWpuIHdyb3RlOgo+Pj4+Pj4gT24gTW9uLCBG
ZWIgMjQsIDIwMjAgYXQgODoyNiBBTSA8YW50b24uaXZhbm92QGNhbWJyaWRnZWdyZXlzLmNvbT4g
d3JvdGU6Cj4+Pj4+Pj4gRnJvbTogQW50b24gSXZhbm92IDxhbnRvbi5pdmFub3ZAY2FtYnJpZGdl
Z3JleXMuY29tPgo+Pj4+Pj4+Cj4+Pj4+Pj4gU29tZSBvZiB0aGUgbG9jYWxseSBnZW5lcmF0ZWQg
ZnJhbWVzIG1hcmtlZCBhcyBHU08gd2hpY2gKPj4+Pj4+PiBhcnJpdmUgYXQgdmlydGlvX25ldF9o
ZHJfZnJvbV9za2IoKSBoYXZlIG5vIEdTT19UWVBFLCBubwo+Pj4+Pj4+IGZyYWdtZW50cyAoZGF0
YV9sZW4gPSAwKSBhbmQgbGVuZ3RoIHNpZ25pZmljYW50bHkgc2hvcnRlcgo+Pj4+Pj4+IHRoYW4g
dGhlIE1UVSAoNzUyIGluIG15IGV4cGVyaW1lbnRzKS4KPj4+Pj4+IERvIHdlIHVuZGVyc3RhbmQg
aG93IHRoZXNlIHBhY2tldHMgYXJlIGdlbmVyYXRlZD8KPj4+Pj4gTm8sIHdlIGhhdmUgbm90IGJl
ZW4gYWJsZSB0byB0cmFjZSB0aGVtLgo+Pj4+Pgo+Pj4+PiBUaGUgb25seSB0aGluZyB3ZSBrbm93
IGlzIHRoYXQgdGhpcyBpcyBzcGVjaWZpYyB0byBsb2NhbGx5IGdlbmVyYXRlZAo+Pj4+PiBwYWNr
ZXRzLiBTb21ldGhpbmcgYXJyaXZpbmcgZnJvbSB0aGUgbmV0d29yayBkb2VzIG5vdCBzaG93IHRo
aXMuCj4+Pj4+Cj4+Pj4+PiBFbHNlIGl0IHNlZW1zIHRoaXMKPj4+Pj4+IG1pZ2h0IGJlIHBhcGVy
aW5nIG92ZXIgYSBkZWVwZXIgcHJvYmxlbS4KPj4+Pj4+Cj4+Pj4+PiBUaGUgc3RhY2sgc2hvdWxk
IG5vdCBjcmVhdGUgR1NPIHBhY2tldHMgbGVzcyB0aGFuIG9yIGVxdWFsIHRvCj4+Pj4+PiBza2Jf
c2hpbmZvKHNrYiktPmdzb19zaXplLiBTZWUgZm9yIGluc3RhbmNlIHRoZSBjaGVjayBpbgo+Pj4+
Pj4gdGNwX2dzb19zZWdtZW50IGFmdGVyIHB1bGxpbmcgdGhlIHRjcCBoZWFkZXI6Cj4+Pj4+Pgo+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXNzID0gc2tiX3NoaW5mbyhza2IpLT5nc29fc2l6
ZTsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh1bmxpa2VseShza2ItPmxlbiA8PSBt
c3MpKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0
Owo+Pj4+Pj4KPj4+Pj4+IFdoYXQgaXMgdGhlIGdzb190eXBlLCBhbmQgZG9lcyBpdCBpbmNsdWRl
IFNLQl9HU09fRE9ER1k/Cj4+Pj4+Pgo+Pj4+PiAwIC0gbm90IHNldC4KPj4+PiBUaGFua3MgZm9y
IHRoZSBmb2xsb3ctdXAgZGV0YWlscy4gSXMgdGhpcyBzb21ldGhpbmcgdGhhdCB5b3UgY2FuIHRy
aWdnZXIgZWFzaWx5Pwo+Pj4gWWVzLCBpZiB5b3UgaGF2ZSBhIFVNTCBpbnN0YW5jZSBoYW5keS4K
Pj4+Cj4+PiBSdW5uaW5nIGlwZXJmIGJldHdlZW4gdGhlIGhvc3QgYW5kIGEgVU1MIGd1ZXN0IHVz
aW5nIHJhdyBzb2NrZXQKPj4+IHRyYW5zcG9ydCB0cmlnZ2VycyBpdCBpbW1lZGlhdGVseS4KPj4+
Cj4+PiBUaGlzIGlzIG15IFVNTCBjb21tYW5kIGxpbmU6Cj4+Pgo+Pj4gdm1saW51eCBtZW09MjA0
OE0gdW1pZD1PUFggXAo+Pj4gwqDCoMKgwqDCoCB1YmQwPU9QWC0zLjAtV29yay5pbWcgXAo+Pj4g
dmVjMDp0cmFuc3BvcnQ9cmF3LGlmbmFtZT1wLXZldGgwLGRlcHRoPTEyOCxncm89MSxtYWM9OTI6
OWI6MzY6NWU6Mzg6NjkgXAo+Pj4gwqDCoMKgwqDCoCByb290PS9kZXYvdWJkYSBybyBjb249bnVs
bCBjb24wPW51bGwsZmQ6MiBjb24xPWZkOjAsZmQ6MQo+Pj4KPj4+IHAtcmlnaHQgaXMgYSBwYXJ0
IG9mIGEgdkV0aCBwYWlyOgo+Pj4KPj4+IGlwIGxpbmsgYWRkIGwtdmV0aDAgdHlwZSB2ZXRoIHBl
ZXIgbmFtZSBwLXZldGgwICYmIGlmY29uZmlnIHAtdmV0aDAgdXAKPj4+Cj4+PiBpcGVyZiBzZXJ2
ZXIgaXMgb24gaG9zdCwgaXBlcmYgLWMgaW4gdGhlIGd1ZXN0Lgo+Pj4KPj4+PiBBbiBza2JfZHVt
cCgpICsgZHVtcF9zdGFjaygpIHdoZW4gdGhlIHBhY2tldCBzb2NrZXQgZ2V0cyBzdWNoIGEKPj4+
PiBwYWNrZXQgbWF5IHBvaW50IHVzIHRvIHRoZSByb290IGNhdXNlIGFuZCBmaXggdGhhdC4KPj4+
IFdlIHRyaWVkIGR1bXAgc3RhY2ssIGl0IHdhcyBub3QgaW5mb3JtYXRpdmUgLSBpdCB3YXMganVz
dCB0aGUgcmVjdm1tc2cKPj4+IGNhbGwgc3RhY2sgY29taW5nIGZyb20gdGhlIFVNTCB1bnRpbCBp
dCBoaXRzIHRoZSByZWxldmFudCByZWN2IGJpdCBpbgo+Pj4gYWZfcGFja2V0IC0gaXQgZG9lcyBu
b3QgdGVsbCB1cyB3aGVyZSB0aGUgcGFja2V0IGlzIGNvbWluZyBmcm9tLgo+Pj4KPj4+IFF1b3Rp
bmcgZnJvbSB0aGUgbWVzc2FnZSBlYXJsaWVyIGluIHRoZSB0aHJlYWQ6Cj4+Pgo+Pj4gWyAyMzM0
LjE4MDg1NF0gQ2FsbCBUcmFjZToKPj4+IFsgMjMzNC4xODE5NDddwqAgZHVtcF9zdGFjaysweDVj
LzB4ODAKPj4+IFsgMjMzNC4xODMwMjFdwqAgcGFja2V0X3JlY3Ztc2cuY29sZCsweDIzLzB4NDkK
Pj4+IFsgMjMzNC4xODQwNjNdwqAgX19fc3lzX3JlY3Ztc2crMHhlMS8weDFmMAo+Pj4gWyAyMzM0
LjE4NTAzNF3CoCA/IHBhY2tldF9wb2xsKzB4Y2EvMHgxMzAKPj4+IFsgMjMzNC4xODYwMTRdwqAg
PyBzb2NrX3BvbGwrMHg3Ny8weGIwCj4+PiBbIDIzMzQuMTg2OTc3XcKgID8gZXBfaXRlbV9wb2xs
LmlzcmEuMCsweDNmLzB4YjAKPj4+IFsgMjMzNC4xODc5MzZdwqAgPyBlcF9zZW5kX2V2ZW50c19w
cm9jKzB4ZjEvMHgyNDAKPj4+IFsgMjMzNC4xODg5MDFdwqAgPyBkZXF1ZXVlX3NpZ25hbCsweGRi
LzB4MTgwCj4+PiBbIDIzMzQuMTg5ODQ4XcKgIGRvX3JlY3ZtbXNnKzB4YzgvMHgyZDAKPj4+IFsg
MjMzNC4xOTA3MjhdwqAgPyBlcF9wb2xsKzB4OGMvMHg0NzAKPj4+IFsgMjMzNC4xOTE1ODFdwqAg
X19zeXNfcmVjdm1tc2crMHgxMDgvMHgxNTAKPj4+IFsgMjMzNC4xOTI0NDFdwqAgX194NjRfc3lz
X3JlY3ZtbXNnKzB4MjUvMHgzMAo+Pj4gWyAyMzM0LjE5MzM0Nl3CoCBkb19zeXNjYWxsXzY0KzB4
NTMvMHgxNDAKPj4+IFsgMjMzNC4xOTQyNjJdwqAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2Zy
YW1lKzB4NDQvMHhhOQo+PiBUaGF0IG1ha2VzIHNlbnNlLiBza2JfZHVtcCBtaWdodCBzaG93IG1v
cmUgaW50ZXJlc3RpbmcgZGV0YWlscyBhYm91dAo+PiB0aGUgcGFja2V0LiBGcm9tIHRoZSBwcmV2
aW91cyB0aHJlYWQsIHRoZXNlIGFyZSBhc3N1bWVkIHRvIGJlIFRDUAo+PiBwYWNrZXRzPwo+Pgo+
PiBJIGhhZCBtaXNzZWQgdGhlIG9yaWdpbmFsIHRocmVhZC4gSWYgdGhlIHBhY2tldCBoYXMKPj4K
Pj4gwqDCoMKgwqAgc2luZm8oc2tiKS0+Z3NvX3NpemUgPSA3NTIuCj4+IMKgwqDCoMKgIHNrYi0+
bGVuID0gODE4Cj4+Cj4+IHRoZW4gdGhpcyBpcyBhIEdTTyBwYWNrZXQuIEV2ZW4gdGhvdWdoIFVN
TCB3aWxsIGNvcnJlY3RseSBwcm9jZXNzIGl0Cj4+IGFzIGEgbm9ybWFsIDgxOCBCIHBhY2tldCBp
ZiBwc29ja19yY3YgcHJldGVuZHMgdGhhdCBpdCBpcywgdHJlYXRpbmcgaXQKPj4gbGlrZSB0aGF0
IGlzIG5vdCBzdHJpY3RseSBjb3JyZWN0LiBBIHJlbGF0ZWQgcXVlc3Rpb24gaXMgaG93IHRoZSBz
ZXR1cAo+PiBhcnJpdmVkIGF0IHRoYXQgbG93IE1UVSBzaXplLCBhc3N1bWluZyB0aGF0IGlzIG5v
dCBleHBsaWNpdGx5Cj4+IGNvbmZpZ3VyZWQgdGhhdCBsb3cuCj4+Cj4+IEFzIG9mIGNvbW1pdCA1
MTQ2NmE3NTQ1YjcgKCJ0Y3A6IGZpbGwgc2hpbmZvLT5nc29fdHlwZSBhdCBsYXN0Cj4+IG1vbWVu
dCIpIHRjcCB1bmNvbmRpdGlvbmFsbHkgc2V0cyBnc29fdHlwZSwgZXZlbiBmb3Igbm9uIGdzbyBw
YWNrZXRzLgo+PiBTbyBlaXRoZXIgdGhpcyBpcyBub3QgYSB0Y3AgcGFja2V0IG9yIHRoZSBmaWVs
ZCBnZXRzIHplcm9lZCBzb21ld2hlcmUKPj4gYWxvbmcgdGhlIHdheS4gSSBjb3VsZCBub3QgcXVp
Y2tseSBmaW5kIGEgcG9zc2libGUgcGF0aCB0bwo+PiBza2JfZ3NvX3Jlc2V0IG9yIGEgcmF3IHdy
aXRlLgo+Pgo+PiBJdCBtYXkgYmUgdXNlZnVsIHRvIGluc2VydCB0ZXN0cyBmb3IgdGhpcyBjb25k
aXRpb24gKHNrYl9pc19nc28oc2tiKQo+PiAmJiAhc2tiX3NoaW5mbyhza2IpLT5nc29fdHlwZSkg
dGhhdCBjYWxsIHNrYl9kdW1wIGF0IG90aGVyIHBvaW50cyBpbgo+PiB0aGUgbmV0d29yayBzdGFj
ay4gRm9yIGluc3RhbmNlIGluIF9faXBfcXVldWVfeG1pdCBhbmQKPj4gX19kZXZfcXVldWVfeG1p
dC4KPiAKPiAKPiArMQo+IAo+IFdlIG1lZXQgc29tZSBjdXN0b21lciBoaXQgc3VjaCBjb25kaXRp
b24gYXMgd2VsbCB3aGljaCBsZWFkIG92ZXIgTVRVIHBhY2tldCB0byBiZSBxdWV1ZWQgYnkgVEFQ
IHdoaWNoIGNyYXNoZXMgdGhlaXIgYnVnZ3kgdXNlcnNwYWNlIGFwcGxpY2F0aW9uLgo+IAo+IFdl
IHN1c3BlY3QgaXQncyB0aGUgaXNzdWUgb2Ygd3JvbmcgZ3NvX3R5cGUgdnMgZ3NvX3NpemUuCgpX
ZWxsLCB3ZSBub3cgaGF2ZSBhIHRlc3QgY2FzZSB3aGVyZSBhbGwgdGhlIGNvZGUgaXMgYXZhaWxh
YmxlIGFuZCAxMDAlIHVuZGVyIG91ciBjb250cm9sIDopCgpCcmdkcywKCj4gCj4gVGhhbmtzCj4g
Cj4gCj4+Cj4+IFNpbmNlIHNrYiBzZWdtZW50YXRpb24gZmFpbHMgaW4gdGNwX2dzb19zZWdtZW50
IGZvciBzdWNoIHBhY2tldHMsIGl0Cj4+IG1heSBhbHNvIGJlIGluZm9ybWF0aXZlIHRvIGRpc2Fi
bGUgVFNPIG9uIHRoZSB2ZXRoIGRldmljZSBhbmQgc2VlIGlmCj4+IHRoZSB0ZXN0IGZhaWxzLgo+
Pgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gbGludXgtdW0gbWFpbGluZyBsaXN0Cj4gbGludXgtdW1AbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtdW0KCi0t
IApBbnRvbiBSLiBJdmFub3YKQ2FtYnJpZGdlZ3JleXMgTGltaXRlZC4gUmVnaXN0ZXJlZCBpbiBF
bmdsYW5kLiBDb21wYW55IE51bWJlciAxMDI3MzY2MQpodHRwczovL3d3dy5jYW1icmlkZ2VncmV5
cy5jb20vCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
