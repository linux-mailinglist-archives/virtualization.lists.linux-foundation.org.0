Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD6D30EAE5
	for <lists.virtualization@lfdr.de>; Thu,  4 Feb 2021 04:27:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2799C86283;
	Thu,  4 Feb 2021 03:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2gs24G9-R2Ie; Thu,  4 Feb 2021 03:27:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A98398625B;
	Thu,  4 Feb 2021 03:27:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B397C1E6F;
	Thu,  4 Feb 2021 03:27:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8A2CC013A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 03:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BF9D1871BC
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 03:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S4Vi76+YznbP
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 03:27:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2EA488718C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 03:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612409241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SgrGwP9pSlN9XkvSPTbfVjb7jVcBKmy7XAWXtbmbkBs=;
 b=HT+Gs4x8ueYKh1V+GiYp+GttpGtsvNgAqHFxWzmjwHegayfcre77BipBKcv51kWm3PGXf0
 BU5Dq+rcZvxHh5Ow8gY5inXfRbsNcja1hMJrZBe9XUn976ry4PrdGQxpz/J/3+7x66HCEk
 KoTxNT+wSOCP/KbEgf8f76yMUiRVq10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-lEHQ8_kUOW-z6qVsvoxlkg-1; Wed, 03 Feb 2021 22:27:18 -0500
X-MC-Unique: lEHQ8_kUOW-z6qVsvoxlkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 847F98030B4;
 Thu,  4 Feb 2021 03:27:16 +0000 (UTC)
Received: from [10.72.14.1] (ovpn-14-1.pek2.redhat.com [10.72.14.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E7E5101E590;
 Thu,  4 Feb 2021 03:26:59 +0000 (UTC)
Subject: Re: [RFC 09/10] vhost: Route guest->host notification through shadow
 virtqueue
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-10-eperezma@redhat.com>
 <acb11542-52e0-a271-fd22-dff09daa032e@redhat.com>
 <CAJaqyWe_m3Ekmm5HjW_KZmi9CUL6JJ8Vd2pCtFgAJbfPXmiZCw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2e02fb06-985c-8d93-f4ce-24d108285ba6@redhat.com>
Date: Thu, 4 Feb 2021 11:26:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWe_m3Ekmm5HjW_KZmi9CUL6JJ8Vd2pCtFgAJbfPXmiZCw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Harpreet Singh Anand <hanand@xilinx.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
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

Ck9uIDIwMjEvMi8yIOS4i+WNiDY6MDgsIEV1Z2VuaW8gUGVyZXogTWFydGluIHdyb3RlOgo+IE9u
IE1vbiwgRmViIDEsIDIwMjEgYXQgNzoyOSBBTSBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQu
Y29tPiB3cm90ZToKPj4KPj4gT24gMjAyMS8xLzMwIOS4iuWNiDQ6NTQsIEV1Z2VuaW8gUMOpcmV6
IHdyb3RlOgo+Pj4gU2hhZG93IHZpcnRxdWV1ZSBub3RpZmljYXRpb25zIGZvcndhcmRpbmcgaXMg
ZGlzYWJsZWQgd2hlbiB2aG9zdF9kZXYKPj4+IHN0b3BzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IEV1Z2VuaW8gUMOpcmV6IDxlcGVyZXptYUByZWRoYXQuY29tPgo+Pj4gLS0tCj4+PiAgICBody92
aXJ0aW8vdmhvc3Qtc2hhZG93LXZpcnRxdWV1ZS5oIHwgICA1ICsrCj4+PiAgICBpbmNsdWRlL2h3
L3ZpcnRpby92aG9zdC5oICAgICAgICAgIHwgICA0ICsKPj4+ICAgIGh3L3ZpcnRpby92aG9zdC1z
aGFkb3ctdmlydHF1ZXVlLmMgfCAxMjMgKysrKysrKysrKysrKysrKysrKysrKysrKy0KPj4+ICAg
IGh3L3ZpcnRpby92aG9zdC5jICAgICAgICAgICAgICAgICAgfCAxMzUgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0KPj4+ICAgIDQgZmlsZXMgY2hhbmdlZCwgMjY0IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2h3L3ZpcnRpby92aG9zdC1zaGFk
b3ctdmlydHF1ZXVlLmggYi9ody92aXJ0aW8vdmhvc3Qtc2hhZG93LXZpcnRxdWV1ZS5oCj4+PiBp
bmRleCA2Y2MxOGQ2YWNiLi40NjZmOGFlNTk1IDEwMDY0NAo+Pj4gLS0tIGEvaHcvdmlydGlvL3Zo
b3N0LXNoYWRvdy12aXJ0cXVldWUuaAo+Pj4gKysrIGIvaHcvdmlydGlvL3Zob3N0LXNoYWRvdy12
aXJ0cXVldWUuaAo+Pj4gQEAgLTE3LDYgKzE3LDExIEBACj4+Pgo+Pj4gICAgdHlwZWRlZiBzdHJ1
Y3QgVmhvc3RTaGFkb3dWaXJ0cXVldWUgVmhvc3RTaGFkb3dWaXJ0cXVldWU7Cj4+Pgo+Pj4gK2Jv
b2wgdmhvc3Rfc2hhZG93X3ZxX3N0YXJ0X3JjdShzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsCj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZob3N0U2hhZG93VmlydHF1ZXVlICpzdnEp
Owo+Pj4gK3ZvaWQgdmhvc3Rfc2hhZG93X3ZxX3N0b3BfcmN1KHN0cnVjdCB2aG9zdF9kZXYgKmRl
diwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWaG9zdFNoYWRvd1ZpcnRxdWV1
ZSAqc3ZxKTsKPj4+ICsKPj4+ICAgIFZob3N0U2hhZG93VmlydHF1ZXVlICp2aG9zdF9zaGFkb3df
dnFfbmV3KHN0cnVjdCB2aG9zdF9kZXYgKmRldiwgaW50IGlkeCk7Cj4+Pgo+Pj4gICAgdm9pZCB2
aG9zdF9zaGFkb3dfdnFfZnJlZShWaG9zdFNoYWRvd1ZpcnRxdWV1ZSAqdnEpOwo+Pj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvaHcvdmlydGlvL3Zob3N0LmggYi9pbmNsdWRlL2h3L3ZpcnRpby92aG9z
dC5oCj4+PiBpbmRleCAyYmU3ODJjZWZkLi43MzJhNGIyYTJiIDEwMDY0NAo+Pj4gLS0tIGEvaW5j
bHVkZS9ody92aXJ0aW8vdmhvc3QuaAo+Pj4gKysrIGIvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3Qu
aAo+Pj4gQEAgLTU1LDYgKzU1LDggQEAgc3RydWN0IHZob3N0X2lvbW11IHsKPj4+ICAgICAgICBR
TElTVF9FTlRSWSh2aG9zdF9pb21tdSkgaW9tbXVfbmV4dDsKPj4+ICAgIH07Cj4+Pgo+Pj4gK3R5
cGVkZWYgc3RydWN0IFZob3N0U2hhZG93VmlydHF1ZXVlIFZob3N0U2hhZG93VmlydHF1ZXVlOwo+
Pj4gKwo+Pj4gICAgdHlwZWRlZiBzdHJ1Y3QgVmhvc3REZXZDb25maWdPcHMgewo+Pj4gICAgICAg
IC8qIFZob3N0IGRldmljZSBjb25maWcgc3BhY2UgY2hhbmdlZCBjYWxsYmFjawo+Pj4gICAgICAg
ICAqLwo+Pj4gQEAgLTgzLDcgKzg1LDkgQEAgc3RydWN0IHZob3N0X2RldiB7Cj4+PiAgICAgICAg
dWludDY0X3QgYmFja2VuZF9jYXA7Cj4+PiAgICAgICAgYm9vbCBzdGFydGVkOwo+Pj4gICAgICAg
IGJvb2wgbG9nX2VuYWJsZWQ7Cj4+PiArICAgIGJvb2wgc3dfbG1fZW5hYmxlZDsKPj4+ICAgICAg
ICB1aW50NjRfdCBsb2dfc2l6ZTsKPj4+ICsgICAgVmhvc3RTaGFkb3dWaXJ0cXVldWUgKipzaGFk
b3dfdnFzOwo+Pj4gICAgICAgIEVycm9yICptaWdyYXRpb25fYmxvY2tlcjsKPj4+ICAgICAgICBj
b25zdCBWaG9zdE9wcyAqdmhvc3Rfb3BzOwo+Pj4gICAgICAgIHZvaWQgKm9wYXF1ZTsKPj4+IGRp
ZmYgLS1naXQgYS9ody92aXJ0aW8vdmhvc3Qtc2hhZG93LXZpcnRxdWV1ZS5jIGIvaHcvdmlydGlv
L3Zob3N0LXNoYWRvdy12aXJ0cXVldWUuYwo+Pj4gaW5kZXggYzBjOTY3YTdjNS4uOTA4YzM2YzY2
ZCAxMDA2NDQKPj4+IC0tLSBhL2h3L3ZpcnRpby92aG9zdC1zaGFkb3ctdmlydHF1ZXVlLmMKPj4+
ICsrKyBiL2h3L3ZpcnRpby92aG9zdC1zaGFkb3ctdmlydHF1ZXVlLmMKPj4+IEBAIC04LDE1ICs4
LDEyOSBAQAo+Pj4gICAgICovCj4+Pgo+Pj4gICAgI2luY2x1ZGUgImh3L3ZpcnRpby92aG9zdC1z
aGFkb3ctdmlydHF1ZXVlLmgiCj4+PiArI2luY2x1ZGUgImh3L3ZpcnRpby92aG9zdC5oIgo+Pj4g
KyNpbmNsdWRlICJody92aXJ0aW8vdmlydGlvLWFjY2Vzcy5oIgo+Pj4gKwo+Pj4gKyNpbmNsdWRl
ICJzdGFuZGFyZC1oZWFkZXJzL2xpbnV4L3Zob3N0X3R5cGVzLmgiCj4+PiArI2luY2x1ZGUgInN0
YW5kYXJkLWhlYWRlcnMvbGludXgvdmlydGlvX3JpbmcuaCIKPj4+Cj4+PiAgICAjaW5jbHVkZSAi
cWVtdS9lcnJvci1yZXBvcnQuaCIKPj4+IC0jaW5jbHVkZSAicWVtdS9ldmVudF9ub3RpZmllci5o
Igo+Pj4gKyNpbmNsdWRlICJxZW11L21haW4tbG9vcC5oIgo+Pj4KPj4+ICAgIHR5cGVkZWYgc3Ry
dWN0IFZob3N0U2hhZG93VmlydHF1ZXVlIHsKPj4+ICAgICAgICBFdmVudE5vdGlmaWVyIGtpY2tf
bm90aWZpZXI7Cj4+PiAgICAgICAgRXZlbnROb3RpZmllciBjYWxsX25vdGlmaWVyOwo+Pj4gKyAg
ICBjb25zdCBzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICpodnE7Cj4+PiArICAgIFZpcnRJT0Rldmlj
ZSAqdmRldjsKPj4+ICsgICAgVmlydFF1ZXVlICp2cTsKPj4+ICAgIH0gVmhvc3RTaGFkb3dWaXJ0
cXVldWU7Cj4+Cj4+IFNvIGluc3RlYWQgb2YgZG9pbmcgdGhpbmdzIGF0IHZpcnRpbyBsZXZlbCwg
aG93IGFib3V0IGRvIHRoZSBzaGFkb3cKPj4gc3R1ZmZzIGF0IHZob3N0IGxldmVsPwo+Pgo+PiBJ
dCB3b3JrcyBsaWtlOgo+Pgo+PiB2aXJ0aW8gLT4gW3NoYWRvdyB2aG9zdCBiYWNrZW5kXSAtPiB2
aG9zdCBiYWNrZW5kCj4+Cj4+IFRoZW4gdGhlIFFNUCBpcyB1c2VkIHRvIHBsdWcgdGhlIHNoYWRv
dyB2aG9zdCBiYWNrZW5kIGluIHRoZSBtaWRkbGUgb3Igbm90Lgo+Pgo+PiBJdCBsb29rcyBraW5k
IG9mIGVhc2llciBzaW5jZSB3ZSBkb24ndCBuZWVkIHRvIGRlYWwgd2l0aCB2aXJ0cXVldWUKPj4g
aGFuZGxlcnMgZXRjLi4gSW5zdGVhZCwgd2UganVzdCBuZWVkIHRvIGRlYWwgd2l0aCBldmVudGZk
IHN0dWZmczoKPj4KPj4gV2hlbiBzaGFkb3cgdmhvc3QgbW9kZSBpcyBlbmFibGVkLCB3ZSBqdXN0
IGludGVyY2VwdCB0aGUgaG9zdF9ub3RpZmllcnMKPj4gYW5kIGd1ZXN0X25vdGlmaWVycy4gV2hl
biBpdCB3YXMgZGlzYWJsZWQsIHdlIGp1c3QgcGFzcyB0aGUgaG9zdC9ndWVzdAo+PiBub3RpZmll
cnMgdG8gdGhlIHJlYWwgdmhvc3QgYmFja2VuZHM/Cj4+Cj4gSGkgSmFzb24uCj4KPiBTdXJlIHdl
IGNhbiB0cnkgdGhhdCBtb2RlbCwgYnV0IGl0IHNlZW1zIHRvIG1lIHRoYXQgaXQgY29tZXMgd2l0
aCBhCj4gZGlmZmVyZW50IHNldCBvZiBwcm9ibGVtcy4KPgo+IEZvciBleGFtcGxlLCB0aGVyZSBh
cmUgY29kZSBpbiB2aG9zdC5jIHRoYXQgY2hlY2tzIGlmIGltcGxlbWVudGF0aW9ucwo+IGFyZSBh
dmFpbGFibGUgaW4gdmhvc3Rfb3BzLCBsaWtlOgo+Cj4gaWYgKGRldi0+dmhvc3Rfb3BzLT52aG9z
dF92cV9nZXRfYWRkcikgewo+ICAgICAgICAgIHIgPSBkZXYtPnZob3N0X29wcy0+dmhvc3RfdnFf
Z2V0X2FkZHIoZGV2LCAmYWRkciwgdnEpOwo+ICAgICAgICAgIC4uLgo+IH0KPgo+IEkgY2FuIGNv
dW50IDE0IG9mIHRoZXNlLCBjaGVja2luZzoKPgo+IGRldi0+dmhvc3Rfb3BzLT52aG9zdF9iYWNr
ZW5kX2Nhbl9tZXJnZQo+IGRldi0+dmhvc3Rfb3BzLT52aG9zdF9iYWNrZW5kX21lbV9zZWN0aW9u
X2ZpbHRlcgo+IGRldi0+dmhvc3Rfb3BzLT52aG9zdF9mb3JjZV9pb21tdQo+IGRldi0+dmhvc3Rf
b3BzLT52aG9zdF9yZXF1aXJlc19zaG1fbG9nCj4gZGV2LT52aG9zdF9vcHMtPnZob3N0X3NldF9i
YWNrZW5kX2NhcAo+IGRldi0+dmhvc3Rfb3BzLT52aG9zdF9zZXRfdnJpbmdfYnVzeWxvb3BfdGlt
ZW91dAo+IGRldi0+dmhvc3Rfb3BzLT52aG9zdF92cV9nZXRfYWRkcgo+IGhkZXYtPnZob3N0X29w
cy0+dmhvc3RfZGV2X3N0YXJ0Cj4gaGRldi0+dmhvc3Rfb3BzLT52aG9zdF9nZXRfY29uZmlnCj4g
aGRldi0+dmhvc3Rfb3BzLT52aG9zdF9nZXRfaW5mbGlnaHRfZmQKPiBoZGV2LT52aG9zdF9vcHMt
PnZob3N0X25ldF9zZXRfYmFja2VuZAo+IGhkZXYtPnZob3N0X29wcy0+dmhvc3Rfc2V0X2NvbmZp
Zwo+IGhkZXYtPnZob3N0X29wcy0+dmhvc3Rfc2V0X2luZmxpZ2h0X2ZkCj4gaGRldi0+dmhvc3Rf
b3BzLT52aG9zdF9zZXRfaW90bGJfY2FsbGJhY2sKPgo+IFNvIHdlIHNob3VsZCBJbXBsZW1lbnQg
YWxsIG9mIHRoZSB2aG9zdF9vcHMgY2FsbGJhY2tzLCBmb3J3YXJkaW5nIHRoZW0KPiB0byBhY3R1
YWwgdmhvc3RfYmFja2VkLCBhbmQgZGVsZXRlIGNvbmRpdGlvbmFsbHkgdGhlc2Ugb25lcz8gSW4g
b3RoZXIKPiB3b3JkcywgZHluYW1pY2FsbHkgZ2VuZXJhdGUgdGhlIG5ldyBzaGFkb3cgdnEgdmhv
c3Rfb3BzPyBJZiBhIG5ldwo+IGNhbGxiYWNrIGlzIGFkZGVkIHRvIGFueSB2aG9zdCBiYWNrZW5k
IGluIHRoZSBmdXR1cmUsIGRvIHdlIGhhdmUgdG8KPiBmb3JjZSB0aGUgYWRkaW5nIC8gY2hlY2tp
bmcgZm9yIE5VTEwgaW4gc2hhZG93IGJhY2tlbmQgdmhvc3Rfb3BzPwo+IFdvdWxkIHRoaXMgYmUg
YSBnb29kIG1vbWVudCB0byBjaGVjayBpZiBhbGwgYmFja2VuZHMgaW1wbGVtZW50IHRoZXNlCj4g
YW5kIGRlbGV0ZSB0aGUgY2hlY2tzPwoKCkkgdGhpbmsgaXQgd29uJ3QgYmUgZWFzeSBpZiB3ZSB3
YW50IHRvIHN1cHBvcnQgYWxsIGtpbmRzIG9mIHZob3N0IApiYWNrZW5kcyBmcm9tIHRoZSBzdGFy
dC4gU28gd2UgY2FuIGdvIHdpdGggdmhvc3QtdmRwYSBvbmUgZmlyc3QuCgpBY3R1YWxseSBob3cg
aXQgd29yayBtaWdodCBiZSBzb21ldGhpbmcgbGlrZSAobm8gbmVlZCB0byBzd2l0Y2ggCnZob3N0
X29wcywgd2UgY2FuIGRvIGV2ZXJ5dGhpbmcgc2lsZW50bHkgaW4gdGhlIG9wcykKCjEpIHdoZW4g
ZGV2aWNlIHRvIHN3aXRjaCB0byBzaGFkb3cgdnEgKGUuZyB2aWEgUU1QKQoyKSB2aG9zdC12ZHBh
IHdpbGwgc3RvcCBhbmQgc3luYyBzdGF0ZSAobGFzdF9hdmFpbF9pZHgpIGludGVybmFsbHkKMykg
cmVzZXQgdmhvc3QtdmRwYSwgY2xlYW4gY2FsbCBhbmQga2ljayBldmVudGZkCjQpIGFsbG9jYXRl
IHZxcyBmb3Igdmhvc3QtdmRwYSwgbmV3IGNhbGwgYW5kIGtpY2sgZXZlbnRmZCwgcmVzdGFydCAK
dmhvc3QtdmRwYQo1KSBzdGFydCB0aGUgc2hhZG93IHZxIChtYWtlIGl0IHN0YXJ0IGZvciBsYXN0
X2F2YWlsX2lkeCkKNikgaW50ZXJjZXB0IGlvZXZlbnRmZCBhbmQgZm9yd2FyZCB0aGUgcmVxdWVz
dCB0byBjYWxsZmQKNykgaW50ZXJjZXB0IGNhbGxmZCBhbmQgZm9yd2FyZCB0aGUgcmVxdWVzdCB0
byBpcnFmZAo4KSBmb3J3YXJkIHJlcXVlc3QgYmV0d2VlbiBzaGFkb3cgdmlydHF1ZXVlIGFuZCB2
aG9zdC12ZHBhCgoKPgo+IFRoZXJlIGFyZSBhbHNvIGNoZWNrcyBsaWtlOgo+Cj4gaWYgKGRldi0+
dmhvc3Rfb3BzLT5iYWNrZW5kX3R5cGUgPT0gVkhPU1RfQkFDS0VORF9UWVBFX1VTRVIpCj4KPiBI
b3cgd291bGQgc2hhZG93X3ZxIGJhY2tlbmQgZXhwb3NlIGl0c2VsZj8gKEkgZ3Vlc3MgYXMgdGhl
IGFjdHVhbCB1c2VkIGJhY2tlbmQpLgo+Cj4gSSBjYW4gbW9kaWZ5IHRoaXMgcGF0Y2hzZXQgdG8g
bm90IHJlbGF5IHRoZSBndWVzdC0+aG9zdCBub3RpZmljYXRpb25zCj4gb24gdnEgaGFuZGxlcnMg
YnV0IG9uIGV2ZW50ZmQgaGFuZGxlcnMuIEFsdGhvdWdoIHRoaXMgd2lsbCBtYWtlIGl0Cj4gaW5k
ZXBlbmRlbnQgb2YgdGhlIGFjdHVhbCB2aXJ0aW8gZGV2aWNlIGtpbmQgdXNlZCwgSSBjYW4gc2Vl
IHR3bwo+IGRyYXdiYWNrczoKPiAqIFRoZSBhY3R1YWwgZmFjdCB0aGF0IGl0IG1ha2VzIGl0IGlu
ZGVwZW5kZW50IG9mIHZpcnRpbyBkZXZpY2Uga2luZC4KPiBJZiBhIGRldmljZSBkb2VzIG5vdCB1
c2UgdGhlIG5vdGlmaWVycyBhbmQgcG9sbCB0aGUgcmluZyBieSBpdHNlbGYsIGl0Cj4gaGFzIG5v
IGNoYW5jZSBvZiBrbm93aW5nIHRoYXQgaXQgc2hvdWxkIHN0b3AuIFdoYXQgaGFwcGVucyBpZgo+
IHZpcnRpby1uZXQgdHggdGltZXIgaXMgYXJtZWQgd2hlbiB3ZSBzdGFydCBzaGFkb3cgdnE/LgoK
ClNvIGlmIHdlIGRvIHRoYXQgaW4gdmhvc3QgbGV2ZWwsIGl0J3MgYSB2aG9zdCBiYWNrZW5kIGZy
b20gdGhlIHZpcnRpbyAKbGF5ZXIuIFRoZW4gd2UgZG9uJ3QgbmVlZCB0byB3b3JyeSBhYm91dCB0
eCB0aW1lciBzdHVmZnMuCgoKPiAqIFRoZSBmaXhlcyAoY3VycmVudCBhbmQgZnV0dXJlKSBpbiB2
cSBub3RpZmljYXRpb25zLCBsaWtlIHRoZSBvbmUKPiBjdXJyZW50bHkgaW1wbGVtZW50ZWQgaW4g
dmlydGlvX25vdGlmeV9pcnFmZCBmb3Igd2luZG93cyBkcml2ZXJzCj4gcmVnYXJkaW5nIElTUiBi
aXQgMC4gSSB0aGluayB0aGlzIG9uZSBpbiBwYXJ0aWN1bGFyIGlzIE9LIG5vdCB0bwo+IGNhcnJ5
LCBidXQgSSB0aGluayBtYW55IGNoYW5nZXMgYWZmZWN0aW5nIGFueSBvZiB0aGUgZnVuY3Rpb25z
IHdpbGwKPiBoYXZlIHRvIGJlIG1pcnJvcmVkIGluIHRoZSBvdGhlci4KCgpDb25zaWRlciB3ZSBi
ZWhhdmUgbGlrZSBhIHZob3N0LCBpdCBqdXN0IHdvcmsgYXMgaW4gdGhlIHBhc3QgZm9yIG90aGVy
IAp0eXBlIG9mIHZob3N0IGJhY2tlbmRzIHdoZW4gTVNJLVggaXMgbm90IGVuYWJsZWQ/CgpUaGFu
a3MKCgo+Cj4gVGhvdWdodHMgb24gdGhpcz8KPgo+IFRoYW5rcyEKPgo+PiBUaGFua3MKPj4KPj4K
Pj4+ICtzdGF0aWMgdWludDE2X3Qgdmhvc3Rfc2hhZG93X3ZyaW5nX3VzZWRfZmxhZ3MoVmhvc3RT
aGFkb3dWaXJ0cXVldWUgKnN2cSkKPj4+ICt7Cj4+PiArICAgIGNvbnN0IHN0cnVjdCB2cmluZ191
c2VkICp1c2VkID0gc3ZxLT5odnEtPnVzZWQ7Cj4+PiArICAgIHJldHVybiB2aXJ0aW9fdHN3YXAx
NihzdnEtPnZkZXYsIHVzZWQtPmZsYWdzKTsKPj4+ICt9Cj4+PiArCj4+PiArc3RhdGljIGJvb2wg
dmhvc3Rfc2hhZG93X3ZyaW5nX3Nob3VsZF9raWNrKFZob3N0U2hhZG93VmlydHF1ZXVlICp2cSkK
Pj4+ICt7Cj4+PiArICAgIHJldHVybiAhKHZob3N0X3NoYWRvd192cmluZ191c2VkX2ZsYWdzKHZx
KSAmIFZSSU5HX1VTRURfRl9OT19OT1RJRlkpOwo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgdm9p
ZCB2aG9zdF9zaGFkb3dfdnJpbmdfa2ljayhWaG9zdFNoYWRvd1ZpcnRxdWV1ZSAqdnEpCj4+PiAr
ewo+Pj4gKyAgICBpZiAodmhvc3Rfc2hhZG93X3ZyaW5nX3Nob3VsZF9raWNrKHZxKSkgewo+Pj4g
KyAgICAgICAgZXZlbnRfbm90aWZpZXJfc2V0KCZ2cS0+a2lja19ub3RpZmllcik7Cj4+PiArICAg
IH0KPj4+ICt9Cj4+PiArCj4+PiArc3RhdGljIHZvaWQgaGFuZGxlX3NoYWRvd192cShWaXJ0SU9E
ZXZpY2UgKnZkZXYsIFZpcnRRdWV1ZSAqdnEpCj4+PiArewo+Pj4gKyAgICBzdHJ1Y3Qgdmhvc3Rf
ZGV2ICpoZGV2ID0gdmhvc3RfZGV2X2Zyb21fdmlydGlvKHZkZXYpOwo+Pj4gKyAgICB1aW50MTZf
dCBpZHggPSB2aXJ0aW9fZ2V0X3F1ZXVlX2luZGV4KHZxKTsKPj4+ICsKPj4+ICsgICAgVmhvc3RT
aGFkb3dWaXJ0cXVldWUgKnN2cSA9IGhkZXYtPnNoYWRvd192cXNbaWR4XTsKPj4+ICsKPj4+ICsg
ICAgdmhvc3Rfc2hhZG93X3ZyaW5nX2tpY2soc3ZxKTsKPj4+ICt9Cj4+PiArCj4+PiArLyoKPj4+
ICsgKiBTdGFydCBzaGFkb3cgdmlydHF1ZXVlIG9wZXJhdGlvbi4KPj4+ICsgKiBAZGV2IHZob3N0
IGRldmljZQo+Pj4gKyAqIEBzdnEgU2hhZG93IFZpcnRxdWV1ZQo+Pj4gKyAqCj4+PiArICogUnVu
IGluIFJDVSBjb250ZXh0Cj4+PiArICovCj4+PiArYm9vbCB2aG9zdF9zaGFkb3dfdnFfc3RhcnRf
cmN1KHN0cnVjdCB2aG9zdF9kZXYgKmRldiwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgVmhvc3RTaGFkb3dWaXJ0cXVldWUgKnN2cSkKPj4+ICt7Cj4+PiArICAgIGNvbnN0IFZp
cnRpb0RldmljZUNsYXNzICprID0gVklSVElPX0RFVklDRV9HRVRfQ0xBU1MoZGV2LT52ZGV2KTsK
Pj4+ICsgICAgRXZlbnROb3RpZmllciAqdnFfaG9zdF9ub3RpZmllciA9IHZpcnRpb19xdWV1ZV9n
ZXRfaG9zdF9ub3RpZmllcihzdnEtPnZxKTsKPj4+ICsgICAgdW5zaWduZWQgaWR4ID0gdmlydGlv
X3F1ZXVlX2dldF9pZHgoc3ZxLT52ZGV2LCBzdnEtPnZxKTsKPj4+ICsgICAgc3RydWN0IHZob3N0
X3ZyaW5nX2ZpbGUga2lja19maWxlID0gewo+Pj4gKyAgICAgICAgLmluZGV4ID0gaWR4LAo+Pj4g
KyAgICAgICAgLmZkID0gZXZlbnRfbm90aWZpZXJfZ2V0X2ZkKCZzdnEtPmtpY2tfbm90aWZpZXIp
LAo+Pj4gKyAgICB9Owo+Pj4gKyAgICBpbnQgcjsKPj4+ICsgICAgYm9vbCBvazsKPj4+ICsKPj4+
ICsgICAgLyogQ2hlY2sgdGhhdCBub3RpZmljYXRpb25zIGFyZSBzdGlsbCBnb2luZyBkaXJlY3Rs
eSB0byB2aG9zdCBkZXYgKi8KPj4+ICsgICAgYXNzZXJ0KHZpcnRpb19xdWV1ZV9ob3N0X25vdGlm
aWVyX3N0YXR1cyhzdnEtPnZxKSk7Cj4+PiArCj4+PiArICAgIG9rID0gay0+c2V0X3ZxX2hhbmRs
ZXIoZGV2LT52ZGV2LCBpZHgsIGhhbmRsZV9zaGFkb3dfdnEpOwo+Pj4gKyAgICBpZiAoIW9rKSB7
Cj4+PiArICAgICAgICBlcnJvcl9yZXBvcnQoIkNvdWxkbid0IHNldCB0aGUgdnEgaGFuZGxlciIp
Owo+Pj4gKyAgICAgICAgZ290byBlcnJfc2V0X2tpY2tfaGFuZGxlcjsKPj4+ICsgICAgfQo+Pj4g
Kwo+Pj4gKyAgICByID0gZGV2LT52aG9zdF9vcHMtPnZob3N0X3NldF92cmluZ19raWNrKGRldiwg
JmtpY2tfZmlsZSk7Cj4+PiArICAgIGlmIChyICE9IDApIHsKPj4+ICsgICAgICAgIGVycm9yX3Jl
cG9ydCgiQ291bGRuJ3Qgc2V0IGtpY2sgZmQ6ICVzIiwgc3RyZXJyb3IoZXJybm8pKTsKPj4+ICsg
ICAgICAgIGdvdG8gZXJyX3NldF92cmluZ19raWNrOwo+Pj4gKyAgICB9Cj4+PiArCj4+PiArICAg
IGV2ZW50X25vdGlmaWVyX3NldF9oYW5kbGVyKHZxX2hvc3Rfbm90aWZpZXIsCj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHZpcnRpb19xdWV1ZV9ob3N0X25vdGlmaWVyX3JlYWQp
Owo+Pj4gKyAgICB2aXJ0aW9fcXVldWVfc2V0X2hvc3Rfbm90aWZpZXJfZW5hYmxlZChzdnEtPnZx
LCBmYWxzZSk7Cj4+PiArICAgIHZpcnRpb19xdWV1ZV9ob3N0X25vdGlmaWVyX3JlYWQodnFfaG9z
dF9ub3RpZmllcik7Cj4+PiArCj4+PiArICAgIHJldHVybiB0cnVlOwo+Pj4gKwo+Pj4gK2Vycl9z
ZXRfdnJpbmdfa2ljazoKPj4+ICsgICAgay0+c2V0X3ZxX2hhbmRsZXIoZGV2LT52ZGV2LCBpZHgs
IE5VTEwpOwo+Pj4gKwo+Pj4gK2Vycl9zZXRfa2lja19oYW5kbGVyOgo+Pj4gKyAgICByZXR1cm4g
ZmFsc2U7Cj4+PiArfQo+Pj4gKwo+Pj4gKy8qCj4+PiArICogU3RvcCBzaGFkb3cgdmlydHF1ZXVl
IG9wZXJhdGlvbi4KPj4+ICsgKiBAZGV2IHZob3N0IGRldmljZQo+Pj4gKyAqIEBzdnEgU2hhZG93
IFZpcnRxdWV1ZQo+Pj4gKyAqCj4+PiArICogUnVuIGluIFJDVSBjb250ZXh0Cj4+PiArICovCj4+
PiArdm9pZCB2aG9zdF9zaGFkb3dfdnFfc3RvcF9yY3Uoc3RydWN0IHZob3N0X2RldiAqZGV2LAo+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZob3N0U2hhZG93VmlydHF1ZXVlICpz
dnEpCj4+PiArewo+Pj4gKyAgICBjb25zdCBWaXJ0aW9EZXZpY2VDbGFzcyAqayA9IFZJUlRJT19E
RVZJQ0VfR0VUX0NMQVNTKHN2cS0+dmRldik7Cj4+PiArICAgIHVuc2lnbmVkIGlkeCA9IHZpcnRp
b19xdWV1ZV9nZXRfaWR4KHN2cS0+dmRldiwgc3ZxLT52cSk7Cj4+PiArICAgIEV2ZW50Tm90aWZp
ZXIgKnZxX2hvc3Rfbm90aWZpZXIgPSB2aXJ0aW9fcXVldWVfZ2V0X2hvc3Rfbm90aWZpZXIoc3Zx
LT52cSk7Cj4+PiArICAgIHN0cnVjdCB2aG9zdF92cmluZ19maWxlIGtpY2tfZmlsZSA9IHsKPj4+
ICsgICAgICAgIC5pbmRleCA9IGlkeCwKPj4+ICsgICAgICAgIC5mZCA9IGV2ZW50X25vdGlmaWVy
X2dldF9mZCh2cV9ob3N0X25vdGlmaWVyKSwKPj4+ICsgICAgfTsKPj4+ICsgICAgaW50IHI7Cj4+
PiArCj4+PiArICAgIC8qIFJlc3RvcmUgdmhvc3Qga2ljayAqLwo+Pj4gKyAgICByID0gZGV2LT52
aG9zdF9vcHMtPnZob3N0X3NldF92cmluZ19raWNrKGRldiwgJmtpY2tfZmlsZSk7Cj4+PiArICAg
IC8qIENhbm5vdCBkbyBhIGxvdCBvZiB0aGluZ3MgKi8KPj4+ICsgICAgYXNzZXJ0KHIgPT0gMCk7
Cj4+PiArCj4+PiArICAgIGV2ZW50X25vdGlmaWVyX3NldF9oYW5kbGVyKHZxX2hvc3Rfbm90aWZp
ZXIsIE5VTEwpOwo+Pj4gKyAgICB2aXJ0aW9fcXVldWVfc2V0X2hvc3Rfbm90aWZpZXJfZW5hYmxl
ZChzdnEtPnZxLCB0cnVlKTsKPj4+ICsgICAgay0+c2V0X3ZxX2hhbmRsZXIoc3ZxLT52ZGV2LCBp
ZHgsIE5VTEwpOwo+Pj4gK30KPj4+ICsKPj4+ICAgIC8qCj4+PiAgICAgKiBDcmVhdGVzIHZob3N0
IHNoYWRvdyB2aXJ0cXVldWUsIGFuZCBpbnN0cnVjdCB2aG9zdCBkZXZpY2UgdG8gdXNlIHRoZSBz
aGFkb3cKPj4+ICAgICAqIG1ldGhvZHMgYW5kIGZpbGUgZGVzY3JpcHRvcnMuCj4+PiBAQCAtMjQs
OCArMTM4LDEzIEBAIHR5cGVkZWYgc3RydWN0IFZob3N0U2hhZG93VmlydHF1ZXVlIHsKPj4+ICAg
IFZob3N0U2hhZG93VmlydHF1ZXVlICp2aG9zdF9zaGFkb3dfdnFfbmV3KHN0cnVjdCB2aG9zdF9k
ZXYgKmRldiwgaW50IGlkeCkKPj4+ICAgIHsKPj4+ICAgICAgICBnX2F1dG9mcmVlIFZob3N0U2hh
ZG93VmlydHF1ZXVlICpzdnEgPSBnX25ldzAoVmhvc3RTaGFkb3dWaXJ0cXVldWUsIDEpOwo+Pj4g
KyAgICBpbnQgdnFfaWR4ID0gZGV2LT52aG9zdF9vcHMtPnZob3N0X2dldF92cV9pbmRleChkZXYs
IGRldi0+dnFfaW5kZXggKyBpZHgpOwo+Pj4gICAgICAgIGludCByOwo+Pj4KPj4+ICsgICAgc3Zx
LT52cSA9IHZpcnRpb19nZXRfcXVldWUoZGV2LT52ZGV2LCB2cV9pZHgpOwo+Pj4gKyAgICBzdnEt
Pmh2cSA9ICZkZXYtPnZxc1tpZHhdOwo+Pj4gKyAgICBzdnEtPnZkZXYgPSBkZXYtPnZkZXY7Cj4+
PiArCj4+PiAgICAgICAgciA9IGV2ZW50X25vdGlmaWVyX2luaXQoJnN2cS0+a2lja19ub3RpZmll
ciwgMCk7Cj4+PiAgICAgICAgaWYgKHIgIT0gMCkgewo+Pj4gICAgICAgICAgICBlcnJvcl9yZXBv
cnQoIkNvdWxkbid0IGNyZWF0ZSBraWNrIGV2ZW50IG5vdGlmaWVyOiAlcyIsCj4+PiBAQCAtNDAs
NyArMTU5LDcgQEAgVmhvc3RTaGFkb3dWaXJ0cXVldWUgKnZob3N0X3NoYWRvd192cV9uZXcoc3Ry
dWN0IHZob3N0X2RldiAqZGV2LCBpbnQgaWR4KQo+Pj4gICAgICAgICAgICBnb3RvIGVycl9pbml0
X2NhbGxfbm90aWZpZXI7Cj4+PiAgICAgICAgfQo+Pj4KPj4+IC0gICAgcmV0dXJuIHN2cTsKPj4+
ICsgICAgcmV0dXJuIGdfc3RlYWxfcG9pbnRlcigmc3ZxKTsKPj4+Cj4+PiAgICBlcnJfaW5pdF9j
YWxsX25vdGlmaWVyOgo+Pj4gICAgICAgIGV2ZW50X25vdGlmaWVyX2NsZWFudXAoJnN2cS0+a2lj
a19ub3RpZmllcik7Cj4+PiBkaWZmIC0tZ2l0IGEvaHcvdmlydGlvL3Zob3N0LmMgYi9ody92aXJ0
aW8vdmhvc3QuYwo+Pj4gaW5kZXggNDI4MzZlNDVmMy4uYmRlNjg4ZjI3OCAxMDA2NDQKPj4+IC0t
LSBhL2h3L3ZpcnRpby92aG9zdC5jCj4+PiArKysgYi9ody92aXJ0aW8vdmhvc3QuYwo+Pj4gQEAg
LTI1LDYgKzI1LDcgQEAKPj4+ICAgICNpbmNsdWRlICJleGVjL2FkZHJlc3Mtc3BhY2VzLmgiCj4+
PiAgICAjaW5jbHVkZSAiaHcvdmlydGlvL3ZpcnRpby1idXMuaCIKPj4+ICAgICNpbmNsdWRlICJo
dy92aXJ0aW8vdmlydGlvLWFjY2Vzcy5oIgo+Pj4gKyNpbmNsdWRlICJody92aXJ0aW8vdmhvc3Qt
c2hhZG93LXZpcnRxdWV1ZS5oIgo+Pj4gICAgI2luY2x1ZGUgIm1pZ3JhdGlvbi9ibG9ja2VyLmgi
Cj4+PiAgICAjaW5jbHVkZSAibWlncmF0aW9uL3FlbXUtZmlsZS10eXBlcy5oIgo+Pj4gICAgI2lu
Y2x1ZGUgInN5c2VtdS9kbWEuaCIKPj4+IEBAIC05NDUsNiArOTQ2LDgyIEBAIHN0YXRpYyB2b2lk
IHZob3N0X2xvZ19nbG9iYWxfc3RvcChNZW1vcnlMaXN0ZW5lciAqbGlzdGVuZXIpCj4+PiAgICAg
ICAgfQo+Pj4gICAgfQo+Pj4KPj4+ICtzdGF0aWMgaW50IHZob3N0X3N3X2xpdmVfbWlncmF0aW9u
X3N0b3Aoc3RydWN0IHZob3N0X2RldiAqZGV2KQo+Pj4gK3sKPj4+ICsgICAgaW50IGlkeDsKPj4+
ICsKPj4+ICsgICAgV0lUSF9SQ1VfUkVBRF9MT0NLX0dVQVJEKCkgewo+Pj4gKyAgICAgICAgZGV2
LT5zd19sbV9lbmFibGVkID0gZmFsc2U7Cj4+PiArCj4+PiArICAgICAgICBmb3IgKGlkeCA9IDA7
IGlkeCA8IGRldi0+bnZxczsgKytpZHgpIHsKPj4+ICsgICAgICAgICAgICB2aG9zdF9zaGFkb3df
dnFfc3RvcF9yY3UoZGV2LCBkZXYtPnNoYWRvd192cXNbaWR4XSk7Cj4+PiArICAgICAgICB9Cj4+
PiArICAgIH0KPj4+ICsKPj4+ICsgICAgZm9yIChpZHggPSAwOyBpZHggPCBkZXYtPm52cXM7ICsr
aWR4KSB7Cj4+PiArICAgICAgICB2aG9zdF9zaGFkb3dfdnFfZnJlZShkZXYtPnNoYWRvd192cXNb
aWR4XSk7Cj4+PiArICAgIH0KPj4+ICsKPj4+ICsgICAgZ19mcmVlKGRldi0+c2hhZG93X3Zxcyk7
Cj4+PiArICAgIGRldi0+c2hhZG93X3ZxcyA9IE5VTEw7Cj4+PiArICAgIHJldHVybiAwOwo+Pj4g
K30KPj4+ICsKPj4+ICtzdGF0aWMgaW50IHZob3N0X3N3X2xpdmVfbWlncmF0aW9uX3N0YXJ0KHN0
cnVjdCB2aG9zdF9kZXYgKmRldikKPj4+ICt7Cj4+PiArICAgIGludCBpZHg7Cj4+PiArCj4+PiAr
ICAgIGRldi0+c2hhZG93X3ZxcyA9IGdfbmV3MChWaG9zdFNoYWRvd1ZpcnRxdWV1ZSAqLCBkZXYt
Pm52cXMpOwo+Pj4gKyAgICBmb3IgKGlkeCA9IDA7IGlkeCA8IGRldi0+bnZxczsgKytpZHgpIHsK
Pj4+ICsgICAgICAgIGRldi0+c2hhZG93X3Zxc1tpZHhdID0gdmhvc3Rfc2hhZG93X3ZxX25ldyhk
ZXYsIGlkeCk7Cj4+PiArICAgICAgICBpZiAodW5saWtlbHkoZGV2LT5zaGFkb3dfdnFzW2lkeF0g
PT0gTlVMTCkpIHsKPj4+ICsgICAgICAgICAgICBnb3RvIGVycjsKPj4+ICsgICAgICAgIH0KPj4+
ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICBXSVRIX1JDVV9SRUFEX0xPQ0tfR1VBUkQoKSB7Cj4+PiAr
ICAgICAgICBmb3IgKGlkeCA9IDA7IGlkeCA8IGRldi0+bnZxczsgKytpZHgpIHsKPj4+ICsgICAg
ICAgICAgICBpbnQgc3RvcF9pZHggPSBpZHg7Cj4+PiArICAgICAgICAgICAgYm9vbCBvayA9IHZo
b3N0X3NoYWRvd192cV9zdGFydF9yY3UoZGV2LAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGRldi0+c2hhZG93X3Zxc1tpZHhdKTsKPj4+ICsKPj4+
ICsgICAgICAgICAgICBpZiAoIW9rKSB7Cj4+PiArICAgICAgICAgICAgICAgIHdoaWxlICgtLXN0
b3BfaWR4ID49IDApIHsKPj4+ICsgICAgICAgICAgICAgICAgICAgIHZob3N0X3NoYWRvd192cV9z
dG9wX3JjdShkZXYsIGRldi0+c2hhZG93X3Zxc1tzdG9wX2lkeF0pOwo+Pj4gKyAgICAgICAgICAg
ICAgICB9Cj4+PiArCj4+PiArICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+Pj4gKyAgICAgICAg
ICAgIH0KPj4+ICsgICAgICAgIH0KPj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICBkZXYtPnN3X2xt
X2VuYWJsZWQgPSB0cnVlOwo+Pj4gKyAgICByZXR1cm4gMDsKPj4+ICsKPj4+ICtlcnI6Cj4+PiAr
ICAgIGZvciAoOyBpZHggPj0gMDsgLS1pZHgpIHsKPj4+ICsgICAgICAgIHZob3N0X3NoYWRvd192
cV9mcmVlKGRldi0+c2hhZG93X3Zxc1tpZHhdKTsKPj4+ICsgICAgfQo+Pj4gKyAgICBnX2ZyZWUo
ZGV2LT5zaGFkb3dfdnFzW2lkeF0pOwo+Pj4gKwo+Pj4gKyAgICByZXR1cm4gLTE7Cj4+PiArfQo+
Pj4gKwo+Pj4gK3N0YXRpYyBpbnQgdmhvc3Rfc3dfbGl2ZV9taWdyYXRpb25fZW5hYmxlKHN0cnVj
dCB2aG9zdF9kZXYgKmRldiwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBib29sIGVuYWJsZV9sbSkKPj4+ICt7Cj4+PiArICAgIGludCByOwo+Pj4gKwo+Pj4g
KyAgICBpZiAoZW5hYmxlX2xtID09IGRldi0+c3dfbG1fZW5hYmxlZCkgewo+Pj4gKyAgICAgICAg
cmV0dXJuIDA7Cj4+PiArICAgIH0KPj4+ICsKPj4+ICsgICAgciA9IGVuYWJsZV9sbSA/IHZob3N0
X3N3X2xpdmVfbWlncmF0aW9uX3N0YXJ0KGRldikKPj4+ICsgICAgICAgICAgICAgICAgICA6IHZo
b3N0X3N3X2xpdmVfbWlncmF0aW9uX3N0b3AoZGV2KTsKPj4+ICsKPj4+ICsgICAgcmV0dXJuIHI7
Cj4+PiArfQo+Pj4gKwo+Pj4gICAgc3RhdGljIHZvaWQgdmhvc3RfbG9nX3N0YXJ0KE1lbW9yeUxp
c3RlbmVyICpsaXN0ZW5lciwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNZW1v
cnlSZWdpb25TZWN0aW9uICpzZWN0aW9uLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGludCBvbGQsIGludCBuZXcpCj4+PiBAQCAtMTM4OSw2ICsxNDY2LDcgQEAgaW50IHZob3N0
X2Rldl9pbml0KHN0cnVjdCB2aG9zdF9kZXYgKmhkZXYsIHZvaWQgKm9wYXF1ZSwKPj4+ICAgICAg
ICBoZGV2LT5sb2cgPSBOVUxMOwo+Pj4gICAgICAgIGhkZXYtPmxvZ19zaXplID0gMDsKPj4+ICAg
ICAgICBoZGV2LT5sb2dfZW5hYmxlZCA9IGZhbHNlOwo+Pj4gKyAgICBoZGV2LT5zd19sbV9lbmFi
bGVkID0gZmFsc2U7Cj4+PiAgICAgICAgaGRldi0+c3RhcnRlZCA9IGZhbHNlOwo+Pj4gICAgICAg
IG1lbW9yeV9saXN0ZW5lcl9yZWdpc3RlcigmaGRldi0+bWVtb3J5X2xpc3RlbmVyLCAmYWRkcmVz
c19zcGFjZV9tZW1vcnkpOwo+Pj4gICAgICAgIFFMSVNUX0lOU0VSVF9IRUFEKCZ2aG9zdF9kZXZp
Y2VzLCBoZGV2LCBlbnRyeSk7Cj4+PiBAQCAtMTgxNiw2ICsxODk0LDExIEBAIHZvaWQgdmhvc3Rf
ZGV2X3N0b3Aoc3RydWN0IHZob3N0X2RldiAqaGRldiwgVmlydElPRGV2aWNlICp2ZGV2KQo+Pj4g
ICAgICAgICAgICBoZGV2LT52aG9zdF9vcHMtPnZob3N0X2Rldl9zdGFydChoZGV2LCBmYWxzZSk7
Cj4+PiAgICAgICAgfQo+Pj4gICAgICAgIGZvciAoaSA9IDA7IGkgPCBoZGV2LT5udnFzOyArK2kp
IHsKPj4+ICsgICAgICAgIGlmIChoZGV2LT5zd19sbV9lbmFibGVkKSB7Cj4+PiArICAgICAgICAg
ICAgdmhvc3Rfc2hhZG93X3ZxX3N0b3BfcmN1KGhkZXYsIGhkZXYtPnNoYWRvd192cXNbaV0pOwo+
Pj4gKyAgICAgICAgICAgIHZob3N0X3NoYWRvd192cV9mcmVlKGhkZXYtPnNoYWRvd192cXNbaV0p
Owo+Pj4gKyAgICAgICAgfQo+Pj4gKwo+Pj4gICAgICAgICAgICB2aG9zdF92aXJ0cXVldWVfc3Rv
cChoZGV2LAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2ZGV2LAo+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoZGV2LT52cXMgKyBpLAo+Pj4gQEAgLTE4Mjks
NiArMTkxMiw4IEBAIHZvaWQgdmhvc3RfZGV2X3N0b3Aoc3RydWN0IHZob3N0X2RldiAqaGRldiwg
VmlydElPRGV2aWNlICp2ZGV2KQo+Pj4gICAgICAgICAgICBtZW1vcnlfbGlzdGVuZXJfdW5yZWdp
c3RlcigmaGRldi0+aW9tbXVfbGlzdGVuZXIpOwo+Pj4gICAgICAgIH0KPj4+ICAgICAgICB2aG9z
dF9sb2dfcHV0KGhkZXYsIHRydWUpOwo+Pj4gKyAgICBnX2ZyZWUoaGRldi0+c2hhZG93X3Zxcyk7
Cj4+PiArICAgIGhkZXYtPnN3X2xtX2VuYWJsZWQgPSBmYWxzZTsKPj4+ICAgICAgICBoZGV2LT5z
dGFydGVkID0gZmFsc2U7Cj4+PiAgICAgICAgaGRldi0+dmRldiA9IE5VTEw7Cj4+PiAgICB9Cj4+
PiBAQCAtMTg0NSw1ICsxOTMwLDUzIEBAIGludCB2aG9zdF9uZXRfc2V0X2JhY2tlbmQoc3RydWN0
IHZob3N0X2RldiAqaGRldiwKPj4+Cj4+PiAgICB2b2lkIHFtcF94X3Zob3N0X2VuYWJsZV9zaGFk
b3dfdnEoY29uc3QgY2hhciAqbmFtZSwgYm9vbCBlbmFibGUsIEVycm9yICoqZXJycCkKPj4+ICAg
IHsKPj4+IC0gICAgZXJyb3Jfc2V0ZyhlcnJwLCAiU2hhZG93IHZpcnRxdWV1ZSBzdGlsbCBub3Qg
aW1wbGVtZW50ZWQuIik7Cj4+PiArICAgIHN0cnVjdCB2aG9zdF9kZXYgKmhkZXY7Cj4+PiArICAg
IGNvbnN0IGNoYXIgKmVycl9jYXVzZSA9IE5VTEw7Cj4+PiArICAgIGNvbnN0IFZpcnRpb0Rldmlj
ZUNsYXNzICprOwo+Pj4gKyAgICBpbnQgcjsKPj4+ICsgICAgRXJyb3JDbGFzcyBlcnJfY2xhc3Mg
PSBFUlJPUl9DTEFTU19HRU5FUklDX0VSUk9SOwo+Pj4gKwo+Pj4gKyAgICBRTElTVF9GT1JFQUNI
KGhkZXYsICZ2aG9zdF9kZXZpY2VzLCBlbnRyeSkgewo+Pj4gKyAgICAgICAgaWYgKGhkZXYtPnZk
ZXYgJiYgMCA9PSBzdHJjbXAoaGRldi0+dmRldi0+bmFtZSwgbmFtZSkpIHsKPj4+ICsgICAgICAg
ICAgICBicmVhazsKPj4+ICsgICAgICAgIH0KPj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICBpZiAo
IWhkZXYpIHsKPj4+ICsgICAgICAgIGVycl9jbGFzcyA9IEVSUk9SX0NMQVNTX0RFVklDRV9OT1Rf
Rk9VTkQ7Cj4+PiArICAgICAgICBlcnJfY2F1c2UgPSAiRGV2aWNlIG5vdCBmb3VuZCI7Cj4+PiAr
ICAgICAgICBnb3RvIGVycjsKPj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICBpZiAoIWhkZXYtPnN0
YXJ0ZWQpIHsKPj4+ICsgICAgICAgIGVycl9jYXVzZSA9ICJEZXZpY2UgaXMgbm90IHN0YXJ0ZWQi
Owo+Pj4gKyAgICAgICAgZ290byBlcnI7Cj4+PiArICAgIH0KPj4+ICsKPj4+ICsgICAgaWYgKGhk
ZXYtPmFja2VkX2ZlYXR1cmVzICYgQklUX1VMTChWSVJUSU9fRl9SSU5HX1BBQ0tFRCkpIHsKPj4+
ICsgICAgICAgIGVycl9jYXVzZSA9ICJVc2UgcGFja2VkIHZxIjsKPj4+ICsgICAgICAgIGdvdG8g
ZXJyOwo+Pj4gKyAgICB9Cj4+PiArCj4+PiArICAgIGlmICh2aG9zdF9kZXZfaGFzX2lvbW11KGhk
ZXYpKSB7Cj4+PiArICAgICAgICBlcnJfY2F1c2UgPSAiRGV2aWNlIHVzZSBJT01NVSI7Cj4+PiAr
ICAgICAgICBnb3RvIGVycjsKPj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICBrID0gVklSVElPX0RF
VklDRV9HRVRfQ0xBU1MoaGRldi0+dmRldik7Cj4+PiArICAgIGlmICghay0+c2V0X3ZxX2hhbmRs
ZXIpIHsKPj4+ICsgICAgICAgIGVycl9jYXVzZSA9ICJWaXJ0aW8gZGV2aWNlIHR5cGUgZG9lcyBu
b3Qgc3VwcG9ydCByZXNldCBvZiB2cSBoYW5kbGVyIjsKPj4+ICsgICAgICAgIGdvdG8gZXJyOwo+
Pj4gKyAgICB9Cj4+PiArCj4+PiArICAgIHIgPSB2aG9zdF9zd19saXZlX21pZ3JhdGlvbl9lbmFi
bGUoaGRldiwgZW5hYmxlKTsKPj4+ICsgICAgaWYgKHVubGlrZWx5KHIpKSB7Cj4+PiArICAgICAg
ICBlcnJfY2F1c2UgPSAiRXJyb3IgZW5hYmxpbmcgKHNlZSBtb25pdG9yKSI7Cj4+PiArICAgIH0K
Pj4+ICsKPj4+ICtlcnI6Cj4+PiArICAgIGlmIChlcnJfY2F1c2UpIHsKPj4+ICsgICAgICAgIGVy
cm9yX3NldChlcnJwLCBlcnJfY2xhc3MsCj4+PiArICAgICAgICAgICAgICAgICAgIkNhbid0IGVu
YWJsZSBzaGFkb3cgdnEgb24gJXM6ICVzIiwgbmFtZSwgZXJyX2NhdXNlKTsKPj4+ICsgICAgfQo+
Pj4gICAgfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
