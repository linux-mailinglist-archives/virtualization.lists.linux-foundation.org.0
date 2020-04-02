Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F8A19C3E0
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 16:21:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BEA5687F8B;
	Thu,  2 Apr 2020 14:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JYigN0ly9kmm; Thu,  2 Apr 2020 14:21:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F09DF87F79;
	Thu,  2 Apr 2020 14:21:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB03DC07FF;
	Thu,  2 Apr 2020 14:21:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D44A0C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BE12D866E5
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTUe5EIdXUXx
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:21:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DCA5C85FD4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585837281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rz5cHS4VTwbzrEglnf6iJdvfJeJuFYnGpHx5cg1Sn5I=;
 b=gi6NENtWOrb96CP0TkJ/8XjaDI4LbE9IysYnfHS6pTfqYFS8Wjpd05T1ihEbZqY9hsaf3r
 4a+Y1GFzGUXfACyRZ9kAICFhtMyY4ofgYuTjOB1sfNA5eOMi5APoX+/NRXRStBXCwjcFfl
 PV1t5vvRAG8Qa2/6rUG/yB1Oi1daW10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-EBVCtGpVPMW_QfhaVWx5Tg-1; Thu, 02 Apr 2020 10:21:20 -0400
X-MC-Unique: EBVCtGpVPMW_QfhaVWx5Tg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1E6EA0CC2;
 Thu,  2 Apr 2020 14:21:18 +0000 (UTC)
Received: from [10.72.12.172] (ovpn-12-172.pek2.redhat.com [10.72.12.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFBA0391;
 Thu,  2 Apr 2020 14:21:13 +0000 (UTC)
Subject: Re: [PATCH v2] virtio/test: fix up after IOTLB changes
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200402125406.9275-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9e71c603-300a-e13f-dcef-bc4f9386ac0e@redhat.com>
Date: Thu, 2 Apr 2020 22:21:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200402125406.9275-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMjAvNC8yIOS4i+WNiDg6NTUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBBbGxv
dyBidWlsZGluZyB2cmluZ2ggd2l0aG91dCBJT1RMQiAodGhhdCdzIHRoZSBjYXNlIGZvciB1c2Vy
c3BhY2UKPiBidWlsZHMsIHdpbGwgYmUgdXNlZnVsIGZvciBDQUlGL1ZPRCBkb3duIHRoZSByb2Fk
IHRvbykuCj4gVXBkYXRlIGZvciBBUEkgdHdlYWtzLgo+IERvbid0IGluY2x1ZGUgdnJpbmdoIHdp
dGggdXNlcnNwYWNlIGJ1aWxkcy4KPgo+IENjOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQu
Y29tPgo+IENjOiBFdWdlbmlvIFDDqXJleiA8ZXBlcmV6bWFAcmVkaGF0LmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgo+IC0tLQo+Cj4gY2hh
bmdlcyBmcm9tIHYxOgo+IAl1c2UgSVNfUkVBQ0hFQUJMRSB0byBmaXggZXJyb3IgcmVwb3J0ZWQg
YnkgYnVpbGQgYm90CgoKQWNrZWQtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+
CgoKCj4KPiAgIGRyaXZlcnMvdmhvc3QvdGVzdC5jICAgICAgICAgICAgICB8IDQgKystLQo+ICAg
ZHJpdmVycy92aG9zdC92cmluZ2guYyAgICAgICAgICAgIHwgNSArKysrKwo+ICAgaW5jbHVkZS9s
aW51eC92cmluZ2guaCAgICAgICAgICAgIHwgNiArKysrKysKPiAgIHRvb2xzL3ZpcnRpby9NYWtl
ZmlsZSAgICAgICAgICAgICB8IDUgKysrLS0KPiAgIHRvb2xzL3ZpcnRpby9nZW5lcmF0ZWQvYXV0
b2NvbmYuaCB8IDAKPiAgIDUgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy92aXJ0aW8vZ2VuZXJhdGVkL2F1
dG9jb25mLmgKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Rlc3QuYyBiL2RyaXZlcnMv
dmhvc3QvdGVzdC5jCj4gaW5kZXggMzk0ZTJlNWM3NzJkLi45YTNhMDkwMDVlMDMgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy92aG9zdC90ZXN0LmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L3Rlc3QuYwo+
IEBAIC0xMjAsNyArMTIwLDcgQEAgc3RhdGljIGludCB2aG9zdF90ZXN0X29wZW4oc3RydWN0IGlu
b2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmYpCj4gICAJdnFzW1ZIT1NUX1RFU1RfVlFdID0gJm4t
PnZxc1tWSE9TVF9URVNUX1ZRXTsKPiAgIAluLT52cXNbVkhPU1RfVEVTVF9WUV0uaGFuZGxlX2tp
Y2sgPSBoYW5kbGVfdnFfa2ljazsKPiAgIAl2aG9zdF9kZXZfaW5pdChkZXYsIHZxcywgVkhPU1Rf
VEVTVF9WUV9NQVgsIFVJT19NQVhJT1YsCj4gLQkJICAgICAgIFZIT1NUX1RFU1RfUEtUX1dFSUdI
VCwgVkhPU1RfVEVTVF9XRUlHSFQpOwo+ICsJCSAgICAgICBWSE9TVF9URVNUX1BLVF9XRUlHSFQs
IFZIT1NUX1RFU1RfV0VJR0hULCBOVUxMKTsKPiAgIAo+ICAgCWYtPnByaXZhdGVfZGF0YSA9IG47
Cj4gICAKPiBAQCAtMjI1LDcgKzIyNSw3IEBAIHN0YXRpYyBsb25nIHZob3N0X3Rlc3RfcmVzZXRf
b3duZXIoc3RydWN0IHZob3N0X3Rlc3QgKm4pCj4gICB7Cj4gICAJdm9pZCAqcHJpdiA9IE5VTEw7
Cj4gICAJbG9uZyBlcnI7Cj4gLQlzdHJ1Y3Qgdmhvc3RfdW1lbSAqdW1lbTsKPiArCXN0cnVjdCB2
aG9zdF9pb3RsYiAqdW1lbTsKPiAgIAo+ICAgCW11dGV4X2xvY2soJm4tPmRldi5tdXRleCk7Cj4g
ICAJZXJyID0gdmhvc3RfZGV2X2NoZWNrX293bmVyKCZuLT5kZXYpOwo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3Zob3N0L3ZyaW5naC5jIGIvZHJpdmVycy92aG9zdC92cmluZ2guYwo+IGluZGV4IGVl
MDQ5MWY1NzlhYy4uYmE4ZTBkNmNmZDk3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhvc3QvdnJp
bmdoLmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jCj4gQEAgLTEzLDkgKzEzLDExIEBA
Cj4gICAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3NsYWIu
aD4KPiAgICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPiArI2lmIElTX1JFQUNIQUJMRShDT05G
SUdfVkhPU1RfSU9UTEIpCj4gICAjaW5jbHVkZSA8bGludXgvYnZlYy5oPgo+ICAgI2luY2x1ZGUg
PGxpbnV4L2hpZ2htZW0uaD4KPiAgICNpbmNsdWRlIDxsaW51eC92aG9zdF9pb3RsYi5oPgo+ICsj
ZW5kaWYKPiAgICNpbmNsdWRlIDx1YXBpL2xpbnV4L3ZpcnRpb19jb25maWcuaD4KPiAgIAo+ICAg
c3RhdGljIF9fcHJpbnRmKDEsMikgX19jb2xkIHZvaWQgdnJpbmdoX2JhZChjb25zdCBjaGFyICpm
bXQsIC4uLikKPiBAQCAtMTA1OSw2ICsxMDYxLDggQEAgaW50IHZyaW5naF9uZWVkX25vdGlmeV9r
ZXJuKHN0cnVjdCB2cmluZ2ggKnZyaCkKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0wodnJpbmdoX25l
ZWRfbm90aWZ5X2tlcm4pOwo+ICAgCj4gKyNpZiBJU19SRUFDSEFCTEUoQ09ORklHX1ZIT1NUX0lP
VExCKQo+ICsKPiAgIHN0YXRpYyBpbnQgaW90bGJfdHJhbnNsYXRlKGNvbnN0IHN0cnVjdCB2cmlu
Z2ggKnZyaCwKPiAgIAkJCSAgIHU2NCBhZGRyLCB1NjQgbGVuLCBzdHJ1Y3QgYmlvX3ZlYyBpb3Zb
XSwKPiAgIAkJCSAgIGludCBpb3Zfc2l6ZSwgdTMyIHBlcm0pCj4gQEAgLTE0MTYsNSArMTQyMCw2
IEBAIGludCB2cmluZ2hfbmVlZF9ub3RpZnlfaW90bGIoc3RydWN0IHZyaW5naCAqdnJoKQo+ICAg
fQo+ICAgRVhQT1JUX1NZTUJPTCh2cmluZ2hfbmVlZF9ub3RpZnlfaW90bGIpOwo+ICAgCj4gKyNl
bmRpZgo+ICAgCj4gICBNT0RVTEVfTElDRU5TRSgiR1BMIik7Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvdnJpbmdoLmggYi9pbmNsdWRlL2xpbnV4L3ZyaW5naC5oCj4gaW5kZXggYmQwNTAz
Y2E2ZjhmLi45ZTI3NjNkN2MxNTkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC92cmluZ2gu
aAo+ICsrKyBiL2luY2x1ZGUvbGludXgvdnJpbmdoLmgKPiBAQCAtMTQsOCArMTQsMTAgQEAKPiAg
ICNpbmNsdWRlIDxsaW51eC92aXJ0aW9fYnl0ZW9yZGVyLmg+Cj4gICAjaW5jbHVkZSA8bGludXgv
dWlvLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICsjaWYgSVNfUkVBQ0hBQkxFKENP
TkZJR19WSE9TVF9JT1RMQikKPiAgICNpbmNsdWRlIDxsaW51eC9kbWEtZGlyZWN0aW9uLmg+Cj4g
ICAjaW5jbHVkZSA8bGludXgvdmhvc3RfaW90bGIuaD4KPiArI2VuZGlmCj4gICAjaW5jbHVkZSA8
YXNtL2JhcnJpZXIuaD4KPiAgIAo+ICAgLyogdmlydGlvX3Jpbmcgd2l0aCBpbmZvcm1hdGlvbiBu
ZWVkZWQgZm9yIGhvc3QgYWNjZXNzLiAqLwo+IEBAIC0yNTQsNiArMjU2LDggQEAgc3RhdGljIGlu
bGluZSBfX3ZpcnRpbzY0IGNwdV90b192cmluZ2g2NChjb25zdCBzdHJ1Y3QgdnJpbmdoICp2cmgs
IHU2NCB2YWwpCj4gICAJcmV0dXJuIF9fY3B1X3RvX3ZpcnRpbzY0KHZyaW5naF9pc19saXR0bGVf
ZW5kaWFuKHZyaCksIHZhbCk7Cj4gICB9Cj4gICAKPiArI2lmIElTX1JFQUNIQUJMRShDT05GSUdf
VkhPU1RfSU9UTEIpCj4gKwo+ICAgdm9pZCB2cmluZ2hfc2V0X2lvdGxiKHN0cnVjdCB2cmluZ2gg
KnZyaCwgc3RydWN0IHZob3N0X2lvdGxiICppb3RsYik7Cj4gICAKPiAgIGludCB2cmluZ2hfaW5p
dF9pb3RsYihzdHJ1Y3QgdnJpbmdoICp2cmgsIHU2NCBmZWF0dXJlcywKPiBAQCAtMjg0LDQgKzI4
OCw2IEBAIHZvaWQgdnJpbmdoX25vdGlmeV9kaXNhYmxlX2lvdGxiKHN0cnVjdCB2cmluZ2ggKnZy
aCk7Cj4gICAKPiAgIGludCB2cmluZ2hfbmVlZF9ub3RpZnlfaW90bGIoc3RydWN0IHZyaW5naCAq
dnJoKTsKPiAgIAo+ICsjZW5kaWYgLyogQ09ORklHX1ZIT1NUX0lPVExCICovCj4gKwo+ICAgI2Vu
ZGlmIC8qIF9MSU5VWF9WUklOR0hfSCAqLwo+IGRpZmYgLS1naXQgYS90b29scy92aXJ0aW8vTWFr
ZWZpbGUgYi90b29scy92aXJ0aW8vTWFrZWZpbGUKPiBpbmRleCBmMzNmMzJmMWQyMDguLmI1ODdi
OWE3YTEyNCAxMDA2NDQKPiAtLS0gYS90b29scy92aXJ0aW8vTWFrZWZpbGUKPiArKysgYi90b29s
cy92aXJ0aW8vTWFrZWZpbGUKPiBAQCAtNCw3ICs0LDcgQEAgdGVzdDogdmlydGlvX3Rlc3QgdnJp
bmdoX3Rlc3QKPiAgIHZpcnRpb190ZXN0OiB2aXJ0aW9fcmluZy5vIHZpcnRpb190ZXN0Lm8KPiAg
IHZyaW5naF90ZXN0OiB2cmluZ2hfdGVzdC5vIHZyaW5naC5vIHZpcnRpb19yaW5nLm8KPiAgIAo+
IC1DRkxBR1MgKz0gLWcgLU8yIC1XZXJyb3IgLVdhbGwgLUkuIC1JLi4vaW5jbHVkZS8gLUkgLi4v
Li4vdXNyL2luY2x1ZGUvIC1Xbm8tcG9pbnRlci1zaWduIC1mbm8tc3RyaWN0LW92ZXJmbG93IC1m
bm8tc3RyaWN0LWFsaWFzaW5nIC1mbm8tY29tbW9uIC1NTUQgLVVfRk9SVElGWV9TT1VSQ0UKPiAr
Q0ZMQUdTICs9IC1nIC1PMiAtV2Vycm9yIC1XYWxsIC1JLiAtSS4uL2luY2x1ZGUvIC1JIC4uLy4u
L3Vzci9pbmNsdWRlLyAtV25vLXBvaW50ZXItc2lnbiAtZm5vLXN0cmljdC1vdmVyZmxvdyAtZm5v
LXN0cmljdC1hbGlhc2luZyAtZm5vLWNvbW1vbiAtTU1EIC1VX0ZPUlRJRllfU09VUkNFIC1pbmNs
dWRlIC4uLy4uL2luY2x1ZGUvbGludXgva2NvbmZpZy5oCj4gICB2cGF0aCAlLmMgLi4vLi4vZHJp
dmVycy92aXJ0aW8gLi4vLi4vZHJpdmVycy92aG9zdAo+ICAgbW9kOgo+ICAgCSR7TUFLRX0gLUMg
YHB3ZGAvLi4vLi4gTT1gcHdkYC92aG9zdF90ZXN0IFY9JHtWfQo+IEBAIC0yMiw3ICsyMiw4IEBA
IE9PVF9DT05GSUdTPVwKPiAgIAlDT05GSUdfVkhPU1Q9bSBcCj4gICAJQ09ORklHX1ZIT1NUX05F
VD1uIFwKPiAgIAlDT05GSUdfVkhPU1RfU0NTST1uIFwKPiAtCUNPTkZJR19WSE9TVF9WU09DSz1u
Cj4gKwlDT05GSUdfVkhPU1RfVlNPQ0s9biBcCj4gKwlDT05GSUdfVkhPU1RfUklORz1uCj4gICBP
T1RfQlVJTEQ9S0NGTEFHUz0iLUkgIiR7T09UX1ZIT1NUfSAke01BS0V9IC1DICR7T09UX0tTUkN9
IFY9JHtWfQo+ICAgb290LWJ1aWxkOgo+ICAgCWVjaG8gIlVOU1VQUE9SVEVEISBEb24ndCB1c2Ug
dGhlIHJlc3VsdGluZyBtb2R1bGVzIGluIHByb2R1Y3Rpb24hIgo+IGRpZmYgLS1naXQgYS90b29s
cy92aXJ0aW8vZ2VuZXJhdGVkL2F1dG9jb25mLmggYi90b29scy92aXJ0aW8vZ2VuZXJhdGVkL2F1
dG9jb25mLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZTY5
ZGUyOWJiMmQxCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
