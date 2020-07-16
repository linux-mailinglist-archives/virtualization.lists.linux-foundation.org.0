Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E3B221D8B
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 09:43:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 847BB8AE2E;
	Thu, 16 Jul 2020 07:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-gyNUmxJXyM; Thu, 16 Jul 2020 07:43:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CF8AB8AE75;
	Thu, 16 Jul 2020 07:43:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E684C08A5;
	Thu, 16 Jul 2020 07:43:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A596C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 07:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 584638A605
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 07:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjptXoZKP1Gv
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 07:43:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 91B4D8A5FD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594885381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/M1LdeciBf3NeuOyb67GFpMFVConif4B3xfVjnjlr4=;
 b=Dle/UjR1VL1UrvKRlfFgJ7+b2IEkr3FJDRk9q/d98m5RampJzfS4Jg73MU4YD0RXeX132o
 q6GZx0ZI8As8qleZHVyJgIlzyHfN+OKuV9wQmylIDWJkx6eVTMZgFbo1kt76Hn265LGTnP
 gPALURloq+QSpfjEMgzZLyasniL1ziA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-Rjqs5vsRO-SAkXazgbMtiQ-1; Thu, 16 Jul 2020 03:42:59 -0400
X-MC-Unique: Rjqs5vsRO-SAkXazgbMtiQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D56941800D42;
 Thu, 16 Jul 2020 07:42:58 +0000 (UTC)
Received: from [10.72.12.131] (ovpn-12-131.pek2.redhat.com [10.72.12.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B7CB2B6D6;
 Thu, 16 Jul 2020 07:42:54 +0000 (UTC)
Subject: Re: [PATCH RFC don't apply] vdpa_sim: endian-ness for config space
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200715135540.22832-1-mst@redhat.com>
 <8f39dcc1-0899-7ed8-8a6e-75672417b9e3@redhat.com>
 <20200716013306-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b3872628-5cf2-911b-4e3b-748824243366@redhat.com>
Date: Thu, 16 Jul 2020 15:42:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716013306-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNy8xNiDkuIvljYgxOjQyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBKdWwgMTUsIDIwMjAgYXQgMTA6MDI6MzJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC83LzE1IOS4i+WNiDk6NTgsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IFZEUEEgc2ltIHN0b3JlcyBjb25maWcgc3BhY2UgYXMgbmF0aXZlIGVuZGlhbiwgYnV0IHRoYXQK
Pj4+IGlzIHdyb25nOiBtb2Rlcm4gZ3Vlc3RzIGV4cGVjdCBMRS4KPj4+IEkgY29kZWQgdXAgdGhl
IGZvbGxvd2luZyB0byBmaXggaXQgdXAsIGJ1dCBpdCBpcyB3cm9uZyB0b286Cj4+PiB2ZHBhc2lt
X2NyZWF0ZSBpcyBjYWxsZWQgYmVmb3JlIGd1ZXN0IGZlYXR1cmVzIGFyZSBrbm93bi4KPj4+Cj4+
PiBTbyB3aGF0IHNob3VsZCB3ZSBkbz8gTmV3IGlvY3RsIHRvIHNwZWNpZnkgdGhlIGludGVyZmFj
ZSB1c2VkPwo+Pj4gTW9yZSBpZGVhcz8KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMu
IFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgo+Pgo+PiBDYW4gd2UgZG8gdGhlIGVuZGlhbiBjb252
ZXJzaW9uIGluIHNldF9jb25maWcvZ2V0X2NvbmZpZygpPwo+Pgo+PiBUaGFua3MKPiBUaGF0IGlz
IHByb2JsZW1hdGljIGF0IGxlYXN0IGZyb20gc3RhdGljIGNoZWNraW5nIHBvaW50IG9mIHZpZXcu
CgoKSSBkb24ndCBnZXQgaGVyZS4gSSB0aG91Z2h0IGl0J3MganVzdCBsZVhYX3RvX2NwdSgpIGNv
bnZlcnNpb24gaW4gCnNldF9jb25maWcoKS9nZXRfY29uZmlnKCkgYXMgd2hhdCBpcyBkb25lIGlu
IE1NSU8ncyB2bV9zZXQvdm1fZ2V0LgoKCj4gSXQgd291bGQgYmUgcmVhc29uYWJsZSB0byBkbyBp
dCBpbiB2ZHBhc2ltX3NldF9mZWF0dXJlcywgZXhjZXB0Cj4gbGVnYWN5IGd1ZXN0cyBtaWdodCBu
b3Qgc2V0IGZlYXR1cmVzIGF0IGFsbC4KPiBTbyBteSBwcm9wb3NhbCBpczoKPiAtIHNldCBjb25m
aWcgaW4gdmRwYXNpbV9zZXRfZmVhdHVyZXMKCgpKdXN0IHRvIG1ha2Ugc3VyZSBJIHVuZGVyc3Rh
bmQgaGVyZS4gV2hhdCdzIHRoZSBtZWFuaW5nIG9mICJzZXQgY29uZmlnIiAKZG8geW91IG1lYW4g
c2V0dXAgdGhlIGNvbmZpZyBzcGFjZT8gSWYgeWVzLCBhbmQgaWYgdGhlcmUncyBhIGRldmljZSAK
Y29uZmlnIHNwYWNlLCB3ZSBzdGlsbCBuZWVkIHRvIGRvIHRoZSBlbmRpYW4gY29udmVyc2lvbj8K
Cgo+IC0gZG9jdW1lbnQgdGhhdCB0aGlzIGlzIHdoZXJlIGRldmljZXMgc2hvdWxkIGluaXRpYWxp
emUgY29uZmlnCj4gLSB2ZHBhIGNvcmUgd2lsbCBtYWludGFpbiBhICJmZWF0dXJlcyBzZXQiIGZs
YWcsIGlmIGdldC9zZXQgY29uZmlnCj4gICAgaXMgY2FsbGVkIHdpdGhvdXQgc2V0IGZlYXR1cmVz
LCBjb3JlIHdpbGwgY2FsbCBzZXQgZmVhdHVyZXMKPiAgICBhdXRvbWF0aWNhbGx5IHdpdGggMCB2
YWx1ZS4KCgpPaywgSSB0aGluayB5b3UgbWVhbnQgY2hlY2tpbmcgRkVBVFVSRV9PSyB2aWEgZ2V0
X3N0YXR1cyBpbiB2RFBBIGNvcmU/CgpUaGFua3MKCgoKPgo+IFRob3VnaHRzPwo+Cj4KPj4+Cj4+
PiAtLS0KPj4+ICAgIGRyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jIHwgMjIgKysrKysr
KysrKysrKysrKysrKystLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS92ZHBhX3Np
bS92ZHBhX3NpbS5jIGIvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPj4+IGluZGV4
IGE5YmM1ZTBmYjM1My4uY2M3NTRhZTBlYzE1IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy92ZHBh
L3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPj4+ICsrKyBiL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBh
X3NpbS5jCj4+PiBAQCAtMjQsNiArMjQsNyBAQAo+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L2V0aGVy
ZGV2aWNlLmg+Cj4+PiAgICAjaW5jbHVkZSA8bGludXgvdnJpbmdoLmg+Cj4+PiAgICAjaW5jbHVk
ZSA8bGludXgvdmRwYS5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51eC92aXJ0aW9fYnl0ZW9yZGVyLmg+
Cj4+PiAgICAjaW5jbHVkZSA8bGludXgvdmhvc3RfaW90bGIuaD4KPj4+ICAgICNpbmNsdWRlIDx1
YXBpL2xpbnV4L3ZpcnRpb19jb25maWcuaD4KPj4+ICAgICNpbmNsdWRlIDx1YXBpL2xpbnV4L3Zp
cnRpb19uZXQuaD4KPj4+IEBAIC03Miw2ICs3MywyMyBAQCBzdHJ1Y3QgdmRwYXNpbSB7Cj4+PiAg
ICAJdTY0IGZlYXR1cmVzOwo+Pj4gICAgfTsKPj4+ICsvKiBUT0RPOiBjcm9zcy1lbmRpYW4gc3Vw
cG9ydCAqLwo+Pj4gK3N0YXRpYyBpbmxpbmUgYm9vbCB2ZHBhc2ltX2lzX2xpdHRsZV9lbmRpYW4o
c3RydWN0IHZkcGFzaW0gKnZkcGFzaW0pCj4+PiArewo+Pj4gKwlyZXR1cm4gdmlydGlvX2xlZ2Fj
eV9pc19saXR0bGVfZW5kaWFuKCkgfHwKPj4+ICsJCSh2ZHBhc2ltLT5mZWF0dXJlcyAmICgxVUxM
IDw8IFZJUlRJT19GX1ZFUlNJT05fMSkpOwo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgaW5saW5l
IHUxNiB2ZHBhc2ltMTZfdG9fY3B1KHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltLCBfX3ZpcnRpbzE2
IHZhbCkKPj4+ICt7Cj4+PiArCXJldHVybiBfX3ZpcnRpbzE2X3RvX2NwdSh2ZHBhc2ltX2lzX2xp
dHRsZV9lbmRpYW4odmRwYXNpbSksIHZhbCk7Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyBpbmxp
bmUgX192aXJ0aW8xNiBjcHVfdG9fdmRwYXNpbTE2KHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltLCB1
MTYgdmFsKQo+Pj4gK3sKPj4+ICsJcmV0dXJuIF9fY3B1X3RvX3ZpcnRpbzE2KHZkcGFzaW1faXNf
bGl0dGxlX2VuZGlhbih2ZHBhc2ltKSwgdmFsKTsKPj4+ICt9Cj4+PiArCj4+PiAgICBzdGF0aWMg
c3RydWN0IHZkcGFzaW0gKnZkcGFzaW1fZGV2Owo+Pj4gICAgc3RhdGljIHN0cnVjdCB2ZHBhc2lt
ICp2ZHBhX3RvX3NpbShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEpCj4+PiBAQCAtMzMyLDggKzM1
MCw4IEBAIHN0YXRpYyBzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbV9jcmVhdGUodm9pZCkKPj4+ICAg
IAkJZ290byBlcnJfaW9tbXU7Cj4+PiAgICAJY29uZmlnID0gJnZkcGFzaW0tPmNvbmZpZzsKPj4+
IC0JY29uZmlnLT5tdHUgPSAxNTAwOwo+Pj4gLQljb25maWctPnN0YXR1cyA9IFZJUlRJT19ORVRf
U19MSU5LX1VQOwo+Pj4gKwljb25maWctPm10dSA9IGNwdV90b192ZHBhc2ltMTYodmRwYXNpbSwg
MTUwMCk7Cj4+PiArCWNvbmZpZy0+c3RhdHVzID0gY3B1X3RvX3ZkcGFzaW0xNih2ZHBhc2ltLCBW
SVJUSU9fTkVUX1NfTElOS19VUCk7Cj4+PiAgICAJZXRoX3JhbmRvbV9hZGRyKGNvbmZpZy0+bWFj
KTsKPj4+ICAgIAl2cmluZ2hfc2V0X2lvdGxiKCZ2ZHBhc2ltLT52cXNbMF0udnJpbmcsIHZkcGFz
aW0tPmlvbW11KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
