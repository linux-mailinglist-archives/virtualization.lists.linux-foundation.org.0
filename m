Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A861B1BDF
	for <lists.virtualization@lfdr.de>; Tue, 21 Apr 2020 04:27:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9B23187E14;
	Tue, 21 Apr 2020 02:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 66VnkCGT4fhl; Tue, 21 Apr 2020 02:27:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CD32D86DCA;
	Tue, 21 Apr 2020 02:27:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC44FC0175;
	Tue, 21 Apr 2020 02:27:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFABDC0175
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 02:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A21A921511
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 02:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d0iAiRnfexKM
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 02:27:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 250B020527
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 02:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587436062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIuPfMXVgjCpv9MlxvGB/R8vQTIoKax5wzQ+5UKEudw=;
 b=GO+edkHQ/LoCrDYcTyJccTUUqMGb0v4tRXEwo10UgNf6AlXVdt5uTgcNVmnokShtJpf2+W
 bsMIdQequnLFueWI+QSDlZTcX1Erm9sDScBVSsD0RuajuVGb3tUjkzKzSrQzAdRhj0eKTB
 tq5ei5qX+eJuWCgU33tXiJdKetXYsZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-aWoUFW9gO0imRlDrPR6qbQ-1; Mon, 20 Apr 2020 22:27:38 -0400
X-MC-Unique: aWoUFW9gO0imRlDrPR6qbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BE05107ACC4;
 Tue, 21 Apr 2020 02:27:36 +0000 (UTC)
Received: from [10.72.12.74] (ovpn-12-74.pek2.redhat.com [10.72.12.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CBF85C1B2;
 Tue, 21 Apr 2020 02:27:29 +0000 (UTC)
Subject: Re: [PATCH v4] vhost: disable for OABI
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200420143229.245488-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9ccae969-17ec-787c-e6ac-a88222bd1759@redhat.com>
Date: Tue, 21 Apr 2020 10:27:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200420143229.245488-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Richard Earnshaw <Richard.Earnshaw@arm.com>, kvm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sudeep Dutt <sudeep.dutt@intel.com>, "David S. Miller" <davem@davemloft.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ard Biesheuvel <ardb@kernel.org>
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

Ck9uIDIwMjAvNC8yMCDkuIvljYgxMDozNCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IHZo
b3N0IGlzIGN1cnJlbnRseSBicm9rZW4gb24gdGhlIHNvbWUgQVJNIGNvbmZpZ3MuCj4KPiBUaGUg
cmVhc29uIGlzIHRoYXQgdGhlIHJpbmcgZWxlbWVudCBhZGRyZXNzZXMgYXJlIHBhc3NlZCBiZXR3
ZWVuCj4gY29tcG9uZW50cyB3aXRoIGRpZmZlcmVudCBhbGlnbm1lbnRzIGFzc3VtcHRpb25zLiBU
aHVzLCBpZgo+IGd1ZXN0IHNlbGVjdHMgYSBwb2ludGVyIGFuZCBob3N0IHRoZW4gZ2V0cyBhbmQg
ZGVyZWZlcmVuY2VzCj4gaXQsIHRoZW4gYWxpZ25tZW50IGFzc3VtZWQgYnkgdGhlIGhvc3QncyBj
b21waWxlciBtaWdodCBiZQo+IGdyZWF0ZXIgdGhhbiB0aGUgYWN0dWFsIGFsaWdubWVudCBvZiB0
aGUgcG9pbnRlci4KPiBjb21waWxlciBvbiB0aGUgaG9zdCBmcm9tIGFzc3VtaW5nIHBvaW50ZXIg
aXMgYWxpZ25lZC4KPgo+IFRoaXMgYWN0dWFsbHkgdHJpZ2dlcnMgb24gQVJNIHdpdGggLW1hYmk9
YXBjcy1nbnUgLSB3aGljaCBpcyBhCj4gZGVwcmVjYXRlZCBjb25maWd1cmF0aW9uLiBXaXRoIHRo
aXMgT0FCSSwgY29tcGlsZXIgYXNzdW1lcyB0aGF0Cj4gYWxsIHN0cnVjdHVyZXMgYXJlIDQgYnl0
ZSBhbGlnbmVkIC0gd2hpY2ggaXMgc3Ryb25nZXIgdGhhbgo+IHZpcnRpbyBndWFyYW50ZWVzIGZv
ciBhdmFpbGFibGUgYW5kIHVzZWQgcmluZ3MsIHdoaWNoIGFyZQo+IG1lcmVseSAyIGJ5dGVzLiBU
aHVzIGEgZ3Vlc3Qgd2l0aG91dCAtbWFiaT1hcGNzLWdudSBydW5uaW5nCj4gb24gdG9wIG9mIGhv
c3Qgd2l0aCAtbWFiaT1hcGNzLWdudSB3aWxsIGJlIGJyb2tlbi4KPgo+IFRoZSBjb3JyZWN0IGZp
eCBpcyB0byBmb3JjZSBhbGlnbm1lbnQgb2Ygc3RydWN0dXJlcyAtIGhvd2V2ZXIKPiB0aGF0IGlz
IGFuIGludHJ1c2l2ZSBmaXggdGhhdCdzIGJlc3QgZGVmZXJyZWQgdW50aWwgdGhlIG5leHQgcmVs
ZWFzZS4KPgo+IFdlIGRpZG4ndCBwcmV2aW91c2x5IHN1cHBvcnQgc3VjaCBhbmNpZW50IHN5c3Rl
bXMgYXQgYWxsIC0gdGhpcyBzdXJmYWNlZAo+IGFmdGVyIHZkcGEgc3VwcG9ydCBwcm9tcHRlZCBy
ZW1vdmluZyBkZXBlbmRlbmN5IG9mIHZob3N0IG9uCj4gVklSVFVMSVpBVElPTi4gU28gZm9yIG5v
dywgbGV0J3MganVzdCBhZGQgc29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBvZgo+Cj4gCWRlcGVu
ZHMgb24gIUFSTSB8fCBBRUFCSQo+Cj4gdG8gdGhlIHZpcnRpbyBLY29uZmlnIGRlY2xhcmF0aW9u
LCBhbmQgYWRkIGEgY29tbWVudCB0aGF0IGl0IGhhcyB0byBkbwo+IHdpdGggc3RydWN0IG1lbWJl
ciBhbGlnbm1lbnQuCj4KPiBOb3RlOiB3ZSBjYW4ndCBtYWtlIFZIT1NUIGFuZCBWSE9TVF9SSU5H
IHRoZW1zZWx2ZXMgaGF2ZQo+IGEgZGVwZW5kZW5jeSBzaW5jZSB0aGVzZSBhcmUgc2VsZWN0ZWQu
IEFkZCBhIG5ldyBzeW1ib2wgZm9yIHRoYXQuCj4KPiBXZSBzaG91bGQgYmUgYWJsZSB0byBkcm9w
IHRoaXMgZGVwZW5kZW5jeSBkb3duIHRoZSByb2FkLgo+Cj4gRml4ZXM6IDIwYzM4NGYxZWExYTBi
YzcgKCJ2aG9zdDogcmVmaW5lIHZob3N0IGFuZCB2cmluZ2gga2NvbmZpZyIpCj4gU3VnZ2VzdGVk
LWJ5OiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPgo+IFN1Z2dlc3RlZC1ieTogUmlj
aGFyZCBFYXJuc2hhdyA8UmljaGFyZC5FYXJuc2hhd0Bhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6
IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gLS0tCj4KPiBjaGFuZ2VzIGZy
b20gdjM6Cj4gCXVwZGF0ZSBjb21taXQgbG9nIGNsYXJpZnlpbmcgdGhlIG1vdGl2YXRpb24gYW5k
IHRoYXQKPiAJaXQncyBhIHRlbXBvcmFyeSBmaXguCj4KPiAJc3VnZ2VzdGVkIGJ5IENocmlzdG9w
aCBIZWxsd2lnCj4KPiAgIGRyaXZlcnMvbWlzYy9taWMvS2NvbmZpZyB8ICAyICstCj4gICBkcml2
ZXJzL25ldC9jYWlmL0tjb25maWcgfCAgMiArLQo+ICAgZHJpdmVycy92ZHBhL0tjb25maWcgICAg
IHwgIDIgKy0KPiAgIGRyaXZlcnMvdmhvc3QvS2NvbmZpZyAgICB8IDE3ICsrKysrKysrKysrKyst
LS0tCj4gICA0IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL21pYy9LY29uZmlnIGIvZHJpdmVycy9taXNj
L21pYy9LY29uZmlnCj4gaW5kZXggOGYyMDFkMDE5ZjVhLi4zYmZlNzJjNTk4NjQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9taXNjL21pYy9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9taXNjL21pYy9L
Y29uZmlnCj4gQEAgLTExNiw3ICsxMTYsNyBAQCBjb25maWcgTUlDX0NPU00KPiAgIAo+ICAgY29u
ZmlnIFZPUAo+ICAgCXRyaXN0YXRlICJWT1AgRHJpdmVyIgo+IC0JZGVwZW5kcyBvbiBWT1BfQlVT
Cj4gKwlkZXBlbmRzIG9uIFZPUF9CVVMgJiYgVkhPU1RfRFBOCj4gICAJc2VsZWN0IFZIT1NUX1JJ
TkcKPiAgIAlzZWxlY3QgVklSVElPCj4gICAJaGVscAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC9jYWlmL0tjb25maWcgYi9kcml2ZXJzL25ldC9jYWlmL0tjb25maWcKPiBpbmRleCA5ZGIwNTcw
YzViZWIuLjY2MWMyNWViMWM0NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9jYWlmL0tjb25m
aWcKPiArKysgYi9kcml2ZXJzL25ldC9jYWlmL0tjb25maWcKPiBAQCAtNTAsNyArNTAsNyBAQCBj
b25maWcgQ0FJRl9IU0kKPiAgIAo+ICAgY29uZmlnIENBSUZfVklSVElPCj4gICAJdHJpc3RhdGUg
IkNBSUYgdmlydGlvIHRyYW5zcG9ydCBkcml2ZXIiCj4gLQlkZXBlbmRzIG9uIENBSUYgJiYgSEFT
X0RNQQo+ICsJZGVwZW5kcyBvbiBDQUlGICYmIEhBU19ETUEgJiYgVkhPU1RfRFBOCj4gICAJc2Vs
ZWN0IFZIT1NUX1JJTkcKPiAgIAlzZWxlY3QgVklSVElPCj4gICAJc2VsZWN0IEdFTkVSSUNfQUxM
T0NBVE9SCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9LY29uZmlnIGIvZHJpdmVycy92ZHBh
L0tjb25maWcKPiBpbmRleCAzZTFjZWI4ZTlmMmIuLmU4MTQwMDY1YzhhNSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3ZkcGEvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdmRwYS9LY29uZmlnCj4gQEAg
LTEwLDcgKzEwLDcgQEAgaWYgVkRQQQo+ICAgCj4gICBjb25maWcgVkRQQV9TSU0KPiAgIAl0cmlz
dGF0ZSAidkRQQSBkZXZpY2Ugc2ltdWxhdG9yIgo+IC0JZGVwZW5kcyBvbiBSVU5USU1FX1RFU1RJ
TkdfTUVOVSAmJiBIQVNfRE1BCj4gKwlkZXBlbmRzIG9uIFJVTlRJTUVfVEVTVElOR19NRU5VICYm
IEhBU19ETUEgJiYgVkhPU1RfRFBOCj4gICAJc2VsZWN0IFZIT1NUX1JJTkcKPiAgIAlkZWZhdWx0
IG4KPiAgIAloZWxwCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvS2NvbmZpZyBiL2RyaXZl
cnMvdmhvc3QvS2NvbmZpZwo+IGluZGV4IDJjNzVkMTY0YjgyNy4uYzRmMjczNzkzNTk1IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdmhvc3QvS2Nv
bmZpZwo+IEBAIC0xMyw2ICsxMywxNSBAQCBjb25maWcgVkhPU1RfUklORwo+ICAgCSAgVGhpcyBv
cHRpb24gaXMgc2VsZWN0ZWQgYnkgYW55IGRyaXZlciB3aGljaCBuZWVkcyB0byBhY2Nlc3MKPiAg
IAkgIHRoZSBob3N0IHNpZGUgb2YgYSB2aXJ0aW8gcmluZy4KPiAgIAo+ICtjb25maWcgVkhPU1Rf
RFBOCj4gKwlib29sCj4gKwlkZXBlbmRzIG9uICFBUk0gfHwgQUVBQkkKPiArCWRlZmF1bHQgeQo+
ICsJaGVscAo+ICsJICBBbnl0aGluZyBzZWxlY3RpbmcgVkhPU1Qgb3IgVkhPU1RfUklORyBtdXN0
IGRlcGVuZCBvbiBWSE9TVF9EUE4uCj4gKwkgIFRoaXMgZXhjbHVkZXMgdGhlIGRlcHJlY2F0ZWQg
QVJNIEFCSSBzaW5jZSB0aGF0IGZvcmNlcyBhIDQgYnl0ZQo+ICsJICBhbGlnbm1lbnQgb24gYWxs
IHN0cnVjdHMgLSBpbmNvbXBhdGlibGUgd2l0aCB2aXJ0aW8gc3BlYyByZXF1aXJlbWVudHMuCj4g
Kwo+ICAgY29uZmlnIFZIT1NUCj4gICAJdHJpc3RhdGUKPiAgIAlzZWxlY3QgVkhPU1RfSU9UTEIK
PiBAQCAtMjgsNyArMzcsNyBAQCBpZiBWSE9TVF9NRU5VCj4gICAKPiAgIGNvbmZpZyBWSE9TVF9O
RVQKPiAgIAl0cmlzdGF0ZSAiSG9zdCBrZXJuZWwgYWNjZWxlcmF0b3IgZm9yIHZpcnRpbyBuZXQi
Cj4gLQlkZXBlbmRzIG9uIE5FVCAmJiBFVkVOVEZEICYmIChUVU4gfHwgIVRVTikgJiYgKFRBUCB8
fCAhVEFQKQo+ICsJZGVwZW5kcyBvbiBORVQgJiYgRVZFTlRGRCAmJiAoVFVOIHx8ICFUVU4pICYm
IChUQVAgfHwgIVRBUCkgJiYgVkhPU1RfRFBOCj4gICAJc2VsZWN0IFZIT1NUCj4gICAJLS0taGVs
cC0tLQo+ICAgCSAgVGhpcyBrZXJuZWwgbW9kdWxlIGNhbiBiZSBsb2FkZWQgaW4gaG9zdCBrZXJu
ZWwgdG8gYWNjZWxlcmF0ZQo+IEBAIC00MCw3ICs0OSw3IEBAIGNvbmZpZyBWSE9TVF9ORVQKPiAg
IAo+ICAgY29uZmlnIFZIT1NUX1NDU0kKPiAgIAl0cmlzdGF0ZSAiVkhPU1RfU0NTSSBUQ00gZmFi
cmljIGRyaXZlciIKPiAtCWRlcGVuZHMgb24gVEFSR0VUX0NPUkUgJiYgRVZFTlRGRAo+ICsJZGVw
ZW5kcyBvbiBUQVJHRVRfQ09SRSAmJiBFVkVOVEZEICYmIFZIT1NUX0RQTgo+ICAgCXNlbGVjdCBW
SE9TVAo+ICAgCWRlZmF1bHQgbgo+ICAgCS0tLWhlbHAtLS0KPiBAQCAtNDksNyArNTgsNyBAQCBj
b25maWcgVkhPU1RfU0NTSQo+ICAgCj4gICBjb25maWcgVkhPU1RfVlNPQ0sKPiAgIAl0cmlzdGF0
ZSAidmhvc3QgdmlydGlvLXZzb2NrIGRyaXZlciIKPiAtCWRlcGVuZHMgb24gVlNPQ0tFVFMgJiYg
RVZFTlRGRAo+ICsJZGVwZW5kcyBvbiBWU09DS0VUUyAmJiBFVkVOVEZEICYmIFZIT1NUX0RQTgo+
ICAgCXNlbGVjdCBWSE9TVAo+ICAgCXNlbGVjdCBWSVJUSU9fVlNPQ0tFVFNfQ09NTU9OCj4gICAJ
ZGVmYXVsdCBuCj4gQEAgLTYzLDcgKzcyLDcgQEAgY29uZmlnIFZIT1NUX1ZTT0NLCj4gICAKPiAg
IGNvbmZpZyBWSE9TVF9WRFBBCj4gICAJdHJpc3RhdGUgIlZob3N0IGRyaXZlciBmb3IgdkRQQS1i
YXNlZCBiYWNrZW5kIgo+IC0JZGVwZW5kcyBvbiBFVkVOVEZECj4gKwlkZXBlbmRzIG9uIEVWRU5U
RkQgJiYgVkhPU1RfRFBOCj4gICAJc2VsZWN0IFZIT1NUCj4gICAJZGVwZW5kcyBvbiBWRFBBCj4g
ICAJaGVscAoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKVGhh
bmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
