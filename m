Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE271AD915
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 10:51:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D6F10868F7;
	Fri, 17 Apr 2020 08:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pfSW1MNfvuyz; Fri, 17 Apr 2020 08:51:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1D83C86D7A;
	Fri, 17 Apr 2020 08:51:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1213AC0172;
	Fri, 17 Apr 2020 08:51:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0297C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A00B48575E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:51:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5SDs5doWqvSH
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:51:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6E1CB85608
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587113495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQwVoLWLfFbH6h152kN8CMNJtHnIpy94SgeEfTqCWgE=;
 b=CfNdQIXP+6j3FGXsL1WFUHxdLb1Dek+lY1gEGxUnQs6J2WygG5M2dgTacIEQD8s1UqRK4U
 Zh2SzEik/WVPfw4ogbMHwnysS1PTzfyvxcFYc+G2A2rUUVp8Knn+t3Mc5SHdSqd77K5CSJ
 7eYMORvrFzu51QMWxWYrMo6OVx+oulg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-YshOpB4qNkaObaMFdM5aTw-1; Fri, 17 Apr 2020 04:51:31 -0400
X-MC-Unique: YshOpB4qNkaObaMFdM5aTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BFDADB20;
 Fri, 17 Apr 2020 08:51:29 +0000 (UTC)
Received: from [10.72.13.202] (ovpn-13-202.pek2.redhat.com [10.72.13.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2890E5DA2C;
 Fri, 17 Apr 2020 08:51:20 +0000 (UTC)
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
 <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
 <20200417044230-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <73843240-3040-655d-baa9-683341ed4786@redhat.com>
Date: Fri, 17 Apr 2020 16:51:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200417044230-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: linux-s390@vger.kernel.org, tsbogend@alpha.franken.de,
 benh@kernel.crashing.org, gor@linux.ibm.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, heiko.carstens@de.ibm.com,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, geert@linux-m68k.org,
 Michael Ellerman <mpe@ellerman.id.au>, netdev@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
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

Ck9uIDIwMjAvNC8xNyDkuIvljYg0OjQ2LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
RnJpLCBBcHIgMTcsIDIwMjAgYXQgMDQ6Mzk6NDlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC80LzE3IOS4i+WNiDQ6MjksIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIEZyaSwgQXByIDE3LCAyMDIwIGF0IDAzOjM2OjUyUE0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gT24gMjAyMC80LzE3IOS4i+WNiDI6MzMsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPj4+Pj4gT24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMTE6MTI6MTRBTSArMDgwMCwgSmFzb24g
V2FuZyB3cm90ZToKPj4+Pj4+IE9uIDIwMjAvNC8xNyDkuIrljYg2OjU1LCBNaWNoYWVsIFMuIFRz
aXJraW4gd3JvdGU6Cj4+Pj4+Pj4gT24gV2VkLCBBcHIgMTUsIDIwMjAgYXQgMTA6NDM6NTZBTSAr
MDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pj4+Pj4gV2UgdHJ5IHRvIGtlZXAgdGhlIGRlZmNv
bmZpZyB1bnRvdWNoZWQgYWZ0ZXIgZGVjb3VwbGluZyBDT05GSUdfVkhPU1QKPj4+Pj4+Pj4gb3V0
IG9mIENPTkZJR19WSVJUVUFMSVpBVElPTiBpbiBjb21taXQgMjBjMzg0ZjFlYTFhCj4+Pj4+Pj4+
ICgidmhvc3Q6IHJlZmluZSB2aG9zdCBhbmQgdnJpbmdoIGtjb25maWciKSBieSBlbmFibGluZyBW
SE9TVF9NRU5VIGJ5Cj4+Pj4+Pj4+IGRlZmF1bHQuIFRoZW4gdGhlIGRlZmNvbmZpZ3MgY2FuIGtl
ZXAgZW5hYmxpbmcgQ09ORklHX1ZIT1NUX05FVAo+Pj4+Pj4+PiB3aXRob3V0IHRoZSBjYXJpbmcg
b2YgQ09ORklHX1ZIT1NULgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBCdXQgdGhpcyB3aWxsIGxlYXZlIGEg
IkNPTkZJR19WSE9TVF9NRU5VPXkiIGluIGFsbCBkZWZjb25maWdzIGFuZCBldmVuCj4+Pj4+Pj4+
IGZvciB0aGUgb25lcyB0aGF0IGRvZXNuJ3Qgd2FudCB2aG9zdC4gU28gaXQgYWN0dWFsbHkgc2hp
ZnRzIHRoZQo+Pj4+Pj4+PiBidXJkZW5zIHRvIHRoZSBtYWludGFpbmVycyBvZiBhbGwgb3RoZXIg
dG8gYWRkICJDT05GSUdfVkhPU1RfTUVOVSBpcwo+Pj4+Pj4+PiBub3Qgc2V0Ii4gU28gdGhpcyBw
YXRjaCB0cmllcyB0byBlbmFibGUgQ09ORklHX1ZIT1NUIGV4cGxpY2l0bHkgaW4KPj4+Pj4+Pj4g
ZGVmY29uZmlncyB0aGF0IGVuYWJsZXMgQ09ORklHX1ZIT1NUX05FVCBhbmQgQ09ORklHX1ZIT1NU
X1ZTT0NLLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBBY2tlZC1ieTogQ2hyaXN0aWFuIEJvcm50cmFlZ2Vy
PGJvcm50cmFlZ2VyQGRlLmlibS5jb20+ICAgKHMzOTApCj4+Pj4+Pj4+IEFja2VkLWJ5OiBNaWNo
YWVsIEVsbGVybWFuPG1wZUBlbGxlcm1hbi5pZC5hdT4gICAocG93ZXJwYykKPj4+Pj4+Pj4gQ2M6
IFRob21hcyBCb2dlbmRvZXJmZXI8dHNib2dlbmRAYWxwaGEuZnJhbmtlbi5kZT4KPj4+Pj4+Pj4g
Q2M6IEJlbmphbWluIEhlcnJlbnNjaG1pZHQ8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnPgo+Pj4+
Pj4+PiBDYzogUGF1bCBNYWNrZXJyYXM8cGF1bHVzQHNhbWJhLm9yZz4KPj4+Pj4+Pj4gQ2M6IE1p
Y2hhZWwgRWxsZXJtYW48bXBlQGVsbGVybWFuLmlkLmF1Pgo+Pj4+Pj4+PiBDYzogSGVpa28gQ2Fy
c3RlbnM8aGVpa28uY2Fyc3RlbnNAZGUuaWJtLmNvbT4KPj4+Pj4+Pj4gQ2M6IFZhc2lseSBHb3Ji
aWs8Z29yQGxpbnV4LmlibS5jb20+Cj4+Pj4+Pj4+IENjOiBDaHJpc3RpYW4gQm9ybnRyYWVnZXI8
Ym9ybnRyYWVnZXJAZGUuaWJtLmNvbT4KPj4+Pj4+Pj4gUmVwb3J0ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbjxnZWVydEBsaW51eC1tNjhrLm9yZz4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFz
b24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+Pj4+Pj4+IEkgcmViYXNlZCB0aGlzIG9uIHRv
cCBvZiBPQUJJIGZpeCBzaW5jZSB0aGF0Cj4+Pj4+Pj4gc2VlbXMgbW9yZSBvcmdlbnQgdG8gZml4
Lgo+Pj4+Pj4+IFB1c2hlZCB0byBteSB2aG9zdCBicmFuY2ggcGxzIHRha2UgYSBsb29rIGFuZAo+
Pj4+Pj4+IGlmIHBvc3NpYmxlIHRlc3QuCj4+Pj4+Pj4gVGhhbmtzIQo+Pj4+Pj4gSSB0ZXN0IHRo
aXMgcGF0Y2ggYnkgZ2VuZXJhdGluZyB0aGUgZGVmY29uZmlncyB0aGF0IHdhbnRzIHZob3N0X25l
dCBvcgo+Pj4+Pj4gdmhvc3RfdnNvY2suIEFsbCBsb29rcyBmaW5lLgo+Pj4+Pj4KPj4+Pj4+IEJ1
dCBoYXZpbmcgQ09ORklHX1ZIT1NUX0RQTj15IG1heSBlbmQgdXAgd2l0aCB0aGUgc2ltaWxhciBz
aXR1YXRpb24gdGhhdAo+Pj4+Pj4gdGhpcyBwYXRjaCB3YW50IHRvIGFkZHJlc3MuCj4+Pj4+PiBN
YXliZSB3ZSBjYW4gbGV0IENPTkZJR19WSE9TVCBkZXBlbmRzIG9uICFBUk0gfHwgQUVBQkkgdGhl
biBhZGQgYW5vdGhlcgo+Pj4+Pj4gbWVudWNvbmZpZyBmb3IgVkhPU1RfUklORyBhbmQgZG8gc29t
ZXRoaW5nIHNpbWlsYXI/Cj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzCj4+Pj4+IFNvcnJ5IEkgZG9uJ3Qg
dW5kZXJzdGFuZC4gQWZ0ZXIgdGhpcyBwYXRjaCBDT05GSUdfVkhPU1RfRFBOIGlzIGp1c3QKPj4+
Pj4gYW4gaW50ZXJuYWwgdmFyaWFibGUgZm9yIHRoZSBPQUJJIGZpeC4gSSBrZXB0IGl0IHNlcGFy
YXRlCj4+Pj4+IHNvIGl0J3MgZWFzeSB0byByZXZlcnQgZm9yIDUuOC4gWWVzIHdlIGNvdWxkIHNx
dWFzaCBpdCBpbnRvCj4+Pj4+IFZIT1NUIGRpcmVjdGx5IGJ1dCBJIGRvbid0IHNlZSBob3cgdGhh
dCBjaGFuZ2VzIGxvZ2ljIGF0IGFsbC4KPj4+PiBTb3JyeSBmb3IgYmVpbmcgdW5jbGVhci4KPj4+
Pgo+Pj4+IEkgbWVhbnQgc2luY2UgaXQgd2FzIGVuYWJsZWQgYnkgZGVmYXVsdCwgIkNPTkZJR19W
SE9TVF9EUE49eSIgd2lsbCBiZSBsZWZ0Cj4+Pj4gaW4gdGhlIGRlZmNvbmZpZ3MuCj4+PiBCdXQg
d2hvIGNhcmVzPwo+PiBGWUksIHBsZWFzZSBzZWVodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0
cy9rdm0vbXNnMjEyNjg1Lmh0bWwKPiBUaGUgY29tcGxhaW50IHdhcyBub3QgYWJvdXQgdGhlIHN5
bWJvbCBJSVVDLiAgSXQgd2FzIHRoYXQgd2UgY2F1c2VkCj4gZXZlcnlvbmUgdG8gYnVpbGQgdmhv
c3QgdW5sZXNzIHRoZXkgbWFudWFsbHkgZGlzYWJsZWQgaXQuCgoKVGhlcmUgY291bGQgYmUgc29t
ZSBtaXN1bmRlcnN0YW5kaW5nIGhlcmUuIEkgdGhvdWdodCBpdCdzIHNvbWVob3cgCnNpbWlsYXI6
IGEgQ09ORklHX1ZIT1NUX01FTlU9eSB3aWxsIGJlIGxlZnQgaW4gdGhlIGRlZmNvbmZpZ3MgZXZl
biBpZiAKQ09ORklHX1ZIT1NUIGlzIG5vdCBzZXQuCgpUaGFua3MKCgo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
