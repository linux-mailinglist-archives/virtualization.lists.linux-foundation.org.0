Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BC416B85D
	for <lists.virtualization@lfdr.de>; Tue, 25 Feb 2020 05:03:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C2BDE84771;
	Tue, 25 Feb 2020 04:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5uM3lHzipksr; Tue, 25 Feb 2020 04:03:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E408847E5;
	Tue, 25 Feb 2020 04:03:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 064EEC0177;
	Tue, 25 Feb 2020 04:03:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58232C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 04:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 44EA684771
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 04:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jjj6q0eeLFfa
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 04:03:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 78DE98466C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 04:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582603385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7TOYYvzJQOOZ9LfcpJBYM56+MM7z1Z4OzHQN2nrm9SM=;
 b=SV+6l6qgb8IpLP/yL2kA84qinPVzy2al2/AkXbmAABXLPuMblkPGMhkuoU3EPibRTrQi7p
 WXi/43BgpXh2BfCoDLRFRiaS0YtZ3EJuMzNPE8cfxzUs3I/qhYovvXENrq4dnbP+Al5vmQ
 W6szAS5sceTrYlDZm8zmYE2zyw1tTvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-4UZrMMeUPcqkJ4_f8hQ_nw-1; Mon, 24 Feb 2020 23:03:01 -0500
X-MC-Unique: 4UZrMMeUPcqkJ4_f8hQ_nw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84A788017CC;
 Tue, 25 Feb 2020 04:02:59 +0000 (UTC)
Received: from [10.72.13.170] (ovpn-13-170.pek2.redhat.com [10.72.13.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C62A90519;
 Tue, 25 Feb 2020 04:02:53 +0000 (UTC)
Subject: Re: [PATCH v3] virtio: Work around frames incorrectly marked as gso
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
References: <20200224132550.2083-1-anton.ivanov@cambridgegreys.com>
 <CA+FuTSd8P6uQnwisZEh7+nfowW9qKLBEvA4GPg+xUkjBa-6TDA@mail.gmail.com>
 <4e7757cf-148e-4585-b358-3b38f391275d@cambridgegreys.com>
 <CA+FuTSdOCJZCVS4xohx+BQmkmq8JALnK=gGc0=qy1TbjY707ag@mail.gmail.com>
 <93cb2b3f-6cae-8cf1-5fab-93fa34c14628@cambridgegreys.com>
 <CA+FuTScEXRwYtFzn-jtFhV0dNKNQqKPBwCWaNORJW=ERU=izMA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1af28666-1d27-8c9e-7225-2796a9f7336e@redhat.com>
Date: Tue, 25 Feb 2020 12:02:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+FuTScEXRwYtFzn-jtFhV0dNKNQqKPBwCWaNORJW=ERU=izMA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Network Development <netdev@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-um@lists.infradead.org,
 Eric Dumazet <eric.dumazet@gmail.com>,
 virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvMi8yNSDkuIrljYg2OjIyLCBXaWxsZW0gZGUgQnJ1aWpuIHdyb3RlOgo+IE9uIE1v
biwgRmViIDI0LCAyMDIwIGF0IDQ6MDAgUE0gQW50b24gSXZhbm92Cj4gPGFudG9uLml2YW5vdkBj
YW1icmlkZ2VncmV5cy5jb20+IHdyb3RlOgo+PiBPbiAyNC8wMi8yMDIwIDIwOjIwLCBXaWxsZW0g
ZGUgQnJ1aWpuIHdyb3RlOgo+Pj4gT24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMjo1NSBQTSBBbnRv
biBJdmFub3YKPj4+IDxhbnRvbi5pdmFub3ZAY2FtYnJpZGdlZ3JleXMuY29tPiB3cm90ZToKPj4+
PiBPbiAyNC8wMi8yMDIwIDE5OjI3LCBXaWxsZW0gZGUgQnJ1aWpuIHdyb3RlOgo+Pj4+PiBPbiBN
b24sIEZlYiAyNCwgMjAyMCBhdCA4OjI2IEFNIDxhbnRvbi5pdmFub3ZAY2FtYnJpZGdlZ3JleXMu
Y29tPiB3cm90ZToKPj4+Pj4+IEZyb206IEFudG9uIEl2YW5vdiA8YW50b24uaXZhbm92QGNhbWJy
aWRnZWdyZXlzLmNvbT4KPj4+Pj4+Cj4+Pj4+PiBTb21lIG9mIHRoZSBsb2NhbGx5IGdlbmVyYXRl
ZCBmcmFtZXMgbWFya2VkIGFzIEdTTyB3aGljaAo+Pj4+Pj4gYXJyaXZlIGF0IHZpcnRpb19uZXRf
aGRyX2Zyb21fc2tiKCkgaGF2ZSBubyBHU09fVFlQRSwgbm8KPj4+Pj4+IGZyYWdtZW50cyAoZGF0
YV9sZW4gPSAwKSBhbmQgbGVuZ3RoIHNpZ25pZmljYW50bHkgc2hvcnRlcgo+Pj4+Pj4gdGhhbiB0
aGUgTVRVICg3NTIgaW4gbXkgZXhwZXJpbWVudHMpLgo+Pj4+PiBEbyB3ZSB1bmRlcnN0YW5kIGhv
dyB0aGVzZSBwYWNrZXRzIGFyZSBnZW5lcmF0ZWQ/Cj4+Pj4gTm8sIHdlIGhhdmUgbm90IGJlZW4g
YWJsZSB0byB0cmFjZSB0aGVtLgo+Pj4+Cj4+Pj4gVGhlIG9ubHkgdGhpbmcgd2Uga25vdyBpcyB0
aGF0IHRoaXMgaXMgc3BlY2lmaWMgdG8gbG9jYWxseSBnZW5lcmF0ZWQKPj4+PiBwYWNrZXRzLiBT
b21ldGhpbmcgYXJyaXZpbmcgZnJvbSB0aGUgbmV0d29yayBkb2VzIG5vdCBzaG93IHRoaXMuCj4+
Pj4KPj4+Pj4gRWxzZSBpdCBzZWVtcyB0aGlzCj4+Pj4+IG1pZ2h0IGJlIHBhcGVyaW5nIG92ZXIg
YSBkZWVwZXIgcHJvYmxlbS4KPj4+Pj4KPj4+Pj4gVGhlIHN0YWNrIHNob3VsZCBub3QgY3JlYXRl
IEdTTyBwYWNrZXRzIGxlc3MgdGhhbiBvciBlcXVhbCB0bwo+Pj4+PiBza2Jfc2hpbmZvKHNrYikt
Pmdzb19zaXplLiBTZWUgZm9yIGluc3RhbmNlIHRoZSBjaGVjayBpbgo+Pj4+PiB0Y3BfZ3NvX3Nl
Z21lbnQgYWZ0ZXIgcHVsbGluZyB0aGUgdGNwIGhlYWRlcjoKPj4+Pj4KPj4+Pj4gICAgICAgICAg
ICBtc3MgPSBza2Jfc2hpbmZvKHNrYiktPmdzb19zaXplOwo+Pj4+PiAgICAgICAgICAgIGlmICh1
bmxpa2VseShza2ItPmxlbiA8PSBtc3MpKQo+Pj4+PiAgICAgICAgICAgICAgICAgICAgZ290byBv
dXQ7Cj4+Pj4+Cj4+Pj4+IFdoYXQgaXMgdGhlIGdzb190eXBlLCBhbmQgZG9lcyBpdCBpbmNsdWRl
IFNLQl9HU09fRE9ER1k/Cj4+Pj4+Cj4+Pj4gMCAtIG5vdCBzZXQuCj4+PiBUaGFua3MgZm9yIHRo
ZSBmb2xsb3ctdXAgZGV0YWlscy4gSXMgdGhpcyBzb21ldGhpbmcgdGhhdCB5b3UgY2FuIHRyaWdn
ZXIgZWFzaWx5Pwo+PiBZZXMsIGlmIHlvdSBoYXZlIGEgVU1MIGluc3RhbmNlIGhhbmR5Lgo+Pgo+
PiBSdW5uaW5nIGlwZXJmIGJldHdlZW4gdGhlIGhvc3QgYW5kIGEgVU1MIGd1ZXN0IHVzaW5nIHJh
dyBzb2NrZXQKPj4gdHJhbnNwb3J0IHRyaWdnZXJzIGl0IGltbWVkaWF0ZWx5Lgo+Pgo+PiBUaGlz
IGlzIG15IFVNTCBjb21tYW5kIGxpbmU6Cj4+Cj4+IHZtbGludXggbWVtPTIwNDhNIHVtaWQ9T1BY
IFwKPj4gICAgICAgdWJkMD1PUFgtMy4wLVdvcmsuaW1nIFwKPj4gdmVjMDp0cmFuc3BvcnQ9cmF3
LGlmbmFtZT1wLXZldGgwLGRlcHRoPTEyOCxncm89MSxtYWM9OTI6OWI6MzY6NWU6Mzg6NjkgXAo+
PiAgICAgICByb290PS9kZXYvdWJkYSBybyBjb249bnVsbCBjb24wPW51bGwsZmQ6MiBjb24xPWZk
OjAsZmQ6MQo+Pgo+PiBwLXJpZ2h0IGlzIGEgcGFydCBvZiBhIHZFdGggcGFpcjoKPj4KPj4gaXAg
bGluayBhZGQgbC12ZXRoMCB0eXBlIHZldGggcGVlciBuYW1lIHAtdmV0aDAgJiYgaWZjb25maWcg
cC12ZXRoMCB1cAo+Pgo+PiBpcGVyZiBzZXJ2ZXIgaXMgb24gaG9zdCwgaXBlcmYgLWMgaW4gdGhl
IGd1ZXN0Lgo+Pgo+Pj4gQW4gc2tiX2R1bXAoKSArIGR1bXBfc3RhY2soKSB3aGVuIHRoZSBwYWNr
ZXQgc29ja2V0IGdldHMgc3VjaCBhCj4+PiBwYWNrZXQgbWF5IHBvaW50IHVzIHRvIHRoZSByb290
IGNhdXNlIGFuZCBmaXggdGhhdC4KPj4gV2UgdHJpZWQgZHVtcCBzdGFjaywgaXQgd2FzIG5vdCBp
bmZvcm1hdGl2ZSAtIGl0IHdhcyBqdXN0IHRoZSByZWN2bW1zZwo+PiBjYWxsIHN0YWNrIGNvbWlu
ZyBmcm9tIHRoZSBVTUwgdW50aWwgaXQgaGl0cyB0aGUgcmVsZXZhbnQgcmVjdiBiaXQgaW4KPj4g
YWZfcGFja2V0IC0gaXQgZG9lcyBub3QgdGVsbCB1cyB3aGVyZSB0aGUgcGFja2V0IGlzIGNvbWlu
ZyBmcm9tLgo+Pgo+PiBRdW90aW5nIGZyb20gdGhlIG1lc3NhZ2UgZWFybGllciBpbiB0aGUgdGhy
ZWFkOgo+Pgo+PiBbIDIzMzQuMTgwODU0XSBDYWxsIFRyYWNlOgo+PiBbIDIzMzQuMTgxOTQ3XSAg
ZHVtcF9zdGFjaysweDVjLzB4ODAKPj4gWyAyMzM0LjE4MzAyMV0gIHBhY2tldF9yZWN2bXNnLmNv
bGQrMHgyMy8weDQ5Cj4+IFsgMjMzNC4xODQwNjNdICBfX19zeXNfcmVjdm1zZysweGUxLzB4MWYw
Cj4+IFsgMjMzNC4xODUwMzRdICA/IHBhY2tldF9wb2xsKzB4Y2EvMHgxMzAKPj4gWyAyMzM0LjE4
NjAxNF0gID8gc29ja19wb2xsKzB4NzcvMHhiMAo+PiBbIDIzMzQuMTg2OTc3XSAgPyBlcF9pdGVt
X3BvbGwuaXNyYS4wKzB4M2YvMHhiMAo+PiBbIDIzMzQuMTg3OTM2XSAgPyBlcF9zZW5kX2V2ZW50
c19wcm9jKzB4ZjEvMHgyNDAKPj4gWyAyMzM0LjE4ODkwMV0gID8gZGVxdWV1ZV9zaWduYWwrMHhk
Yi8weDE4MAo+PiBbIDIzMzQuMTg5ODQ4XSAgZG9fcmVjdm1tc2crMHhjOC8weDJkMAo+PiBbIDIz
MzQuMTkwNzI4XSAgPyBlcF9wb2xsKzB4OGMvMHg0NzAKPj4gWyAyMzM0LjE5MTU4MV0gIF9fc3lz
X3JlY3ZtbXNnKzB4MTA4LzB4MTUwCj4+IFsgMjMzNC4xOTI0NDFdICBfX3g2NF9zeXNfcmVjdm1t
c2crMHgyNS8weDMwCj4+IFsgMjMzNC4xOTMzNDZdICBkb19zeXNjYWxsXzY0KzB4NTMvMHgxNDAK
Pj4gWyAyMzM0LjE5NDI2Ml0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4
YTkKPiBUaGF0IG1ha2VzIHNlbnNlLiBza2JfZHVtcCBtaWdodCBzaG93IG1vcmUgaW50ZXJlc3Rp
bmcgZGV0YWlscyBhYm91dAo+IHRoZSBwYWNrZXQuIEZyb20gdGhlIHByZXZpb3VzIHRocmVhZCwg
dGhlc2UgYXJlIGFzc3VtZWQgdG8gYmUgVENQCj4gcGFja2V0cz8KPgo+IEkgaGFkIG1pc3NlZCB0
aGUgb3JpZ2luYWwgdGhyZWFkLiBJZiB0aGUgcGFja2V0IGhhcwo+Cj4gICAgICBzaW5mbyhza2Ip
LT5nc29fc2l6ZSA9IDc1Mi4KPiAgICAgIHNrYi0+bGVuID0gODE4Cj4KPiB0aGVuIHRoaXMgaXMg
YSBHU08gcGFja2V0LiBFdmVuIHRob3VnaCBVTUwgd2lsbCBjb3JyZWN0bHkgcHJvY2VzcyBpdAo+
IGFzIGEgbm9ybWFsIDgxOCBCIHBhY2tldCBpZiBwc29ja19yY3YgcHJldGVuZHMgdGhhdCBpdCBp
cywgdHJlYXRpbmcgaXQKPiBsaWtlIHRoYXQgaXMgbm90IHN0cmljdGx5IGNvcnJlY3QuIEEgcmVs
YXRlZCBxdWVzdGlvbiBpcyBob3cgdGhlIHNldHVwCj4gYXJyaXZlZCBhdCB0aGF0IGxvdyBNVFUg
c2l6ZSwgYXNzdW1pbmcgdGhhdCBpcyBub3QgZXhwbGljaXRseQo+IGNvbmZpZ3VyZWQgdGhhdCBs
b3cuCj4KPiBBcyBvZiBjb21taXQgNTE0NjZhNzU0NWI3ICgidGNwOiBmaWxsIHNoaW5mby0+Z3Nv
X3R5cGUgYXQgbGFzdAo+IG1vbWVudCIpIHRjcCB1bmNvbmRpdGlvbmFsbHkgc2V0cyBnc29fdHlw
ZSwgZXZlbiBmb3Igbm9uIGdzbyBwYWNrZXRzLgo+IFNvIGVpdGhlciB0aGlzIGlzIG5vdCBhIHRj
cCBwYWNrZXQgb3IgdGhlIGZpZWxkIGdldHMgemVyb2VkIHNvbWV3aGVyZQo+IGFsb25nIHRoZSB3
YXkuIEkgY291bGQgbm90IHF1aWNrbHkgZmluZCBhIHBvc3NpYmxlIHBhdGggdG8KPiBza2JfZ3Nv
X3Jlc2V0IG9yIGEgcmF3IHdyaXRlLgo+Cj4gSXQgbWF5IGJlIHVzZWZ1bCB0byBpbnNlcnQgdGVz
dHMgZm9yIHRoaXMgY29uZGl0aW9uIChza2JfaXNfZ3NvKHNrYikKPiAmJiAhc2tiX3NoaW5mbyhz
a2IpLT5nc29fdHlwZSkgdGhhdCBjYWxsIHNrYl9kdW1wIGF0IG90aGVyIHBvaW50cyBpbgo+IHRo
ZSBuZXR3b3JrIHN0YWNrLiBGb3IgaW5zdGFuY2UgaW4gX19pcF9xdWV1ZV94bWl0IGFuZAo+IF9f
ZGV2X3F1ZXVlX3htaXQuCgoKKzEKCldlIG1lZXQgc29tZSBjdXN0b21lciBoaXQgc3VjaCBjb25k
aXRpb24gYXMgd2VsbCB3aGljaCBsZWFkIG92ZXIgTVRVIApwYWNrZXQgdG8gYmUgcXVldWVkIGJ5
IFRBUCB3aGljaCBjcmFzaGVzIHRoZWlyIGJ1Z2d5IHVzZXJzcGFjZSBhcHBsaWNhdGlvbi4KCldl
IHN1c3BlY3QgaXQncyB0aGUgaXNzdWUgb2Ygd3JvbmcgZ3NvX3R5cGUgdnMgZ3NvX3NpemUuCgpU
aGFua3MKCgo+Cj4gU2luY2Ugc2tiIHNlZ21lbnRhdGlvbiBmYWlscyBpbiB0Y3BfZ3NvX3NlZ21l
bnQgZm9yIHN1Y2ggcGFja2V0cywgaXQKPiBtYXkgYWxzbyBiZSBpbmZvcm1hdGl2ZSB0byBkaXNh
YmxlIFRTTyBvbiB0aGUgdmV0aCBkZXZpY2UgYW5kIHNlZSBpZgo+IHRoZSB0ZXN0IGZhaWxzLgo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
