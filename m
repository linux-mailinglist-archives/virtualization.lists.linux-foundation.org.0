Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D27129CEA
	for <lists.virtualization@lfdr.de>; Tue, 24 Dec 2019 03:49:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE0248757D;
	Tue, 24 Dec 2019 02:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bkADH5Fdmiax; Tue, 24 Dec 2019 02:49:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A937787554;
	Tue, 24 Dec 2019 02:49:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88F02C0881;
	Tue, 24 Dec 2019 02:49:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 584BAC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 02:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 32422203FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 02:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KR1Zun82Nrnr
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 02:49:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 1ED00203B0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 02:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577155766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wtq5rKsoH6y7TIQT6lpoljI1w2wwhhEx65ky24Nv240=;
 b=VRmWxe3FstFewDNjfTpD2qSypDHSmqWkQU51NCx8ClvHn8sSx1XJrGBLha7F3n7+1Fk8IF
 /u2QU5xNvsx7R8T9QlB+yXzgYaSgA+OCrL0cfteQuhgKzQxMOVUMqpuUXSn+QDBhDmvZqz
 DkZ81XBSfGdUWC4EqffwljVhvcL9hvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-ypBO3qiaOsquqvPziG1gxQ-1; Mon, 23 Dec 2019 21:49:22 -0500
X-MC-Unique: ypBO3qiaOsquqvPziG1gxQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97339477;
 Tue, 24 Dec 2019 02:49:21 +0000 (UTC)
Received: from [10.72.12.236] (ovpn-12-236.pek2.redhat.com [10.72.12.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FD6860BA0;
 Tue, 24 Dec 2019 02:49:15 +0000 (UTC)
Subject: Re: [PATCH net] virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ
To: Alistair Delva <adelva@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
References: <20191223140322.20013-1-mst@redhat.com>
 <CANDihLHPk5khpv-f-M+qhkzgTkygAts38GGb-HChg-VL2bo+Uw@mail.gmail.com>
 <CA+FuTSfq5v3-0VYmTG7YFFUqT8uG53eXXhqc8WvVvMbp3s0nvA@mail.gmail.com>
 <CA+FuTScwwajN2ny2w8EBkBQd191Eb1ZsrRhbh3=5eQervArnEA@mail.gmail.com>
 <CANDihLFv+DJYOD1m_Z3CKuxoXG-z4zPy_Tc2eoggq1KRo+GeWw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ea5131fc-cda6-c773-73fc-c862be6ecb7b@redhat.com>
Date: Tue, 24 Dec 2019 10:49:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANDihLFv+DJYOD1m_Z3CKuxoXG-z4zPy_Tc2eoggq1KRo+GeWw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Network Development <netdev@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 virtualization@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

Ck9uIDIwMTkvMTIvMjQg5LiK5Y2INDoyMSwgQWxpc3RhaXIgRGVsdmEgd3JvdGU6Cj4gT24gTW9u
LCBEZWMgMjMsIDIwMTkgYXQgMTI6MTIgUE0gV2lsbGVtIGRlIEJydWlqbgo+IDx3aWxsZW1kZWJy
dWlqbi5rZXJuZWxAZ21haWwuY29tPiB3cm90ZToKPj4gT24gTW9uLCBEZWMgMjMsIDIwMTkgYXQg
Mjo1NiBQTSBXaWxsZW0gZGUgQnJ1aWpuCj4+IDx3aWxsZW1kZWJydWlqbi5rZXJuZWxAZ21haWwu
Y29tPiB3cm90ZToKPj4+IDAwZmZmZTBmZjAgRFI3OiAwMDAwMDAwMDAwMDAwNDAwCj4+Pj4+IENh
bGwgVHJhY2U6Cj4+Pj4+ICAgPyBwcmVlbXB0X2NvdW50X2FkZCsweDU4LzB4YjAKPj4+Pj4gICA/
IF9yYXdfc3Bpbl9sb2NrX2lycXNhdmUrMHgzNi8weDcwCj4+Pj4+ICAgPyBfcmF3X3NwaW5fdW5s
b2NrX2lycXJlc3RvcmUrMHgxYS8weDQwCj4+Pj4+ICAgPyBfX3dha2VfdXArMHg3MC8weDE5MAo+
Pj4+PiAgIHZpcnRuZXRfc2V0X2ZlYXR1cmVzKzB4OTAvMHhmMCBbdmlydGlvX25ldF0KPj4+Pj4g
ICBfX25ldGRldl91cGRhdGVfZmVhdHVyZXMrMHgyNzEvMHg5ODAKPj4+Pj4gICA/IG5sbXNnX25v
dGlmeSsweDViLzB4YTAKPj4+Pj4gICBkZXZfZGlzYWJsZV9scm8rMHgyYi8weDE5MAo+Pj4+PiAg
ID8gaW5ldF9uZXRjb25mX25vdGlmeV9kZXZjb25mKzB4ZTIvMHgxMjAKPj4+Pj4gICBkZXZpbmV0
X3N5c2N0bF9mb3J3YXJkKzB4MTc2LzB4MWUwCj4+Pj4+ICAgcHJvY19zeXNfY2FsbF9oYW5kbGVy
KzB4MWYwLzB4MjUwCj4+Pj4+ICAgcHJvY19zeXNfd3JpdGUrMHhmLzB4MjAKPj4+Pj4gICBfX3Zm
c193cml0ZSsweDNlLzB4MTkwCj4+Pj4+ICAgPyBfX3NiX3N0YXJ0X3dyaXRlKzB4NmQvMHhkMAo+
Pj4+PiAgIHZmc193cml0ZSsweGQzLzB4MTkwCj4+Pj4+ICAga3N5c193cml0ZSsweDY4LzB4ZDAK
Pj4+Pj4gICBfX2lhMzJfc3lzX3dyaXRlKzB4MTQvMHgyMAo+Pj4+PiAgIGRvX2Zhc3Rfc3lzY2Fs
bF8zMisweDg2LzB4ZTAKPj4+Pj4gICBlbnRyeV9TWVNFTlRFUl9jb21wYXQrMHg3Yy8weDhlCj4+
Pj4+Cj4+Pj4+IEEgc2ltaWxhciBjcmFzaCB3aWxsIGxpa2VseSB0cmlnZ2VyIHdoZW4gZW5hYmxp
bmcgWERQLgo+Pj4+Pgo+Pj4+PiBSZXBvcnRlZC1ieTogQWxpc3RhaXIgRGVsdmEgPGFkZWx2YUBn
b29nbGUuY29tPgo+Pj4+PiBSZXBvcnRlZC1ieTogV2lsbGVtIGRlIEJydWlqbiA8d2lsbGVtZGVi
cnVpam4ua2VybmVsQGdtYWlsLmNvbT4KPj4+Pj4gRml4ZXM6IDNmOTM1MjJmZmFiMiAoInZpcnRp
by1uZXQ6IHN3aXRjaCBvZmYgb2ZmbG9hZHMgb24gZGVtYW5kIGlmIHBvc3NpYmxlIG9uIFhEUCBz
ZXQiKQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQu
Y29tPgo+Pj4+PiAtLS0KPj4+Pj4KPj4+Pj4gTGlnaHRseSB0ZXN0ZWQuCj4+Pj4+Cj4+Pj4+IEFs
aXN0YWlyLCBjb3VsZCB5b3UgcGxlYXNlIHRlc3QgYW5kIGNvbmZpcm0gdGhhdCB0aGlzIHJlc29s
dmVzIHRoZQo+Pj4+PiBjcmFzaCBmb3IgeW91Pwo+Pj4+IFRoaXMgcGF0Y2ggZG9lc24ndCB3b3Jr
LiBUaGUgcmVhc29uIGlzIHRoYXQgTkVUSUZfRl9MUk8gaXMgYWxzbyB0dXJuZWQKPj4+PiBvbiBi
eSBUU080L1RTTzYsIHdoaWNoIHlvdXIgcGF0Y2ggZGlkbid0IGNoZWNrIGZvci4gU28gaXQgZW5k
cyB1cAo+Pj4+IGdvaW5nIHRocm91Z2ggdGhlIHNhbWUgcGF0aCBhbmQgY3Jhc2hpbmcgaW4gdGhl
IHNhbWUgd2F5Lgo+Pj4+Cj4+Pj4gICAgICAgICAgaWYgKHZpcnRpb19oYXNfZmVhdHVyZSh2ZGV2
LCBWSVJUSU9fTkVUX0ZfR1VFU1RfVFNPNCkgfHwKPj4+PiAgICAgICAgICAgICAgdmlydGlvX2hh
c19mZWF0dXJlKHZkZXYsIFZJUlRJT19ORVRfRl9HVUVTVF9UU082KSkKPj4+PiAgICAgICAgICAg
ICAgICAgIGRldi0+ZmVhdHVyZXMgfD0gTkVUSUZfRl9MUk87Cj4+Pj4KPj4+PiBJdCBzb3VuZHMg
bGlrZSB0aGlzIHBhdGNoIGlzIGZpeGluZyBzb21ldGhpbmcgc2xpZ2h0bHkgZGlmZmVyZW50bHkg
dG8KPj4+PiBteSBwYXRjaCBmaXhlZC4gdmlydG5ldF9zZXRfZmVhdHVyZXMoKSBkb2Vzbid0IGNh
cmUgYWJvdXQKPj4+PiBHVUVTVF9PRkZMT0FEUywgaXQgb25seSB0ZXN0cyBhZ2FpbnN0IE5FVElG
X0ZfTFJPLiBFdmVuIGlmICJvZmZsb2FkcyIKPj4+PiBpcyB6ZXJvLCBpdCB3aWxsIGNhbGwgdmly
dG5ldF9zZXRfZ3Vlc3Rfb2ZmbG9hZHMoKSwgd2hpY2ggdHJpZ2dlcnMgdGhlCj4+Pj4gY3Jhc2gu
Cj4+Pgo+Pj4gSW50ZXJlc3RpbmcuIEl0J3Mgc3VycHJpc2luZyB0aGF0IGl0IGlzIHRyeWluZyB0
byBjb25maWd1cmUgYSBmbGFnCj4+PiB0aGF0IGlzIG5vdCBjb25maWd1cmFibGUsIGkuZS4sIGFi
c2VudCBmcm9tIGRldi0+aHdfZmVhdHVyZXMKPj4+IGFmdGVyIE1pY2hhZWwncyBjaGFuZ2UuCj4+
Pgo+Pj4+IFNvIGVpdGhlciB3ZSBuZWVkIHRvIGVuc3VyZSBORVRJRl9GX0xSTyBpcyBuZXZlciBz
ZXQsIG9yCj4+PiBMUk8gbWlnaHQgYmUgYXZhaWxhYmxlLCBqdXN0IG5vdCBjb25maWd1cmFibGUu
IEluZGVlZCB0aGlzIHdhcyB3aGF0IEkKPj4+IG9ic2VydmVkIGluIHRoZSBwYXN0Lgo+PiBkZXZf
ZGlzYWJsZV9scm8gZXhwZWN0cyB0aGF0IE5FVElGX0ZfTFJPIGlzIGFsd2F5cyBjb25maWd1cmFi
bGUuIFdoaWNoCj4+IEkgZ3Vlc3MgaXMgYSByZWFzb25hYmxlIGFzc3VtcHRpb24sIGp1c3Qgbm90
IG5lY2Vzc2FyaWx5IHRoZSBjYXNlIGluCj4+IHZpcnRpb19uZXQuCj4+Cj4+IFNvIEkgdGhpbmsg
d2UgbmVlZCBib3RoIHBhdGNoZXMuIENvcnJlY3RseSBtYXJrIHRoZSBmZWF0dXJlIGFzIGZpeGVk
Cj4+IGJ5IHJlbW92aW5nIGZyb20gZGV2LT5od19mZWF0dXJlcyBhbmQgYWxzbyBpZ25vcmUgdGhl
IHJlcXVlc3QgZnJvbQo+PiBkZXZfZGlzYWJsZV9scm8sIHdoaWNoIGRvZXMgbm90IGNoZWNrIGZv
ciB0aGlzLgo+IFNvbWV0aGluZyBsaWtlIHRoaXMgbWF5YmU6Cj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQvdmlydGlvX25ldC5jIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gaW5kZXgg
NGQ3ZDU0MzRjYzVkLi4wNTU2ZjQyYjBmYjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvdmly
dGlvX25ldC5jCj4gKysrIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gQEAgLTI1NjAsNiAr
MjU2MCw5IEBAIHN0YXRpYyBpbnQgdmlydG5ldF9zZXRfZmVhdHVyZXMoc3RydWN0IG5ldF9kZXZp
Y2UgKmRldiwKPiAgICAgICAgICB1NjQgb2ZmbG9hZHM7Cj4gICAgICAgICAgaW50IGVycjsKPgo+
ICsgICAgICAgaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUodmktPnZkZXYsIFZJUlRJT19ORVRfRl9D
VFJMX0dVRVNUX09GRkxPQURTKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICAg
ICAgICAgIGlmICgoZGV2LT5mZWF0dXJlcyBeIGZlYXR1cmVzKSAmIE5FVElGX0ZfTFJPKSB7Cj4g
ICAgICAgICAgICAgICAgICBpZiAodmktPnhkcF9xdWV1ZV9wYWlycykKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FQlVTWTsKPiBAQCAtMjk3MSw2ICsyOTc0LDE1IEBAIHN0YXRp
YyBpbnQgdmlydG5ldF92YWxpZGF0ZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiAgICAg
ICAgICBpZiAoIXZpcnRuZXRfdmFsaWRhdGVfZmVhdHVyZXModmRldikpCj4gICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKPgo+ICsgICAgICAgLyogVklSVElPX05FVF9GX0NUUkxfR1VF
U1RfT0ZGTE9BRFMgZG9lcyBub3Qgd29yayB3aXRob3V0Cj4gKyAgICAgICAgKiBWSVJUSU9fTkVU
X0ZfQ1RSTF9WUS4gSG93ZXZlciB0aGUgdmlydGlvIHNwZWMgZG9lcyBub3QKPiArICAgICAgICAq
IHNwZWNpZnkgdGhhdCBWSVJUSU9fTkVUX0ZfQ1RSTF9HVUVTVF9PRkZMT0FEUyBkZXBlbmRzCj4g
KyAgICAgICAgKiBvbiBWSVJUSU9fTkVUX0ZfQ1RSTF9WUSBzbyBkZXZpY2VzIGNhbiBzZXQgdGhl
IGxhdGVyIGJ1dAo+ICsgICAgICAgICogbm90IHRoZSBmb3JtZXIuCj4gKyAgICAgICAgKi8KPiAr
ICAgICAgIGlmICghdmlydGlvX2hhc19mZWF0dXJlKHZkZXYsIFZJUlRJT19ORVRfRl9DVFJMX1ZR
KSkKPiArICAgICAgICAgICAgICAgX192aXJ0aW9fY2xlYXJfYml0KHZkZXYsIFZJUlRJT19ORVRf
Rl9DVFJMX0dVRVNUX09GRkxPQURTKTsKPiArCj4gICAgICAgICAgaWYgKHZpcnRpb19oYXNfZmVh
dHVyZSh2ZGV2LCBWSVJUSU9fTkVUX0ZfTVRVKSkgewo+ICAgICAgICAgICAgICAgICAgaW50IG10
dSA9IHZpcnRpb19jcmVhZDE2KHZkZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgb2Zmc2V0b2Yoc3RydWN0IHZpcnRpb19uZXRfY29uZmlnLAo+CgpXZSBjaGVj
ayBmZWF0dXJlIGRlcGVuZGVuY3kgYW5kIGZhaWwgdGhlIHByb2JlIGluIAp2aXJ0bmV0X3ZhbGlk
YXRlX2ZlYXR1cmVzKCkuCgpJcyBpdCBtb3JlIHN0cmFpZ2h0Zm9yd2FyZCB0byBmYWlsIHRoZSBw
cm9iZSB0aGVyZSB3aGVuIApDVFJMX0dVRVNUX09GRkxPQURTIHdhcyBzZXQgYnV0IENUUkxfVlEg
d2Fzbid0PwoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
